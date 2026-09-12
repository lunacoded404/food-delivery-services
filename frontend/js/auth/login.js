import {
    loginUser
} from "../api/authApi.js";


const form =
    document.querySelector(
        "#login-form"
    );

const errorMessage =
    document.querySelector(
        "#login-error"
    );

const submitButton =
    form.querySelector(
        "button[type='submit']"
    );

const params = new URLSearchParams(window.location.search);

if (params.get("password_changed") === "true") {
    showMessage(
        "Password changed successfully. Please log in again.",
        "success"
    );
}

form.addEventListener(
    "submit",
    async (event) => {

        event.preventDefault();

        submitButton.disabled = true;
        submitButton.textContent = "Signing in...";
        errorMessage.textContent = "";

        const email = document.querySelector("#email").value.trim();
        const password = document.querySelector("#password").value;

        try {
            const data = await loginUser(email, password);

            localStorage.setItem("access_token", data.access);
            localStorage.setItem("refresh_token", data.refresh);
            localStorage.setItem("current_user", JSON.stringify(data.user));

            window.location.href = "../../index.html";

        } catch (error) {
            console.error("Login error:", error);
            const data = error.data;

            if (data?.non_field_errors) {
                errorMessage.textContent = data.non_field_errors[0];
            } else if (typeof data === "string") {
                errorMessage.textContent = data;
            } else {
                errorMessage.textContent = "Invalid email or password.";
            }

            submitButton.disabled = false;
            submitButton.textContent = "LOGIN";
        }
    }
);