import { apiRequest } from "../api/api.js";


let order = null;


document.addEventListener(
    "DOMContentLoaded",
    loadOrder
);


async function loadOrder() {

    const container =
        document.querySelector(
            "#bill-detail"
        );

    const params =
        new URLSearchParams(
            window.location.search
        );

    const orderId =
        params.get("id");


    if (!orderId) {

        renderError(
            "Order ID not found."
        );

        return;
    }


    try {

        order =
            await apiRequest(
                `/orders/${orderId}/`
            );

        renderOrder(order);

    } catch (error) {

        console.error(
            "Load order detail error:",
            error
        );

        renderError(
            error?.data?.detail ||
            "Failed to load order details."
        );
    }

}


function renderOrder(order) {

    const container =
        document.querySelector(
            "#bill-detail"
        );


    const date =
        new Date(order.created_at);


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


    container.innerHTML = `

        <div class="bill-detail-header">

            <div>

                <h2 class="main-title">
                    Order Details
                </h2>

                <p class="bill-detail-id">

                    #ORD-${String(
                        order.id
                    ).padStart(5, "0")}

                    ·

                    ${dateText}
                    ${timeText}

                </p>

            </div>


            <span
                class="
                    bill-detail-status
                    ${order.status.toLowerCase()}
                "
            >

                ${order.status_display}

            </span>

        </div>


        <div class="bill-detail-grid">


            <!-- LEFT -->

            <div>


                <!-- ORDER ITEMS -->

                <div class="bill-detail-card">

                    <h3>
                        Order Items
                    </h3>

                    <div>

                        ${renderItems(
                            order.items
                        )}

                    </div>

                </div>


                <!-- DELIVERY -->

                <div class="bill-detail-card">

                    <h3>
                        Delivery Information
                    </h3>


                    <div class="detail-info-row">

                        <span class="detail-info-label">
                            Name
                        </span>

                        <span class="detail-info-value">
                            ${order.delivery_name}
                        </span>

                    </div>


                    <div class="detail-info-row">

                        <span class="detail-info-label">
                            Phone
                        </span>

                        <span class="detail-info-value">
                            ${order.phone}
                        </span>

                    </div>


                    <div class="detail-info-row">

                        <span class="detail-info-label">
                            Address
                        </span>

                        <span class="detail-info-value">
                            ${order.delivery_address}
                        </span>

                    </div>


                    <div class="detail-info-row">

                        <span class="detail-info-label">
                            Payment
                        </span>

                        <span class="detail-info-value">
                            ${order.payment_method_display}
                        </span>

                    </div>

                </div>


                <!-- STATUS -->

                <div class="bill-detail-card">

                    <h3>
                        Order Status
                    </h3>

                    ${renderTimeline(
                        order.status
                    )}

                </div>


            </div>


            <!-- RIGHT -->

            <div>


                <!-- SUMMARY -->

                <div class="bill-detail-card">

                    <h3>
                        Order Summary
                    </h3>


                    <div class="detail-summary-row">

                        <span>
                            Subtotal
                        </span>

                        <span>
                            $${calculateSubtotal(
                                order.items
                            ).toFixed(2)}
                        </span>

                    </div>


                    <div
                        class="
                            detail-summary-row
                            delivery
                        "
                    >

                        <span>
                            Delivery Fee
                        </span>

                        <span>
                            $${Number(
                                order.delivery_fee
                            ).toFixed(2)}
                        </span>

                    </div>


                    <div
                        class="
                            detail-summary-total
                        "
                    >

                        <span>
                            Total
                        </span>

                        <strong>
                            $${Number(
                                order.total_amount
                            ).toFixed(2)}
                        </strong>

                    </div>

                </div>


                <!-- PAYMENT -->

                <div class="bill-detail-card">

                    <h3>
                        Payment
                    </h3>


                    <div class="detail-info-row">

                        <span class="detail-info-label">
                            Method
                        </span>

                        <span class="detail-info-value">
                            ${order.payment_method_display}
                        </span>

                    </div>


                    <div class="detail-info-row">

                        <span class="detail-info-label">
                            Status
                        </span>

                        <span class="detail-info-value">
                            ${order.status_display}
                        </span>

                    </div>

                </div>


            </div>


        </div>
    `;
}


function renderItems(items) {

    return items.map(
        item => {

            return `

                <div class="detail-item">

                    <img
                        src="${item.food_image || ""}"
                        alt="${item.food_name}"
                        class="detail-item-image"
                    >


                    <div
                        class="
                            detail-item-info
                        "
                    >

                        <h4>
                            ${item.food_name}
                        </h4>

                        <p>
                            ${item.quantity}
                            ×
                            $${Number(
                                item.price
                            ).toFixed(2)}
                        </p>

                    </div>


                    <span
                        class="
                            detail-item-price
                        "
                    >

                        $${Number(
                            item.subtotal
                        ).toFixed(2)}

                    </span>

                </div>

            `;
        }
    ).join("");

}


function calculateSubtotal(items) {

    return items.reduce(
        (
            total,
            item
        ) => {

            return total +
                Number(item.subtotal);

        },
        0
    );

}


function renderTimeline(status) {

    const steps = [

        {
            key: "PENDING",
            label: "Pending",
            icon: "time-outline"
        },

        {
            key: "CONFIRMED",
            label: "Confirmed",
            icon: "checkmark-outline"
        },

        {
            key: "PREPARING",
            label: "Preparing",
            icon: "restaurant-outline"
        },

        {
            key: "OUT_FOR_DELIVERY",
            label: "On the way",
            icon: "bicycle-outline"
        },

        {
            key: "DELIVERED",
            label: "Delivered",
            icon: "checkmark-done-outline"
        }

    ];


    const statusIndex =
        steps.findIndex(
            step =>
                step.key === status
        );


    return `

        <div class="order-timeline">

            ${steps.map(
                (
                    step,
                    index
                ) => {

                    const active =
                        index <= statusIndex;

                    return `

                        <div
                            class="
                                timeline-step
                                ${active
                                    ? "active"
                                    : ""}
                            "
                        >

                            <div
                                class="
                                    timeline-icon
                                "
                            >

                                <ion-icon
                                    name="${step.icon}">
                                </ion-icon>

                            </div>

                            <span>
                                ${step.label}
                            </span>

                        </div>

                    `;

                }
            ).join("")}

        </div>

    `;
}


function renderError(message) {

    const container =
        document.querySelector(
            "#bill-detail"
        );

    container.innerHTML = `

        <div class="bill-detail-card">

            <h3>
                Unable to load order
            </h3>

            <p>
                ${message}
            </p>

        </div>

    `;
}