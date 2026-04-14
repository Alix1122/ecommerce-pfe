<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="../front/index.php">Ecommerce</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.php">Liste des catégories</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.php?id=1">Hoodies</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.php?id=2">Sabot</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.php?id=3">T-Shirt</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.php?id=4">Chemise</a>
                </li>
            </ul>
        </div>
        <?php
        $productCount = 0;
        if (isset($_SESSION['utilisateur'])) {
            $idUtilisateur = $_SESSION['utilisateur']['id'];
            $productCount = count($_SESSION['panier'][$idUtilisateur] ?? []);
        }
        function calculerRemise($prix, $discount)
        {
            return $prix - (($prix * $discount) / 100);
        }

        ?>
        <a class="btn float-end" href="panier.php"><i class="fa-solid fa-cart-shopping"></i> Panier
            (<?php echo $productCount; ?>)</a>
    </div>
</nav>