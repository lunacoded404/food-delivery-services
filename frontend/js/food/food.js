import {
    getFoodDetail,
    getFoods
} from "../api/foodApi.js";

import {
    addToCart
} from "../api/cartApi.js";

import {
    updateCartBadge
} from "../cart/cartBadge.js";


let currentFood = null;

let quantity = 1; 



/* =========================
   Get Food ID
========================= */

function getFoodImage(food) {
    return food.image;
}

function getFoodId() {

    const params =
        new URLSearchParams(
            window.location.search
        );

    return params.get("id");

}


/* =========================
   Load Food
========================= */

async function loadFood() {

    const foodId =
        getFoodId();


    const container =
        document.querySelector(
            "#food-detail-container"
        );


    if (!foodId) {

        container.innerHTML = `
            <p>
                Food not found.
            </p>
        `;

        return;

    }


    try {

        const food =
            await getFoodDetail(
                foodId
            );


        currentFood = food;

        renderFood(food);

        setupQuantity();

        setupAddToCart();

        loadRelatedFoods(
            food.category
        );

    } catch (error) {

        console.error(
            "Food detail error:",
            error
        );


        container.innerHTML = `
            <p>
                Failed to load food.
            </p>
        `;

    }

}


/* =========================
   Render Food
========================= */

function renderFood(food) {

    const container =
        document.querySelector(
            "#food-detail-container"
        );


    container.innerHTML = `

        <div class="food-detail-image-wrapper">

            <img
                src="${getFoodImage(food)}"
                alt="${food.name}"
                class="food-detail-image"
            >

        </div>


        <div class="food-detail-info">

            ${
                food.is_recommended
                    ? `
                        <div class="food-recommended">

                            <ion-icon
                                name="star">
                            </ion-icon>

                            Recommended

                        </div>
                    `
                    : ""
            }


            <span class="food-category">

                ${food.category_name || "Food"}

            </span>


            <h1 class="food-detail-name">

                ${food.name}

            </h1>


            <p class="food-detail-description">

                ${food.description}

            </p>


            <div class="food-detail-price">

                $${food.price}

            </div>


            <div class="quantity-wrapper">

                <span>
                    Quantity
                </span>


                <div class="quantity-control">

                    <button
                        class="quantity-btn"
                        id="quantity-minus"
                    >
                        −
                    </button>


                    <span
                        class="quantity-number"
                        id="quantity-number"
                    >
                        1
                    </span>


                    <button
                        class="quantity-btn"
                        id="quantity-plus"
                    >
                        +
                    </button>

                </div>

            </div>


            <button
                class="add-cart-btn"
                id="add-cart-btn"
            >

                <ion-icon
                    name="cart-outline">
                </ion-icon>

                Add to Cart

            </button>

        </div>

    `;

}

export async function searchFoods(
    keyword
) {

    const searchTerm =
        keyword.trim();


    await loadFoods(
        null,
        searchTerm
    );

}


/* =========================
   Quantity
========================= */

function setupQuantity() {

    const minusButton =
        document.querySelector(
            "#quantity-minus"
        );


    const plusButton =
        document.querySelector(
            "#quantity-plus"
        );


    const quantityNumber =
        document.querySelector(
            "#quantity-number"
        );


    minusButton.addEventListener(
        "click",
        () => {

            if (quantity > 1) {

                quantity--;

                quantityNumber.textContent =
                    quantity;

            }

        }
    );


    plusButton.addEventListener(
        "click",
        () => {

            quantity++;

            quantityNumber.textContent =
                quantity;

        }
    );

}


/* =========================
   Add To Cart
========================= */

/* =========================
   Add To Cart
========================= */

async function setupAddToCart() {

    const button =
        document.querySelector(
            "#add-cart-btn"
        );

    button.addEventListener(
        "click",
        async () => {

            if (!currentFood) return;

            const token =
                localStorage.getItem(
                    "access_token"
                );

            if (!token) {

                window.location.href =
                    "../auth/login.html";

                return;
            }

            try {

                button.disabled = true;

                button.textContent =
                    "Adding...";


                // =========================
                // Add food to cart
                // =========================

                await addToCart(
                    currentFood.id,
                    quantity
                );


                // =========================
                // Update cart badge
                // =========================

                try {

                    await updateCartBadge();

                } catch (error) {

                    console.error(
                        "Cart badge error:",
                        error
                    );

                }


                // =========================
                // Success
                // =========================

                alert(
                    `${currentFood.name} added to cart!`
                );


                quantity = 1;

                const quantityNumber =
                    document.querySelector(
                        "#quantity-number"
                    );

                if (quantityNumber) {

                    quantityNumber.textContent =
                        quantity;

                }

            } catch (error) {

                console.error(
                    "Add to cart error:",
                    error
                );

                alert(
                    "Failed to add food to cart."
                );

            } finally {

                button.disabled = false;

                button.innerHTML = `
                    <ion-icon
                        name="cart-outline"
                    ></ion-icon>

                    Add to Cart
                `;

            }

        }
    );
}


/* =========================
   Related Foods
========================= */

async function loadRelatedFoods(
    categoryId
) {

    const container =
        document.querySelector(
            "#related-food-list"
        );


    try {

        const foods =
            await getFoods(
                categoryId
            );


        const relatedFoods =
            foods
                .filter(
                    food =>
                        food.id !==
                        currentFood.id
                )
                .slice(0, 4);


        renderRelatedFoods(
            relatedFoods
        );

    } catch (error) {

        console.error(
            "Related food error:",
            error
        );

    }

}


/* =========================
   Render Related Foods
========================= */

function renderRelatedFoods(
    foods
) {

    const container =
        document.querySelector(
            "#related-food-list"
        );


    container.innerHTML = "";


    foods.forEach(
        food => {

            const card =
                document.createElement(
                    "div"
                );


            card.classList.add(
                "related-food-card"
            );


            card.innerHTML = `
                <img
                    src="${food.image}"
                    alt="${food.name}"
                    class="highlight-img"
                >

                <div class="highlight-desc">
                    <h4>${food.name}</h4>
                    <p class="food-description">${food.description}</p>
                    <p class="food-price">$${food.price}</p>
                </div>
            `;


            card.addEventListener(
                "click",
                () => {

                    window.location.href =
                        `./food.html?id=${food.id}`;

                }
            );


            container.appendChild(
                card
            );

        }
    );

}


/* =========================
   Initialize
========================= */

document.addEventListener(
    "DOMContentLoaded",
    loadFood
);