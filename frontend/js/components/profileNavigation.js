document.addEventListener("DOMContentLoaded", () => {

    const profileButtons =
        document.querySelectorAll(".user");

    profileButtons.forEach(button => {

        button.addEventListener("click", event => {

            event.preventDefault();

            window.location.href =
                "/pages/profile/profile.html";

        });

    });

});