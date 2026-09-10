import {
    logoutUser
} from "../api/authApi.js";


export function handleLogout() {

    logoutUser();

    window.location.href =
        "../auth/login.html";
}