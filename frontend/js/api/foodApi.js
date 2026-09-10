import { apiRequest } from "./api.js";


export async function getCategories() {

    return await apiRequest(
        "/categories/"
    );

}


export async function getFoods(
    categoryId = null,
    search = ""
) {

    const params =
        new URLSearchParams();


    if (categoryId) {

        params.append(
            "category",
            categoryId
        );

    }


    if (search) {

        params.append(
            "search",
            search
        );

    }


    const query =
        params.toString();


    const endpoint =
        query
            ? `/foods/?${query}`
            : "/foods/";


    return await apiRequest(
        endpoint
    );

}


export async function getRecommendedFoods() {

    return await apiRequest(
        "/foods/?recommended=true"
    );

}


export async function getFoodDetail(
    foodId
) {

    return await apiRequest(
        `/foods/${foodId}/`
    );

}