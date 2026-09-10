import { apiRequest } from "./api.js";


export async function createOrder(
    cartItemIds,
    deliveryName,
    phone,
    deliveryAddress,
    paymentMethod
) {

    return await apiRequest(
        "/orders/",
        {
            method: "POST",

            headers: {
                "Content-Type":
                    "application/json"
            },

            body: JSON.stringify({

                cart_item_ids:
                    cartItemIds,

                delivery_name:
                    deliveryName,

                phone:
                    phone,

                delivery_address:
                    deliveryAddress,

                payment_method:
                    paymentMethod

            })
        }
    );

}