import { useContext } from "react"
import { CartContext } from "../configs/MyContext"
import { Button, Image, Table } from "react-bootstrap"
import { Link } from "react-router-dom"

const CartDetail = () => {
    const [stateCart, dispatchCart ] = useContext(CartContext)

    const increase = (item) => {
        dispatchCart({
            type: "INCREASE",
            payload: {...item}
        })
    }

    const decrease = (item) => {
        dispatchCart({
            type: "DECREASE",
            payload: {...item}
        })
    }

    const removeToCart = (item) => {
        dispatchCart({
            type: "REMOVE_TO_CART",
            payload: {...item}
        })
    }

    const removeAll = () => {
        dispatchCart({
            type: "REMOVE_ALL"
        })
    }

    const quantity = stateCart.reduce((accumulator, currentValue) => {
        return accumulator + currentValue.quantity
    }, 0)

    const totalPrice = stateCart.reduce((accumulator, currentValue) => {
        return accumulator + currentValue.quantity * currentValue.price
    }, 0)

    return (
        <>
            <h1 className="text-center mt-2">GIỎ HÀNG</h1>
            {stateCart.length > 0 ? (
                <>
                    <Button variant="danger" onClick={() => removeAll()}>Xóa tất cả</Button>
                    <Table bordered hover variant="light" className="mt-4">
                        <thead className="text-center">
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th colSpan={2}></th>
                            </tr>
                        </thead>
                        <tbody>
                            {stateCart.map(item => 
                                <>
                                    <tr key={item.id}>
                                        <td className="text-center">
                                            <Image src={item.image} alt={item.name} width="30%"/>
                                        </td>
                                        <td>{item.name}</td>
                                        <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.price)}</td>
                                        <td>
                                            <div className="d-flex">
                                                <Button onClick={() => increase(item)} className="m-1">+</Button>
                                                <div className="m-1">{item.quantity}</div>
                                                <Button onClick={() => {item.quantity > 1 ? decrease(item) : removeToCart(item)}} className="m-1">-</Button>
                                            </div>
                                        </td>
                                        <td><Button onClick={() => removeToCart(item)}>Xóa</Button></td>
                                    </tr>
                                </>
                            )}
                        </tbody>
                    </Table>
                    <div>Số lượng: {quantity}</div>
                    <div>Tổng số tiền: {Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(totalPrice)}</div>
                    <Link to={'/cart/checkout'} className="btn btn-primary mt-1">Thanh toán</Link>
                </>
            ) : 
            <>
                <div className="text-center">
                    <h4>Hiện tại không có sản phẩm trong giỏ hàng</h4>
                    <Link to={`/`} className="btn btn-success">Mua sản phẩm</Link>
                </div>
            </>}
        </>
    )
}

export default CartDetail