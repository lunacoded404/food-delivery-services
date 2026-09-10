import { apiRequest } from "./api.js";


export async function sendContactMessage(data) {

    return await apiRequest(
        "/contact/",
        {
            method: "POST",

            headers: {
                "Content-Type": "application/json"
            },

            body: JSON.stringify(data)
        }
    );

}