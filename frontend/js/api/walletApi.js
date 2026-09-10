import { apiRequest } from "./api.js";

export async function getWallet() {
    return await apiRequest("/wallet/");
}

export async function getTransactions() {
    return await apiRequest("/wallet/transactions/");
}

export async function depositMoney(amount) {
    return await apiRequest("/wallet/deposit/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            amount: amount
        })
    });
}