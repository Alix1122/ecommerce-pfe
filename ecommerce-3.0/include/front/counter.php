<div>
    <?php
    $idUtilisateur = $_SESSION['utilisateur']['id'] ?? 0;
    $panierUtilisateur = $_SESSION['panier'][$idUtilisateur] ?? [];

    // Récupérer la quantité (supporte les deux formats)
    if (isset($panierUtilisateur[$idProduit])) {
        if (is_array($panierUtilisateur[$idProduit])) {
            $qty = $panierUtilisateur[$idProduit]['quantite'];
            $tailleStockee = $panierUtilisateur[$idProduit]['taille'] ?? '';
        } else {
            $qty = $panierUtilisateur[$idProduit];
            $tailleStockee = '';
        }
    } else {
        $qty = 0;
        $tailleStockee = '';
    }

    if ($qty == 0) {
        $color = 'btn-primary';
        $button = '<i class="fa fa-light fa-cart-plus"></i>';
    } else {
        $button = '<i class="fa-solid fa-pencil"></i>';
    }
    ?>
    <?php if ($idUtilisateur !== 0): ?>
        <form method="post" class="counter d-flex" action="ajouter_panier.php">
            <button type="button" class="btn btn-primary mx-2 counter-moins" onclick="decrementQty(this)">-</button>
            <input type="hidden" name="id" value="<?php echo $idProduit ?>">
            <input type="hidden" name="taille" id="taille_<?php echo $idProduit ?>" value="<?php echo $tailleStockee ?>">
            <input class="form-control" value="<?php echo $qty ?>" type="number" name="qty"
                id="qty_<?php echo $idProduit ?>" max="99" style="width: 60px;" readonly>
            <button type="button" class="btn btn-primary mx-2 counter-plus" onclick="incrementQty(this)">+</button>
            <button class="btn btn-success btn-sm" type="submit" name="ajouter">
                <?= $button ?>
            </button>
            <?php if ($qty != 0): ?>
                <button formaction="supprimer_panier.php" class="btn btn-sm btn-danger mx-1" type="submit" name="supprimer">
                    <i class="fa-solid fa-trash"></i>
                </button>
            <?php endif; ?>
        </form>

        <script>
            function incrementQty(btn) {
                let form = btn.closest('form');
                let input = form.querySelector('input[name="qty"]');
                let newVal = parseInt(input.value) + 1;
                if (newVal <= 99) input.value = newVal;
            }

            function decrementQty(btn) {
                let form = btn.closest('form');
                let input = form.querySelector('input[name="qty"]');
                let newVal = parseInt(input.value) - 1;
                if (newVal >= 0) input.value = newVal;
            }

            // Récupérer la taille sélectionnée sur la page produit
            let sizeBtns = document.querySelectorAll('.size-btn');
            if (sizeBtns.length > 0) {
                sizeBtns.forEach(btn => {
                    btn.addEventListener('click', function () {
                        let taille = this.getAttribute('data-size');
                        let inputTaille = document.getElementById('taille_<?php echo $idProduit ?>');
                        if (inputTaille) inputTaille.value = taille;
                    });
                });
            }
        </script>
    <?php else: ?>
        <div class="alert alert-warning" role="alert">
            Vous devez être connecté pour acheter ce produit <strong><a href="../connexion.php">Connexion</a></strong>
        </div>
    <?php endif; ?>
</div>