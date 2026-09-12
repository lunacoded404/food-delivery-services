import {
    logoutUser
} from "../api/authApi.js";

document.addEventListener(
    "DOMContentLoaded",
    async () => {

        const sidebarContainer =
            document.querySelector(
                "#sidebar-container"
            );

        if (!sidebarContainer) return;

        try {

            const response =
                await fetch(
                    getSidebarPath()
                );

            if (!response.ok) {

                throw new Error(
                    `Failed to load sidebar: ${response.status}`
                );

            }

            const sidebarHtml =
                await response.text();

            sidebarContainer.innerHTML =
                sidebarHtml;

            setupSidebarLinks();
            setupLogout();
            setActiveSidebar();
            setupMobileMenuToggle(); 

        } catch (error) {

            console.error(
                "Error loading sidebar:",
                error
            );

        }

    }
);


function getSidebarPath() {

    const path =
        window.location.pathname;

    if (
        path.includes("/pages/")
    ) {

        return "../../components/sidebar.html";

    }

    return "./components/sidebar.html";
}


function getRootPath() {

    const path =
        window.location.pathname;

    const pagesIndex =
        path.indexOf("/pages/");

    if (pagesIndex !== -1) {

        return path.substring(
            0,
            pagesIndex + 1
        );

    }

    return path.substring(
        0,
        path.lastIndexOf("/") + 1
    );
}


function setupSidebarLinks() {

    const links =
        document.querySelectorAll(
            ".sidebar a"
        );

    links.forEach(link => {

        const page =
            link.dataset.page;

        if (page === "home") {

            link.href =
                getRootPath() +
                "index.html";

        }

        if (page === "bills") {

            link.href =
                getRootPath() +
                "pages/bills/bills.html";

        }

        if (page === "wallet") {

            link.href =
                getRootPath() +
                "pages/wallet/wallet.html";

        }

        if (page === "notification") {

            link.href =
                getRootPath() +
                "pages/notification/notification.html";

        }

        if (page === "contact") {

            link.href =
                getRootPath() +
                "pages/contact/contact.html";

        }

        if (page === "setting") {

            link.href =
                getRootPath() +
                "pages/setting/setting.html";

        }

    });
}


function setupLogout() {

    const logoutButton =
        document.querySelector(
            "#logout-button"
        );

    if (!logoutButton) return;

    logoutButton.addEventListener(
        "click",
        (event) => {

            event.preventDefault();

            logoutUser();

            window.location.href =
                getRootPath() +
                "pages/auth/login.html";

        }
    );
}


function setActiveSidebar() {

    const path =
        window.location.pathname;

    const menuItems =
        document.querySelectorAll(
            ".sidebar-menus a"
        );


    menuItems.forEach(item => {

        item.classList.remove(
            "active"
        );


        const page =
            item.dataset.page;


        if (
            page === "home" &&
            (
                path.endsWith("/") ||
                path.endsWith("index.html")
            )
        ) {

            item.classList.add(
                "active"
            );

        }


        if (
            page === "bills" &&
            path.includes(
                "/pages/bills/"
            )
        ) {

            item.classList.add(
                "active"
            );

        }


        if (
            page === "wallet" &&
            path.includes(
                "/pages/wallet/"
            )
        ) {

            item.classList.add(
                "active"
            );

        }


        if (
            page === "notification" &&
            path.includes(
                "/pages/notification/"
            )
        ) {

            item.classList.add(
                "active"
            );

        }


        if (
            page === "contact" &&
            path.includes(
                "/pages/contact/"
            )
        ) {

            item.classList.add(
                "active"
            );

        }


        if (
            page === "setting" &&
            path.includes(
                "/pages/setting/"
            )
        ) {

            item.classList.add(
                "active"
            );

        }

    });

}


function setupMobileMenuToggle() {
    const menuToggle = document.querySelector('.menu-toggle');
    const sidebar = document.querySelector('.sidebar');

    if (menuToggle && sidebar) {
        menuToggle.addEventListener('click', (e) => {
            e.stopPropagation(); 
            sidebar.classList.toggle('active');
            document.body.classList.toggle('sidebar-open', sidebar.classList.contains('active'));
        });

        document.addEventListener('click', (e) => {
            if (window.innerWidth <= 640) {
                if (!sidebar.contains(e.target) && !menuToggle.contains(e.target)) {
                    sidebar.classList.remove('active');
                    document.body.classList.remove('sidebar-open');
                }
            }
        });
    }
}