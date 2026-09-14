import {
    getCart
} from "../api/cartApi.js";


export async function updateCartBadge(
    cart = null
) {
    const cartCount =
        document.querySelector(
            "#cart-count"
        );

    if (!cartCount) {
        return;
    }
    try {
        if (!cart) {
            const token =
                localStorage.getItem(
                    "access_token"
                );

            if (!token) {
                cartCount.textContent = "0";
                cartCount.style.display = "none";
                return;
            }

            cart = await getCart();
        }

        const count = cart.items.length;

        cartCount.textContent = count;

        if (count === 0) {

            cartCount.style.display = "none";

        } else {

            cartCount.style.display =
                "flex";
        }

    } catch (error) {

        console.error(
            "Cart badge error:",
            error
        );
  
        cartCount.textContent =
            "0";

        cartCount.style.display =
            "none";
    }
}


document.addEventListener(
    "DOMContentLoaded",
    () => {
        updateCartBadge();
    }
);