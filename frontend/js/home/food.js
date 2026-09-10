import {
    getFoods
} from "../api/foodApi.js";


let currentFoods = [];

let currentPage = 0;

const FOODS_PER_PAGE = 9;


export async function loadFoods(
    categoryId = null,
    search = ""
) {

    try {

        const foods =
            await getFoods(
                categoryId,
                search
            );


        currentFoods = foods;

        currentPage = 0;


        renderFoods();

        setupFoodPagination();

    } catch (error) {

        console.error(
            "Error loading foods:",
            error
        );

    }

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


function renderFoods() {

    const foodList =
        document.querySelector(
            "#food-list", 
        );

    foodList.innerHTML = "";

    if (currentFoods.length === 0) {
        foodList.innerHTML = `<p class="no-food">No food available.</p>`;
        updateFoodPagination();
        return;
    }


    const startIndex =
        currentPage *
        FOODS_PER_PAGE;


    const endIndex =
        startIndex +
        FOODS_PER_PAGE;


    const foods =
        currentFoods.slice(
            startIndex,
            endIndex
        );


    foods.forEach(
        food => {

            const card =
                document.createElement(
                    "div"
                );


            card.classList.add(
                "detail-card"
            );


            card.innerHTML = `
                <img
                    src="${food.image}"
                    alt="${food.name}"
                    class="highlight-img"
                >

                <div class="highlight-desc">
                    <h4>${food.name}</h4>

                    <p class="food-description">
                        ${food.description}
                    </p>

                    <p class="food-price">
                        $${food.price}
                    </p>
                </div>
            `;
            
            card.addEventListener(
                "click",
                () => {

                    window.location.href =
                        `./pages/food/food.html?id=${food.id}`;

                }
            );

            foodList.appendChild(
                card
            );
        }
    );


    updateFoodPagination();

}


function setupFoodPagination() {

    const foodSection =
        document.querySelector(
            ".detail-wrapper"
        );


    if (!foodSection) {
        return;
    }


    const mainContainer =
        foodSection.parentElement;


    const backButton =
        mainContainer.querySelector(
            ".food-back"
        );


    const nextButton =
        mainContainer.querySelector(
            ".food-next"
        );


    if (!backButton || !nextButton) {
        return;
    }


    // Prevent duplicate event listeners

    backButton.onclick = function () {

        if (currentPage > 0) {

            currentPage--;

            renderFoods();

        }

    };


    nextButton.onclick = function () {

        const totalPages =
            Math.ceil(
                currentFoods.length /
                FOODS_PER_PAGE
            );


        if (
            currentPage <
            totalPages - 1
        ) {

            currentPage++;

            renderFoods();

        }

    };


    updateFoodPagination();

}


function updateFoodPagination() {

    const foodSection =
        document.querySelector(
            ".detail-wrapper"
        );


    if (!foodSection) {
        return;
    }


    const mainContainer =
        foodSection.parentElement;


    const backButton =
        mainContainer.querySelector(
            ".food-back"
        );


    const nextButton =
        mainContainer.querySelector(
            ".food-next"
        );


    if (!backButton || !nextButton) {
        return;
    }


    const totalPages =
        Math.ceil(
            currentFoods.length /
            FOODS_PER_PAGE
        );


    backButton.style.opacity =
        currentPage === 0
            ? "0.4"
            : "1";


    backButton.style.pointerEvents =
        currentPage === 0
            ? "none"
            : "auto";


    nextButton.style.opacity =
        currentPage >= totalPages - 1
            ? "0.4"
            : "1";


    nextButton.style.pointerEvents =
        currentPage >= totalPages - 1
            ? "none"
            : "auto";

}