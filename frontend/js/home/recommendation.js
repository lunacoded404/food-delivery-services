import {
    getRecommendedFoods
} from "../api/foodApi.js";


let recommendedFoods = [];
let currentPage = 0;
const ITEMS_PER_PAGE = 4;


export async function loadRecommendations() {

    try {
        recommendedFoods =
            await getRecommendedFoods();

        console.log(
            "Recommended foods:",
            recommendedFoods
        );

        console.log(
            "Is array:",
            Array.isArray(recommendedFoods)
        );

        currentPage = 0;
        renderRecommendations();
        setupRecommendationButtons();

    } catch (error) {

        console.error(
            "Recommendation error:",
            error
        );

        const recommendationList =
            document.querySelector(
                "#recommendation-list"
            );

        recommendationList.innerHTML = `
            <p>
                Failed to load recommendations.
            </p>
        `;
    }
}

function getTotalPages() {

    return Math.ceil(
        recommendedFoods.length /
        ITEMS_PER_PAGE
    );
}

function renderRecommendations() {

    const recommendationList =
        document.querySelector(
            "#recommendation-list"
        );

    recommendationList.innerHTML = "";

    if (recommendedFoods.length === 0) {

        recommendationList.innerHTML = `
            <p>
                No recommendations available.
            </p>
        `;
        return;
    }

    const startIndex =
        currentPage * ITEMS_PER_PAGE;

    for (
        let i = 0;
        i < ITEMS_PER_PAGE;
        i++
    ) {

        const foodIndex =
            (startIndex + i) %
            recommendedFoods.length;

        const food =
            recommendedFoods[foodIndex];

        const card =
            document.createElement(
                "div"
            );

        card.classList.add(
            "highlight-card"
        );

        card.innerHTML = `

            <img
                src="${food.image}"
                alt="${food.name}"
                class="highlight-img"
            >

            <div class="highlight-desc">

                <h5>
                    ${food.name}
                </h5>

                <p>
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

        recommendationList.appendChild(
            card
        );
    }
}

function setupRecommendationButtons() {

    const mainArrow =
        document.querySelector(
            ".main-arrow"
        );

    if (!mainArrow) {
        return;
    }

    const backButton =
        mainArrow.querySelector(
            ".back"
        );

    const nextButton =
        mainArrow.querySelector(
            ".next"
        );

    if (!backButton || !nextButton) {
        return;
    }

    backButton.addEventListener(
        "click",
        function () {

            if (
                currentPage > 0
            ) {

                currentPage--;

            } else {

                currentPage =
                    getTotalPages() - 1;
            }

            renderRecommendations();
        }
    );

    nextButton.addEventListener(
        "click",
        function () {

            if (
                currentPage <
                getTotalPages() - 1
            ) {

                currentPage++;
            } else {

                currentPage = 0;
            }

            renderRecommendations();
        }
    );
}

function updateRecommendationButtons() {

    const mainArrow =
        document.querySelector(
            ".main-arrow"
        );

    if (!mainArrow) {
        return;
    }

    const backButton =
        mainArrow.querySelector(
            ".back"
        );

    const nextButton =
        mainArrow.querySelector(
            ".next"
        );

    if (!backButton || !nextButton) {
        return;
    }

    const totalPages =
        Math.ceil(
            recommendedFoods.length /
            ITEMS_PER_PAGE
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