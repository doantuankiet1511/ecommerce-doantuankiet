import { useEffect, useState } from "react"
import { authAPI, endpoints } from "../configs/API"
import Loading from "../layouts/Loading"
import { Badge, Table } from "react-bootstrap"
import { Link } from "react-router-dom"

const ListOrderProduct = () => {
    const [orders, setOrders] = useState(null)

    useEffect(() => {
        const loadListProduct = async () => {
            let res = await authAPI().get(endpoints['order-list'])
            setOrders(res.data)
        }
        loadListProduct()
    }, [])

    if (orders === null)
        return <Loading />

    return (
        <>
            <h1 className="text-center">DANH SÁCH ĐƠN ĐẶT HÀNG</h1>
            {orders.length > 0 ? (
                <Table striped bordered hover>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Mã hóa đơn</th>
                            <th>Người nhận</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Tổng tiền</th>
                            <th>PTTT</th>
                            <th>Trạng thái</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        {orders.map((order, index) => 
                            <tr key={order.id}>
                                <td>{index + 1}</td>
                                <td>{order.name}</td>
                                <td>{order.receiver_name}</td>
                                <td>{order.receiver_phone}</td>
                                <td>{order.receiver_address}</td>
                                <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(order.total_price)}</td>
                                <td>{order.payment_method.name}</td>
                                <td>{order.status === "PENDING" && <Badge bg="primary">Pending</Badge>}</td>
                                <td className="text-center">
                                    <Link to={`/orders/${order.id}`} className="btn btn-primary">Xem chi tiết</Link>
                                </td>
                            </tr>
                        )}    
                    </tbody>
                </Table>
            ) : <h4 className="text-center">Bạn chưa có đơn hàng nào!!!</h4>}
        </>
    )
}

export default ListOrderProduct