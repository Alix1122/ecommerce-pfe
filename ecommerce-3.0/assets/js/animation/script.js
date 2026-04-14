// Bouton burger pour mobile
document.addEventListener("DOMContentLoaded", function () {
    let burgerBtn = document.querySelector(".navbar-toggler");
    let menu = document.querySelector(".navbar-collapse");

    if (burgerBtn && menu) {
        burgerBtn.addEventListener("click", function () {
            menu.classList.toggle("show");
        });
    }
});

// ===== GESTION DES TAILLES =====
document.addEventListener("DOMContentLoaded", function () {
    const sizeBtns = document.querySelectorAll(".size-btn");
    let selectedSize = null;

    sizeBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            // Enlever la classe active de tous les boutons
            sizeBtns.forEach((b) => b.classList.remove("active"));
            // Ajouter la classe active au bouton cliqué
            this.classList.add("active");
            // Stocker la taille sélectionnée
            selectedSize = this.getAttribute("data-size");
            console.log("Taille sélectionnée :", selectedSize);
        });
    });

    // Ajouter la taille au formulaire d'ajout au panier
    const addToCartForm = document.querySelector(".add-to-cart-form");
    if (addToCartForm) {
        addToCartForm.addEventListener("submit", function (e) {
            if (!selectedSize) {
                e.preventDefault();
                alert("Veuillez sélectionner une taille");
            } else {
                // Ajouter la taille dans le formulaire
                const input = document.createElement("input");
                input.type = "hidden";
                input.name = "taille";
                input.value = selectedSize;
                this.appendChild(input);
            }
        });
    }
});

// ===== LIGHTBOX - SEULEMENT SUR LA PAGE PRODUIT =====
document.addEventListener("DOMContentLoaded", function () {
    // Vérifier si on est sur la page produit (présence de l'image avec classe produit-image)
    const productImage = document.querySelector(".produit-image");

    // Si l'image produit n'existe pas, on ne fait rien (page index)
    if (!productImage) {
        return;
    }

    // Créer la lightbox dynamiquement (uniquement sur page produit)
    const lightbox = document.createElement("div");
    lightbox.id = "lightbox";
    lightbox.style.cssText = `
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.95);
        z-index: 9999;
        cursor: pointer;
        justify-content: center;
        align-items: center;
    `;

    const lightboxImg = document.createElement("img");
    lightboxImg.style.cssText = `
        max-width: 90%;
        max-height: 90%;
        object-fit: contain;
        border-radius: 8px;
        animation: zoomIn 0.3s ease;
    `;

    const closeBtn = document.createElement("span");
    closeBtn.innerHTML = "×";
    closeBtn.style.cssText = `
        position: absolute;
        top: 20px;
        right: 35px;
        font-size: 45px;
        color: white;
        cursor: pointer;
        font-family: Arial;
        transition: all 0.2s;
        z-index: 10000;
    `;

    closeBtn.addEventListener(
        "mouseenter",
        () => (closeBtn.style.color = "#ef476f"),
    );
    closeBtn.addEventListener(
        "mouseleave",
        () => (closeBtn.style.color = "white"),
    );

    lightbox.appendChild(closeBtn);
    lightbox.appendChild(lightboxImg);
    document.body.appendChild(lightbox);

    // Rendre l'image cliquable
    productImage.style.cursor = "pointer";
    productImage.style.transition = "transform 0.2s";

    productImage.addEventListener("mouseenter", () => {
        productImage.style.transform = "scale(1.02)";
    });
    productImage.addEventListener("mouseleave", () => {
        productImage.style.transform = "scale(1)";
    });

    // Ouvrir la lightbox
    productImage.addEventListener("click", function () {
        lightbox.style.display = "flex";
        lightboxImg.src = this.src;
        document.body.style.overflow = "hidden";
    });

    // Fermer la lightbox
    function closeLightbox() {
        lightbox.style.display = "none";
        document.body.style.overflow = "auto";
    }

    lightbox.addEventListener("click", function (e) {
        if (e.target === lightbox) {
            closeLightbox();
        }
    });

    closeBtn.addEventListener("click", function (e) {
        e.stopPropagation();
        closeLightbox();
    });

    document.addEventListener("keydown", function (e) {
        if (e.key === "Escape" && lightbox.style.display === "flex") {
            closeLightbox();
        }
    });
});

// Animation zoom
const style = document.createElement("style");
style.textContent = `
    @keyframes zoomIn {
        from {
            transform: scale(0.8);
            opacity: 0;
        }
        to {
            transform: scale(1);
            opacity: 1;
        }
    }
    #lightbox img {
        animation: zoomIn 0.3s ease;
    }
`;
document.head.appendChild(style);

// ===== BURGER MENU POUR MOBILE =====
document.addEventListener("DOMContentLoaded", function () {
    // Récupérer le bouton burger et le menu
    let burgerBtn = document.querySelector(".navbar-toggler");
    let menu = document.querySelector(".navbar-collapse");

    if (burgerBtn && menu) {
        // Clic sur le burger
        burgerBtn.addEventListener("click", function () {
            menu.classList.toggle("show");
        });

        // Fermer le menu si on clique en dehors (optionnel)
        document.addEventListener("click", function (event) {
            if (window.innerWidth <= 768) {
                if (
                    !burgerBtn.contains(event.target) &&
                    !menu.contains(event.target)
                ) {
                    menu.classList.remove("show");
                }
            }
        });
    }
});
