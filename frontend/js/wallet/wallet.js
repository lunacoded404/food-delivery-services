import {
    getWallet,
    getTransactions,
    depositMoney
} from "../api/walletApi.js";


document.addEventListener(
    "DOMContentLoaded",
    async () => {

        await loadWallet();

        await loadTransactions();

        setupDeposit();

    }
);


async function loadWallet() {

    try {

        const wallet = await getWallet();

        renderBalance(wallet.balance);

    } catch (error) {

        console.error(
            "Error loading wallet:",
            error
        );

    }

}


function renderBalance(balance) {

    const balanceElement =
        document.querySelector("#wallet-balance");

    balanceElement.textContent =
        `$${Number(balance).toFixed(2)}`;

}


async function loadTransactions() {

    try {

        const transactions =
            await getTransactions();

        renderTransactions(transactions);

    } catch (error) {

        console.error(
            "Error loading transactions:",
            error
        );

    }

}


function renderTransactions(transactions) {

    const list =
        document.querySelector("#transaction-list");

    list.innerHTML = "";

    if (transactions.length === 0) {

        list.innerHTML = `
            <p class="empty-transaction">
                No transactions yet.
            </p>
        `;

        return;
    }


    transactions.forEach(transaction => {

        const item =
            document.createElement("div");

        item.classList.add(
            "transaction-item"
        );


        const type =
            transaction.transaction_type;


        let icon = "wallet-outline";

        if (type === "DEPOSIT") {
            icon = "add-circle-outline";
        }

        if (type === "PAYMENT") {
            icon = "cart-outline";
        }

        if (type === "REFUND") {
            icon = "refresh-circle-outline";
        }


        const sign =
            type === "DEPOSIT" ||
            type === "REFUND"
                ? "+"
                : "-";


        item.innerHTML = `

            <div class="transaction-info">

                <ion-icon
                    class="transaction-icon"
                    name="${icon}">
                </ion-icon>

                <div>

                    <p class="transaction-name">
                        ${transaction.description || transaction.transaction_type_display}
                    </p>

                    <p class="transaction-date">
                        ${formatDate(transaction.created_at)}
                    </p>

                </div>

            </div>

            <div
                class="transaction-amount ${type.toLowerCase()}">

                ${sign}$${Number(transaction.amount).toFixed(2)}

            </div>

        `;


        list.appendChild(item);

    });

}


function setupDeposit() {

    const button =
        document.querySelector("#deposit-btn");

    const input =
        document.querySelector("#deposit-amount");


    button.onclick = async () => {

        const amount = Number(input.value);

        if (!amount || amount <= 0) {
            alert("Please enter a valid amount.");
            return;
        }

        try {

            await depositMoney(amount);

            alert("Money deposited successfully.");

            input.value = "";

            await loadWallet();
            await loadTransactions();

        } catch (error) {

            console.error(
                "Deposit error:",
                error
            );

            alert("Unable to deposit money.");

        }

    };

}


function formatDate(dateString) {

    const date =
        new Date(dateString);

    return date.toLocaleString(
        "en-US",
        {
            dateStyle: "medium",
            timeStyle: "short"
        }
    );

}0