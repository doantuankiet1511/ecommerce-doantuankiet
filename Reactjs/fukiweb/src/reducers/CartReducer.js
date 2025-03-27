const CartReducer = (state, action) => {
    switch (action.type) {
        case "ADD_TO_CART":
            const isItemsFound = state.find((item) => item.id === action.payload.id)
            if (isItemsFound) {
                return state.map((item) => {
                    if (item.id === action.payload.id) {
                        return {...item, quantity: item.quantity + 1}
                    } else {
                        return item
                    }
                })
            }
            return [...state, action.payload]
        case "INCREASE":
            const stateIncrease = state.map((item) => {
                if (item.id === action.payload.id) {
                    return {...item, quantity: item.quantity + 1}
                } else {
                    return item
                }
            })
            return stateIncrease
        case "DECREASE":
            const stateDecrease = state.map((item) => {
                if (item.id === action.payload.id) {
                    return {...item, quantity: item.quantity - 1}
                } else {
                    return item
                }
            })
            return stateDecrease
        case "REMOVE_TO_CART":
            const stateRemove = state.filter((item) => item.id !== action.payload.id)
            return stateRemove
        case "REMOVE_ALL":
            return []
        default:
            return state
    }
}

export default CartReducer