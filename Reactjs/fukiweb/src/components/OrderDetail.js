import { useEffect, useState } from "react"
import Loading from "../layouts/Loading"
import { authAPI, endpoints } from "../configs/API"
import { Link, useParams } from "react-router-dom"
import { Badge, Col, Image, Row, Table } from "react-bootstrap"

const OrderDetail = () => {
    const [order, setOrder] = useState(null)
    const { orderId } = useParams()

    useEffect(() => {
        const loadOrderDetail = async () => {
            let res = await authAPI().get(endpoints['order-detail'](orderId))
            setOrder(res.data)
        }
        loadOrderDetail()
    }, [])

    if (order === null)
        return <Loading />

    return (
        <>
            <h1 className="text-center">CHI TIẾT ĐƠN HÀNG {order.name}</h1>
            <Row>
                <Col className="fw-bold">Tên người nhận</Col>
                <Col>{order.receiver_name}</Col>
            </Row>
            <Row>
                <Col className="fw-bold">Số điện thoại người nhận</Col>
                <Col>{order.receiver_phone}</Col>
            </Row>
            <Row>
                <Col className="fw-bold">Địa chỉ người nhận</Col>
                <Col>{order.receiver_address}</Col>
            </Row>
            <Row>
                <Col className="fw-bold">Phương thức thanh toán</Col>
                <Col>{order.payment_method.name}</Col>
            </Row>
            <Row>
                <Col className="fw-bold">Tổng tiền</Col>
                <Col>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(order.total_price)}</Col>
            </Row>
            <Row>
                <Col className="fw-bold">Trạng thái</Col>
                <Col>{order.status === "PENDING" && <Badge bg="primary">Pending</Badge>}</Col>
            </Row>
            <Row>
                <Table bordered hover variant="light" className="mt-4">
                    <thead className="text-center">
                        <tr>
                            <th>#</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                        </tr>
                    </thead>
                    <tbody>
                        {order.order_details.map((item, index) => 
                            <>
                                <tr key={item.id}>
                                    <td>{index + 1}</td>
                                    <td className="text-center" style={{width: 180}}>
                                        <Image src={item.product.image} alt={item.product.name} width="50%"/>
                                    </td>
                                    <td>{item.product.name}</td>
                                    <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.unit_price)}</td>
                                    <td>{item.quantity}</td>
                                    <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.total_item_price)}</td>
                                </tr>
                            </>
                        )}
                    </tbody>
                </Table>
            </Row>

            <Link to={`/list-order`} className="btn btn-primary">Quay lại</Link>
        </>
    )
}

export default OrderDetail