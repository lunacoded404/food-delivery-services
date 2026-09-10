import {
    getNotifications,
    markNotificationAsRead,
    markAllNotificationsAsRead,
    deleteNotification
} from "../api/notificationApi.js";


let notifications = [];


document.addEventListener(
    "DOMContentLoaded",
    async () => {

        await loadNotifications();

        setupMarkAllRead();

        startNotificationPolling();

    }
);


async function loadNotifications() {

    try {

        notifications =
            await getNotifications();

        renderNotifications(
            notifications
        );

    } catch (error) {

        console.error(
            "Error loading notifications:",
            error
        );

    }

}


function renderNotifications(
    notifications
) {

    const list =
        document.querySelector(
            "#notification-list"
        );

    if (!list) return;

    list.innerHTML = "";


    if (!notifications.length) {

        list.innerHTML = `
            <div class="empty-notification">

                <ion-icon
                    name="notifications-off-outline">
                </ion-icon>

                <p>
                    You have no notifications.
                </p>

            </div>
        `;

        return;
    }


    notifications.forEach(
        notification => {

            const item =
                document.createElement(
                    "div"
                );

            item.className =
                "notification-item";


            if (!notification.is_read) {

                item.classList.add(
                    "unread"
                );

            }


            item.innerHTML = `

                <div class="notification-icon">

                    <ion-icon
                        name="${getNotificationIcon(
                            notification.notification_type
                        )}">
                    </ion-icon>

                </div>


                <div class="notification-content">

                    <p class="notification-title">
                        ${notification.title}
                    </p>

                    <p class="notification-message">
                        ${notification.message}
                    </p>

                    <p class="notification-date">
                        ${formatDate(
                            notification.created_at
                        )}
                    </p>

                </div>


                <div class="notification-actions">

                    <button
                        class="notification-delete"
                        data-id="${notification.id}"
                        type="button"
                    >

                        <ion-icon
                            name="trash-outline">
                        </ion-icon>

                    </button>

                </div>

            `;


            item.addEventListener(
                "click",
                async event => {

                    if (
                        event.target.closest(
                            ".notification-delete"
                        )
                    ) {

                        return;

                    }


                    if (
                        !notification.is_read
                    ) {

                        try {

                            await markNotificationAsRead(
                                notification.id
                            );

                            notification.is_read =
                                true;

                            item.classList.remove(
                                "unread"
                            );

                        } catch (error) {

                            console.error(
                                "Mark notification as read error:",
                                error
                            );

                        }

                    }

                }
            );


            const deleteButton =
                item.querySelector(
                    ".notification-delete"
                );


            deleteButton.addEventListener(
                "click",
                async event => {

                    event.stopPropagation();

                    try {

                        await deleteNotification(
                            notification.id
                        );

                        item.remove();

                        notifications =
                            notifications.filter(
                                item =>
                                    item.id !==
                                    notification.id
                            );


                        const list =
                            document.querySelector(
                                "#notification-list"
                            );


                        if (
                            list.children.length === 0
                        ) {

                            list.innerHTML = `
                                <div class="empty-notification">

                                    <ion-icon
                                        name="notifications-off-outline">
                                    </ion-icon>

                                    <p>
                                        You have no notifications.
                                    </p>

                                </div>
                            `;

                        }

                    } catch (error) {

                        console.error(
                            "Delete notification error:",
                            error
                        );

                    }

                }
            );


            list.appendChild(item);

        }
    );

}


function getNotificationIcon(type) {

    switch (type) {

        case "ORDER":
            return "receipt-outline";

        case "PAYMENT":
            return "wallet-outline";

        case "PROMOTION":
            return "pricetag-outline";

        case "SYSTEM":
            return "information-circle-outline";

        default:
            return "notifications-outline";

    }

}


function formatDate(
    dateString
) {

    return new Date(
        dateString
    ).toLocaleString(
        "en-US",
        {
            dateStyle: "medium",
            timeStyle: "short"
        }
    );

}


function setupMarkAllRead() {

    const button =
        document.querySelector(
            "#mark-all-read"
        );

    if (!button) return;


    button.addEventListener(
        "click",
        async () => {

            try {

                await markAllNotificationsAsRead();

                notifications.forEach(
                    notification => {
                        notification.is_read =
                            true;
                    }
                );


                document
                    .querySelectorAll(
                        ".notification-item.unread"
                    )
                    .forEach(item => {

                        item.classList.remove(
                            "unread"
                        );

                    });

            } catch (error) {

                console.error(
                    "Mark all as read error:",
                    error
                );

            }

        }
    );

}


function startNotificationPolling() {

    setInterval(
        async () => {

            await loadNotifications();

        },
        30000
    );

}