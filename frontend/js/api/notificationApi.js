import { apiRequest } from "./api.js";


export async function getNotifications() {

    return await apiRequest(
        "/notifications/"
    );

}


export async function getUnreadCount() {

    return await apiRequest(
        "/notifications/unread-count/"
    );

}


export async function markNotificationAsRead(
    notificationId
) {

    return await apiRequest(
        `/notifications/${notificationId}/read/`,
        {
            method: "PATCH"
        }
    );

}


export async function markAllNotificationsAsRead() {

    return await apiRequest(
        "/notifications/read-all/",
        {
            method: "PATCH"
        }
    );

}


export async function deleteNotification(
    notificationId
) {

    return await apiRequest(
        `/notifications/${notificationId}/`,
        {
            method: "DELETE"
        }
    );

}