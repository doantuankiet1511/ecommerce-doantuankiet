import { useEffect, useState } from "react"
import { authAPI, endpoints } from "../configs/API"
import Loading from "../layouts/Loading"
import { Badge, Table } from "react-bootstrap"
import ModalConfirm from "../layouts/ModalConfirm"

const ListRegisterSeller = () => {
    const [users, setUsers] = useState(null)
    const [loading, setLoading] = useState(false)

    useEffect(() => {
        const loadListUser = async () => {
            let res = await authAPI().get(endpoints['list-seller'])
            console.log(res.data)
            setUsers(res.data)
        }

        loadListUser()
    }, [loading])

    if (users === null)
        return <Loading />

    return (
        <>
            <h1 className="text-center">DANH SÁCH XÁC NHẬN ĐĂNG KÝ NHÀ CUNG CẤP</h1>
            {users.length > 0 ? (
                <Table striped bordered hover>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Username</th>
                            <th>Xác nhận</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        {users.map((user) => 
                            <tr>
                                <td>{user.id}</td>
                                <td>{user.username}</td>
                                <td>{user.is_verified === false && <Badge bg="danger">Chưa xác nhận</Badge>}</td>
                                <td>
                                    <ModalConfirm obj={user} setLoading={setLoading} />
                                </td>
                            </tr>
                        )}    
                    </tbody>
                </Table>
            ) : <h4 className="text-center">Đã xác nhận xong tài khoản!!!</h4>}
        </>
    )
}

export default ListRegisterSeller