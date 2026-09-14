import {
    apiRequest
} from "../api/api.js";


export async function getCart() {

    return await apiRequest(
        "/cart/"
    );

}

export async function addToCart(
    foodId,
    quantity = 1
) {
    return await apiRequest(
        "/cart/items/",
        {
            method: "POST",
            headers: {
                "Content-Type":
                    "application/json"
            },
            body: JSON.stringify({
                food_id: foodId,
                quantity: quantity
            })
        }
    );
}


export async function updateCartItem(
    itemId,
    quantity
) {
    return await apiRequest(
        `/cart/items/${itemId}/`,
        {
            method: "PATCH",
            headers: {
                "Content-Type":
                    "application/json"
            },
            body: JSON.stringify({
                quantity: quantity

            })
        }
    );
}


export async function removeCartItem(
    itemId
) {
    return await apiRequest(
        `/cart/items/${itemId}/`,
        {
            method: "DELETE"
        }
    );

}


export async function clearCart() {

    return await apiRequest(
        "/cart/clear/",
        {
            method: "DELETE"
        }
    );

}

