import { useContext, useEffect, useState } from "react"
import { CartContext } from "../configs/MyContext"
import { Button, Form, Image, Table } from "react-bootstrap"
import InputItem from "../layouts/InputItem"
import API, { authAPI, endpoints } from "../configs/API"
import Loading from "../layouts/Loading"
import ErrorAlert from "../layouts/ErrorAlert"
import { Link, useNavigate } from "react-router-dom"

const MOMO = 2

const CartCheckout = () => {
    const [stateCart, dispatchCart] = useContext(CartContext)
    const [formCheckout, setFormCheckout] = useState({
        "receiver_name": "",
        "receiver_phone": "",
        "receiver_address": "",
        "payment_method": ""
    })
    const [paymentMethod, setPaymentMethod] = useState([])
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const nav = useNavigate()
    
    useEffect(() => {
        const loadPaymentMethod = async () => {
            let res = await API.get(endpoints['payment-methods'])
            setPaymentMethod(res.data)
        }

        loadPaymentMethod()
    }, [])

    const order_details = stateCart.map((item) => {
        return {
            "product": item.id,
            "quantity": item.quantity,
            "unit_price": item.price
        }
    })

    const checkout = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                const extraData = JSON.stringify({
                    "receiver_name": formCheckout.receiver_name,
                    "receiver_phone": formCheckout.receiver_phone,
                    "receiver_address": formCheckout.receiver_address,
                    "payment_method": formCheckout.payment_method,
                    "order_details": order_details
                })

                let nameOrder = ""
                if (Number(formCheckout.payment_method) === MOMO) {
                    let resPayment = await API.post(endpoints['payment-momo'], {
                        "amount": `${totalPrice}`,
                        "order_info": `Customer ${formCheckout.receiver_name} - ${formCheckout.receiver_phone}`,
                        "redirectUrl": "http://localhost:3000/cart",
                        "ipnUrl": "http://localhost:3000/cart",
                        extraData
                    })
                    if (resPayment.status === 200) {
                        const payUrl = resPayment.data.pay_url
                        window.location.href = payUrl
                        nameOrder = resPayment.data.orderId
                    }
                }

                let res = await authAPI().post(endpoints['checkout'], {
                    "name_order": nameOrder,
                    "receiver_name": formCheckout.receiver_name,
                    "receiver_phone": formCheckout.receiver_phone,
                    "receiver_address": formCheckout.receiver_address,
                    "payment_method": formCheckout.payment_method,
                    "order_details": order_details
                })
                console.log(res.data)
                if (res.status === 201) {
                    setFormCheckout({
                        "receiver_name": "",
                        "receiver_phone": "",
                        "receiver_address": "",
                        "payment_method": ""
                    })
                    dispatchCart({
                        type: "REMOVE_ALL"
                    })
                    alert("Đặt hàng thành công")
                    nav("/cart")
                }
            } catch (ex) {
                let msg = ""
                for (let e of Object.values(ex.response.data))
                    msg += `${e} `
                console.error(msg)
                setErr("Hiện tại không thể thực hiện thanh toán với Momo! Vui lòng sử dụng phương thức thanh toán khác!")
            } finally {
                setLoading(false)
            }
        }

        if (formCheckout.receiver_name === "")
            setErr("Phải nhập tên người nhận")
        else if (formCheckout.receiver_phone === "")
            setErr("Phải nhập số điện thoại người nhận")
        else if (formCheckout.receiver_address === "")
            setErr("Phải nhập địa chỉ người nhận")
        else if (formCheckout.payment_method === "")
            setErr("Bạn cần phải chọn phương thức thanh toán")
        else {
            setLoading(true)
            process()
        }
    }

    const quantity = stateCart.reduce((accumulator, currentValue) => {
        return accumulator + currentValue.quantity
    }, 0)

    const totalPrice = stateCart.reduce((accumulator, currentValue) => {
        return accumulator + currentValue.quantity * currentValue.price
    }, 0)

    return (
        <>
            <h1 className="text-center">THANH TOÁN GIỎ HÀNG</h1>
            {err?<ErrorAlert err={err} />:""}
            <Form onSubmit={checkout}>
                <InputItem label="Tên người nhận" type="text" value={formCheckout.receiver_name} controlId="formGroupReceiverName" 
                            setValue={e => setFormCheckout({...formCheckout, "receiver_name": e.target.value})}/>
                <InputItem label="Số điện thoại" type="text" value={formCheckout.receiver_phone} controlId="formGroupReceiverPhone" 
                            setValue={e => setFormCheckout({...formCheckout, "receiver_phone": e.target.value})}/>
                <InputItem label="Địa chỉ người nhận" type="text" value={formCheckout.receiver_address} controlId="formGroupReceiverAddress" 
                            setValue={e => setFormCheckout({...formCheckout, "receiver_address": e.target.value})}/>
                <Form.Group>
                    <Form.Label>Phương thức thanh toán</Form.Label>
                    <select className="ms-3" value={formCheckout.payment_method} onChange={e => setFormCheckout({...formCheckout, "payment_method": e.target.value})}>
                        <option value=""></option>
                        {paymentMethod.map(payment => 
                            <option value={payment.id} key={payment.id}>{payment.name}</option>
                        )}
                    </select>
                </Form.Group>

                <div>Số lượng: {quantity}</div>
                <div>Tổng số tiền: {Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(totalPrice)}</div>
                <Table bordered hover variant="light" className="mt-4">
                    <thead className="text-center">
                        <tr>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
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
                                </tr>
                            </>
                        )}
                    </tbody>
                </Table>

                {loading ? <Loading /> : (
                    <>
                        <Button variant="primary" type="submit" className="me-2">Thanh toán</Button>
                        <Link to="/cart" className="btn btn-secondary">Quay lại</Link>
                    </>
                )}
            </Form>
        </>
    )
}

export default CartCheckout