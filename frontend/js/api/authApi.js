import {
    apiRequest
} from "./api.js";


export async function registerUser(
    username,
    email,
    password,
    passwordConfirm
) {
    return await apiRequest(
        "/auth/register/",
        {
            method: "POST",

            headers: {
                "Content-Type":
                    "application/json"
            },

            body: JSON.stringify({
                username,
                email,
                password,
                password_confirm:
                    passwordConfirm
            })
        }
    );
}


export async function loginUser(
    email,
    password
) {
    return await apiRequest(
        "/auth/login/",
        {
            method: "POST",

            headers: {
                "Content-Type":
                    "application/json"
            },

            body: JSON.stringify({
                email,
                password
            })
        }
    );
}


export async function getCurrentUser() {
    return await apiRequest(
        "/auth/me/"
    );
}


export async function refreshAccessToken(
    refreshToken
) {
    return await apiRequest(
        "/auth/refresh/",
        {
            method: "POST",

            headers: {
                "Content-Type":
                    "application/json"
            },

            body: JSON.stringify({
                refresh: refreshToken
            })
        }
    );
}


export function logoutUser() {
    localStorage.removeItem(
        "access_token"
    );

    localStorage.removeItem(
        "refresh_token"
    );

    localStorage.removeItem(
        "current_user"
    );
}