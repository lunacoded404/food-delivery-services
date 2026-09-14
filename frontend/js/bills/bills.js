import {
    apiRequest
} from "../api/api.js";


let orders = [];
let currentStatus = "all";
let currentSearch = "";
let currentDate = "";


document.addEventListener(
    "DOMContentLoaded",
    async () => {

        await loadOrders();
        setupFilters();
        setupSearch();
        setupDateFilter();
    }
);

async function loadOrders() {

    const container =
        document.querySelector(
            "#bill-list"
        );
    try {

        orders =
            await apiRequest(
                "/orders/"
            );

        renderBills();

    } catch (error) {

        console.error(
            "Load bills error:",
            error
        );

        if (container) {

            container.innerHTML = `
                <div class="checkout-empty">
                    Failed to load your orders.
                </div>
            `;

        }
    }
}


function renderBills() {

    const container =
        document.querySelector(
            "#bill-list"
        );

    if (!container) {

        console.error(
            "Bill list not found."
        );

        return;
    }

    container.innerHTML = "";

    let filteredOrders =
        [...orders];

    if (
        currentStatus !== "all"
    ) {
        filteredOrders =
            filteredOrders.filter(
                order => {

                    const status =
                        (
                            order.status || ""
                        ).toLowerCase();

                    return (
                        status
                        === currentStatus
                    );
                }
            );
    }

    if (
        currentDate !== ""
    ) {
        filteredOrders =
            filteredOrders.filter(
                order => {

                    const orderDate =
                        new Date(
                            order.created_at
                        );

                    if (
                        Number.isNaN(
                            orderDate.getTime()
                        )
                    ) {
                        return false;
                    }

                    const year =
                        orderDate.getFullYear();

                    const month =
                        String(
                            orderDate.getMonth() + 1
                        ).padStart(
                            2,
                            "0"
                        );

                    const day =
                        String(
                            orderDate.getDate()
                        ).padStart(
                            2,
                            "0"
                        );

                    const formattedDate =
                        `${year}-${month}-${day}`;

                    return (
                        formattedDate
                        === currentDate
                    );
                }
            );
    }


    if (
        currentSearch !== ""
    ) {
        const searchTerm =
            currentSearch
                .toLowerCase();

        filteredOrders =
            filteredOrders.filter(
                order => {
                    const orderId =
                        String(
                            order.id || ""
                        ).toLowerCase();

                    const formattedOrderId =
                        `ord-${String(
                            order.id || ""
                        ).padStart(
                            5,
                            "0"
                        )}`.toLowerCase();

                    return (
                        orderId.includes(
                            searchTerm
                        )
                        ||
                        formattedOrderId.includes(
                            searchTerm
                        )
                    );
                }
            );
    }

    if (
        filteredOrders.length === 0
    ) {
        container.innerHTML = `

            <div class="checkout-empty">
                No orders found.
            </div>
        `;
        return;
    }

    filteredOrders.forEach(
        order => {
            const element =
                createBillCard(
                    order
                );

            container.appendChild(
                element
            );
        }
    );
}

function createBillCard(order) {

    const element =
        document.createElement(
            "div"
        );

    element.classList.add(
        "bill-card"
    );

    const date =
        new Date(
            order.created_at
        );

    const dateText =
        date.toLocaleDateString(
            "en-US",
            {
                year: "numeric",
                month: "long",
                day: "numeric"
            }
        );

    const timeText =
        date.toLocaleTimeString(
            "en-US",
            {
                hour: "2-digit",
                minute: "2-digit"
            }
        );

    const status =
        (
            order.status || ""
        ).toLowerCase();

    const orderItems =
        (order.items || [])
            .map(
                item => `
                    <div class="bill-item">
                        <div class="bill-food">
                            <img
                                src="${item.food_image || ""}"
                                alt="${item.food_name || ""}"
                            >
                            <div>
                                <h4>
                                    ${item.food_name || ""}
                                </h4>
                                <p>
                                    x${item.quantity}
                                </p>
                            </div>
                        </div>

                        <span
                            class="bill-price"
                        >
                            $${Number(
                                item.subtotal || 0
                            ).toFixed(2)}
                        </span>
                    </div>
                `
            )
            .join("");

    element.innerHTML = `
        <div class="bill-top">
            <div>
                <span class="bill-label">
                    Order ID
                </span>
                <h3 class="bill-id">
                    #ORD-${String(
                        order.id
                    ).padStart(
                        5,
                        "0"
                    )}
                </h3>
            </div>

            <span
                class="bill-status ${status}"
            >
                ${order.status_display || order.status || ""}
            </span>
        </div>

        <div class="bill-info">
            <div>
                <ion-icon
                    name="calendar-outline">
                </ion-icon>
                <span>
                    ${dateText}
                </span>
            </div>

            <div>
                <ion-icon
                    name="time-outline">
                </ion-icon>

                <span>
                    ${timeText}
                </span>
            </div>
        </div>


        <div class="bill-items">${orderItems}</div>

        <div class="bill-bottom">
            <div>
                <span
                    class="bill-total-label"
                >
                    Total
                </span>

                <strong
                    class="bill-total"
                >
                    $${Number(
                        order.total_amount || 0
                    ).toFixed(2)}
                </strong>

            </div>

            <button

                type="button"
                class="bill-detail-btn"
                data-id="${order.id}"
            >
                View Details
                <ion-icon name="arrow-forward-outline"></ion-icon>

            </button>

        </div>
    `;

    const detailButton =
        element.querySelector(
            ".bill-detail-btn"
        );

    if (
        detailButton
    ) {
        detailButton.addEventListener(
            "click",
            () => {
                window.location.href =
                    `./bill-detail.html?id=${order.id}`;

            }
        );
    }

    return element;

}

function setupFilters() {

    const buttons =
        document.querySelectorAll(
            ".bill-filter-btn"
        );

    buttons.forEach(
        button => {
            button.addEventListener(
                "click",
                () => {
                    buttons.forEach(
                        btn => {
                            btn.classList.remove(
                                "active"
                            );
                        }
                    );

                    button.classList.add(
                        "active"
                    );

                    currentStatus =
                        button.dataset.status;

                    renderBills();
                }
            );
        }
    );
}


function setupSearch() {

    const searchForm =
        document.querySelector(
            "#bill-search-form"
        );

    const searchInput =
        document.querySelector(
            "#bill-search-input"
        );

    if (
        !searchForm ||
        !searchInput
    ) {
        console.error(
            "Bill search elements not found."
        );

        return;
    }

    searchForm.addEventListener(
        "submit",
        event => {

            event.preventDefault();

            currentSearch =
                searchInput.value.trim();

            renderBills();
        }
    );
}

function setupDateFilter() {

    const dateInput =
        document.querySelector(
            "#bill-date"
        );

    const clearButton =
        document.querySelector(
            "#clear-date"
        );

    if (
        !dateInput
    ) {
        console.error(
            "Bill date input not found."
        );

        return;
    }

    dateInput.addEventListener(
        "change",
        () => {
            currentDate = dateInput.value;

            renderBills();
        }
    );

    if (
        clearButton
    ) {
        clearButton.addEventListener(
            "click",
            () => {
                dateInput.value = "";
                currentDate = "";
                renderBills();
            }
        );
    }
}