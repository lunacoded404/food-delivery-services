import {
    createOrder
} from "../api/checkoutApi.js";


let checkoutItems = [];

const DELIVERY_FEE = 5;


document.addEventListener(
    "DOMContentLoaded",
    () => {

        loadCheckoutItems();

        setupCheckout();

    }
);


function loadCheckoutItems() {

    const data =
        sessionStorage.getItem(
            "checkout_items"
        );


    if (!data) {

        renderEmptyCheckout();

        return;

    }


    try {

        checkoutItems =
            JSON.parse(data);

    } catch (error) {

        console.error(
            "Checkout data error:",
            error
        );

        checkoutItems = [];

    }


    renderCheckout();

}


function renderCheckout() {

    const container =
        document.querySelector(
            "#checkout-items"
        );


    if (!container) {
        return;
    }


    container.innerHTML = "";


    if (
        checkoutItems.length === 0
    ) {

        renderEmptyCheckout();

        return;

    }


    checkoutItems.forEach(
        item => {

            const element =
                document.createElement(
                    "div"
                );


            element.classList.add(
                "checkout-item"
            );


            const subtotal =
                Number(item.food_price) *
                item.quantity;


            element.innerHTML = `

                <img
                    src="${item.food_image}"
                    alt="${item.food_name}"
                    class="checkout-item-image"
                >


                <div
                    class="checkout-item-info"
                >

                    <p
                        class="checkout-item-name"
                    >
                        ${item.food_name}
                    </p>


                    <p
                        class="checkout-item-quantity"
                    >
                        ${item.quantity} ×
                        $${Number(
                            item.food_price
                        ).toFixed(2)}
                    </p>

                </div>


                <span
                    class="checkout-item-price"
                >
                    $${subtotal.toFixed(2)}
                </span>

            `;


            container.appendChild(
                element
            );

        }
    );


    updateSummary();

}


function renderEmptyCheckout() {

    const container =
        document.querySelector(
            "#checkout-items"
        );


    container.innerHTML = `

        <div class="checkout-empty">

            Your cart is empty.

        </div>

    `;


    updateSummary();

}


function updateSummary() {

    let subtotal = 0;


    checkoutItems.forEach(
        item => {

            subtotal +=
                Number(
                    item.food_price
                ) *
                item.quantity;

        }
    );


    const delivery =
        checkoutItems.length > 0
            ? DELIVERY_FEE
            : 0;


    const total =
        subtotal +
        delivery;


    document.querySelector(
        "#checkout-subtotal"
    ).textContent =
        `$${subtotal.toFixed(2)}`;


    document.querySelector(
        "#checkout-delivery"
    ).textContent =
        `$${delivery.toFixed(2)}`;


    document.querySelector(
        "#checkout-total"
    ).textContent =
        `$${total.toFixed(2)}`;

}


function setupCheckout() {

    const button =
        document.querySelector(
            "#place-order-btn"
        );


    if (!button) {
        return;
    }


    button.addEventListener(
        "click",
        handlePlaceOrder
    );

}


async function handlePlaceOrder() {

    // =========================
    // Get form values
    // =========================

    const fullName =
        document.querySelector(
            "#full-name"
        ).value.trim();


    const phone =
        document.querySelector(
            "#phone"
        ).value.trim();


    const address =
        document.querySelector(
            "#address"
        ).value.trim();


    const payment =
        document.querySelector(
            'input[name="payment"]:checked'
        )?.value;


    // =========================
    // Validate
    // =========================

    if (!fullName) {

        alert(
            "Please enter your name."
        );

        return;

    }


    if (!phone) {

        alert(
            "Please enter your phone number."
        );

        return;

    }


    if (!address) {

        alert(
            "Please enter your delivery address."
        );

        return;

    }


    if (!payment) {

        alert(
            "Please select a payment method."
        );

        return;

    }


    if (
        checkoutItems.length === 0
    ) {

        alert(
            "Your order is empty."
        );

        return;

    }


    // =========================
    // Get selected cart IDs
    // =========================

    const storedIds =
        sessionStorage.getItem(
            "checkout_item_ids"
        );


    if (!storedIds) {

        alert(
            "Checkout items not found."
        );

        return;

    }


    let cartItemIds;


    try {

        cartItemIds =
            JSON.parse(storedIds);

    } catch (error) {

        console.error(
            error
        );

        alert(
            "Invalid checkout data."
        );

        return;

    }


    // =========================
    // Place order
    // =========================

    const button =
        document.querySelector(
            "#place-order-btn"
        );


    try {

        button.disabled = true;

        button.innerHTML = `
            Placing Order...
        `;


        const result =
            await createOrder(

                cartItemIds,

                fullName,

                phone,

                address,

                payment

            );


        console.log(
            "Order created:",
            result
        );


        // =========================
        // Clear checkout session
        // =========================

        sessionStorage.removeItem(
            "checkout_items"
        );

        sessionStorage.removeItem(
            "checkout_item_ids"
        );


        alert(
            "Order placed successfully!"
        );


        // =========================
        // Go Bills
        // =========================

        window.location.href =
            "../bills/bills.html";


    } catch (error) {

        console.error(
            "Place order error:",
            error
        );


        alert(
            error?.data?.detail ||
            "Failed to place order."
        );

    } finally {

        button.disabled = false;

        button.innerHTML = `

            <ion-icon
                name="checkmark-circle-outline">
            </ion-icon>

            Place Order

        `;

    }

}