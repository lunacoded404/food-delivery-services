import {
    registerUser
} from "../api/authApi.js";

const form =
    document.querySelector(
        "#register-form"
    );

const submitButton =
    form.querySelector(
        "button[type='submit']"
    );

const errorMessage =
    document.querySelector(
        "#register-error"
    );

form.addEventListener(
    "submit",
    async (event) => {

        event.preventDefault();

        submitButton.disabled = true;
        submitButton.textContent = "Signing up...";
        errorMessage.textContent = "";

        const username =
            document
                .querySelector("#username")
                .value
                .trim();

        const email =
            document
                .querySelector("#email")
                .value
                .trim();

        const password =
            document
                .querySelector("#password")
                .value;

        const passwordConfirm =
            document
                .querySelector("#password-confirm")
                .value;

        try {

            await registerUser(
                username,
                email,
                password,
                passwordConfirm
            );

            alert(
                "Registration successful!"
            );

            window.location.href =
                "./login.html";

        } catch (error) {

            console.error(
                "Register error:",
                error
            );

            const data = error.data;

            if (data?.username) {
                errorMessage.textContent =
                    data.username[0];
            } else if (data?.email) {
                errorMessage.textContent =
                    data.email[0];
            } else if (data?.password_confirm) {
                errorMessage.textContent =
                    data.password_confirm[0];
            } else if (typeof data === "string") {
                errorMessage.textContent =
                    data;
            } else {
                errorMessage.textContent =
                    "Registration failed.";
            }

        } finally {
            submitButton.disabled = false;
            submitButton.textContent = "SIGN UP";
        }
    }
);