import {
    getCategories
} from "../api/foodApi.js";

import {
    loadFoods
} from "./food.js";


export async function loadCategories() {

    try {

        const categories =
            await getCategories();

        renderCategories(
            categories
        );

    } catch (error) {

        console.error(
            "Error loading categories:",
            error
        );

    }
}


function renderCategories(
    categories
) {

    const categoryList =
        document.querySelector(
            "#category-list"
        );


    categoryList.innerHTML = "";


    // All Menus

    const allCard =
        createCategoryCard({

            id: null,

            name: "All Menus",

            icon: "restaurant-outline"

        });


    categoryList.appendChild(
        allCard
    );


    // Categories from API

    categories.forEach(
        category => {

            const card =
                createCategoryCard(
                    category
                );

            categoryList.appendChild(
                card
            );

        }
    );

}


function createCategoryCard(
    category
) {

    const card =
        document.createElement(
            "div"
        );


    card.classList.add(
        "filter-card"
    );


    card.dataset.categoryId =
        category.id ?? "";


    card.innerHTML = `

        <div class="filter-icon">

            <ion-icon
                name="${
                    category.icon ||
                    "restaurant-outline"
                }">
            </ion-icon>

        </div>

        <p>
            ${category.name}
        </p>

    `;


    card.addEventListener(
        "click",
        function () {

            // Remove active from all cards

            document
                .querySelectorAll(
                    ".filter-card"
                )
                .forEach(card => {

                    card.classList.remove(
                        "active"
                    );

                });


            // Add active to clicked card

            this.classList.add(
                "active"
            );


            // Get category ID

            const categoryId =
                this.dataset.categoryId;


            // Load foods

            if (categoryId) {

                loadFoods(
                    categoryId
                );

            } else {

                loadFoods();

            }

        }
    );


    return card;
}