import {
    sendContactMessage
} from "../api/contactApi.js";


document.addEventListener(
    "DOMContentLoaded",
    () => {

        setupContactForm();

    }
);


function setupContactForm() {

    const form =
        document.querySelector("#contact-form");

    const button =
        document.querySelector("#contact-submit");

    if (!form || !button) {
        return;
    }


    form.addEventListener(
        "submit",
        async event => {

            event.preventDefault();


            const name =
                document.querySelector("#name")
                    .value
                    .trim();

            const email =
                document.querySelector("#email")
                    .value
                    .trim();

            const subject =
                document.querySelector("#subject")
                    .value
                    .trim();

            const message =
                document.querySelector("#message")
                    .value
                    .trim();


            if (
                !name ||
                !email ||
                !subject ||
                !message
            ) {

                showStatus(
                    "Please fill in all fields.",
                    "error"
                );

                return;
            }


            button.disabled = true;

            button.textContent =
                "Sending...";


            try {

                await sendContactMessage({

                    name,
                    email,
                    subject,
                    message

                });


                showStatus(
                    "Your message has been sent successfully!",
                    "success"
                );


                form.reset();


            } catch (error) {

                console.error(
                    "Contact error:",
                    error
                );


                let message =
                    "Unable to send your message. Please try again.";


                if (
                    error.data?.email
                ) {

                    message =
                        error.data.email[0];

                } else if (
                    error.data?.name
                ) {

                    message =
                        error.data.name[0];

                } else if (
                    error.data?.subject
                ) {

                    message =
                        error.data.subject[0];

                } else if (
                    error.data?.message
                ) {

                    message =
                        error.data.message[0];

                }


                showStatus(
                    message,
                    "error"
                );

            } finally {

                button.disabled = false;

                button.textContent =
                    "Send Message";

            }

        }
    );

}


function showStatus(
    message,
    type
) {

    const status =
        document.querySelector(
            "#contact-status"
        );

    if (!status) {
        return;
    }


    status.textContent =
        message;

    status.className =
        `contact-status ${type}`;

}