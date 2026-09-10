import {
    registerUser
} from "../api/authApi.js";


const form =
    document.querySelector(
        "#register-form"
    );

const errorMessage =
    document.querySelector(
        "#register-error"
    );


form.addEventListener(
    "submit",
    async (event) => {

        event.preventDefault();

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

                return;
            }

            if (data?.email) {
                errorMessage.textContent =
                    data.email[0];

                return;
            }

            if (data?.password_confirm) {
                errorMessage.textContent =
                    data.password_confirm[0];

                return;
            }

            if (typeof data === "string") {
                errorMessage.textContent =
                    data;

                return;
            }

            errorMessage.textContent =
                "Registration failed.";
        }
    }
);