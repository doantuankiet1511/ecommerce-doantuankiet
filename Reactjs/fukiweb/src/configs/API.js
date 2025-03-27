import axios from "axios";
import cookie from "react-cookies";

export const endpoints = {
    "categories": "/categories/",
    
    "products": "/products/",
    "product-detail": (productId) => `/products/${productId}`,

    "shop-detail": (shopId) => `/shops/${shopId}`,
    "shop-detail-product": (shopId) => `/shops/${shopId}/products/`,

    "login": "/o/token/",
    "current-user": "/users/current-user/",
    "change-password": "/users/change-password/",
    "register": "/users/",
    "notification": "/users/notifications/",
    "wish-list": "/users/wish-list/",
    "order-list": "/users/orders/",
    "order-detail": (orderId) => `/orders/${orderId}/`,

    "revenue-stats-month": "/revenue-stats-month/",
    "revenue-stats-quarter": "/revenue-stats-quarter/",
    "revenue-stats-year": "/revenue-stats-year/",

    "list-seller": "/users/list-confirm-register/",
    "confirm-seller": (userId) => `/users/${userId}/confirm/`, //PATCH
    
    "my-shop": "/users/my-shop/",
    "add-shop": "/shops/",
    "edit-shop": (shopId) => `/shops/${shopId}/`, //PUT-PATCH
    "add-product": "/products/", //POST
    "action-product": (productId) => `/products/${productId}/`, //PUT-PATCH-DELETE
    "updated-tags": (productId) => `/products/${productId}/updated-tags/`, //PUT

    "comments": (productId) => `/products/${productId}/comments/`, //GET-POST
    "action-comment": (commentId) => `/comments/${commentId}/`, //PUT-PATCH-DELETE
    "reply-comment": (commentId) => `/comments/${commentId}/reply-comment/`,

    "reviews": (productId) => `/products/${productId}/reviews/`, //GET-POST
    
    "like-product": (productId) => `/products/${productId}/like/`,

    "payment-methods": "/payment-methods/",
    "checkout": "/orders/",
    "payment-momo": "/payment/"
}

export const authAPI = () => axios.create({
    baseURL: "http://127.0.0.1:8000/",
    headers: {
        "Authorization": `Bearer ${cookie.load("access-token")}`
    }
})

export default axios.create({
    baseURL: "http://127.0.0.1:8000/"
})