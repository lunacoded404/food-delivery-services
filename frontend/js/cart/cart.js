import {
    getCart,
    updateCartItem,
    removeCartItem,
    clearCart,
} from "../api/cartApi.js";

import {
    updateCartBadge
} from "./cartBadge.js";


let cart = null;
let selectedItems = new Set();


document.addEventListener(
    "DOMContentLoaded",
    async () => {

        await loadCart();
        setupClearCart();
        setupCheckout();
    }
);

async function loadCart() {

    try {
        cart = await getCart();

        const cartItemIds =
            new Set(
                cart.items.map(
                    item => item.id
                )
            );

        selectedItems.forEach(
            itemId => {
                if (
                    !cartItemIds.has(itemId)
                ) {
                    selectedItems.delete(
                        itemId
                    );
                }
            }
        );

        renderCart();
        updateCartBadge(cart);

    } catch (error) {
        console.error(
            "Cart error:",
            error
        );
    }
}

function renderCart() {

    const cartList =
        document.querySelector(
            "#cart-list"
        );

    cartList.innerHTML = "";

    if (!cart || cart.items.length === 0) {

        renderEmptyCart();
        updateSummary(0);
        return;

    }

    cart.items.forEach(
        item => {
            const element =
                createCartItem(
                    item
                );
            cartList.appendChild(
                element
            );
        }
    );

    updateSelectedSummary();
}

function createCartItem(
    item
) {
    const element =
        document.createElement(
            "div"
        );

    element.classList.add(
        "cart-item"
    );

    element.innerHTML = `
        <div class="cart-food">

            <input
                type="checkbox"
                class="cart-select"
                data-id="${item.id}"
                ${selectedItems.has(item.id) ? "checked" : ""}
            >

            <img
                src="${item.food_image}"
                alt="${item.food_name}"
            >

            <div class="cart-food-info">

                <h4>${item.food_name}</h4>

                <p>$${item.food_price}</p>

            </div>

        </div>

        <div class="cart-actions">

            <div class="quantity-control">

                <button class="quantity-btn decrease">
                    −
                </button>

                <span class="quantity">${item.quantity}</span>

                <button class="quantity-btn increase">
                    +
                </button>

            </div>

            <span class="cart-item-total">

                $${Number(
                    item.subtotal
                ).toFixed(2)}

            </span>

            <button class="remove-btn">

                <ion-icon
                    name="trash-outline">
                </ion-icon>

            </button>

        </div>

    `;

    const checkbox =
        element.querySelector(
            ".cart-select"
        );

    checkbox.onchange =
        () => {
            if (
                checkbox.checked
            ) {
                selectedItems.add(
                    item.id
                );

            } else {

                selectedItems.delete(
                    item.id
                );
            }

            updateSelectedSummary();

        };

    const decreaseButton =
        element.querySelector(
            ".decrease"
        );

    const increaseButton =
        element.querySelector(
            ".increase"
        );

    const removeButton =
        element.querySelector(
            ".remove-btn"
        );

    decreaseButton.onclick =
        async () => {
            try {
                const newQuantity =
                    Math.max(
                        1,
                        item.quantity - 1
                    );

                await updateCartItem(
                    item.id,
                    newQuantity
                );

                await loadCart();

            } catch (error) {

                console.error(
                    "Decrease cart item error:",
                    error
                );
            }
        };

    increaseButton.onclick =
        async () => {
            try {

                await updateCartItem(
                    item.id,
                    item.quantity + 1
                );

                await loadCart();

            } catch (error) {
                console.error(
                    "Increase cart item error:",
                    error
                );
            }
        };

    removeButton.onclick =
        async () => {
            try {

                await removeCartItem(
                    item.id
                );

                selectedItems.delete(
                    item.id
                );

                await loadCart();

            } catch (error) {

                console.error(
                    "Remove cart item error:",
                    error
                );
            }
        };

    return element;

}

function renderEmptyCart() {

    const cartList =
        document.querySelector(
            "#cart-list"
        );

    cartList.innerHTML = `

        <div class="empty-cart">

            <ion-icon name="cart-outline"></ion-icon>

            <h3>Your cart is empty</h3>

            <p>
                Add some delicious food
                to your cart.
            </p>

        </div>
    `;
}

function updateSummary(
    subtotal
) {
    const deliveryFee = 0;

    const total =
        subtotal +
        deliveryFee;

    document.querySelector(
        "#cart-subtotal"
    ).textContent =
        `$${subtotal.toFixed(2)}`;

    document.querySelector(
        "#delivery-fee"
    ).textContent =
        `$${deliveryFee.toFixed(2)}`;

    document.querySelector(
        "#cart-total"
    ).textContent =
        `$${total.toFixed(2)}`;

}

function updateSelectedSummary() {

    if (
        !cart ||
        cart.items.length === 0
    ) {

        updateSummary(0);
        return;
    }

    let subtotal = 0;

    cart.items.forEach(
        item => {
            if (
                selectedItems.has(
                    item.id
                )
            ) {
                subtotal +=
                    Number(
                        item.subtotal
                    );

            }
        }
    );

    updateSummary(
        subtotal
    );

}

function setupClearCart() {

    const button =
        document.querySelector(
            "#clear-cart"
        );

    button.onclick =
        async () => {

            if (
                !cart ||
                cart.items.length === 0
            ) {
                return;
            }

            try {

                await clearCart();
                selectedItems.clear();
                await loadCart();

            } catch (error) {

                console.error(
                    "Clear cart error:",
                    error
                );
            }
        };
}

function setupCheckout() {

    const button =
        document.querySelector(
            "#checkout-btn"
        );

    button.onclick = () => {

        if (
            !cart ||
            cart.items.length === 0
        ) {

            alert(
                "Your cart is empty."
            );

            return;
        }

        const selectedCartItems =
            cart.items.filter(
                item =>
                    selectedItems.has(
                        item.id
                    )
            );

        if (
            selectedCartItems.length === 0
        ) {

            alert(
                "Please select at least one food to order."
            );

            return;
        }

        sessionStorage.setItem(
            "checkout_items",
            JSON.stringify(
                selectedCartItems
            )
        );

        const cartItemIds =
            selectedCartItems.map(
                item => item.id
            );

        sessionStorage.setItem(
            "checkout_item_ids",
            JSON.stringify(
                cartItemIds
            )
        );

        window.location.href =
            "../checkout/checkout.html";
    };
}