import { useContext, useEffect, useState } from "react"
import API, { authAPI, endpoints } from "../configs/API"
import { Badge, Button, Container, Dropdown, Form, Nav, NavDropdown, Navbar } from "react-bootstrap"
import { Link, useNavigate } from "react-router-dom"
import { CartContext, MyUserContext } from "../configs/MyContext"
import { LiaShoppingCartSolid } from "react-icons/lia"
import Moment from "react-moment"

const Header = () => {
    const [q, setQ] = useState("")
    const nav = useNavigate()
    const [user, dispatch] = useContext(MyUserContext)
    const [stateCart, ] = useContext(CartContext)
    const [notifications, setNotifications] = useState(null)

    const search = (evt) => {
        evt.preventDefault()
        nav(`/?kw=${q}`)
    }

    const logout = () => {
        nav('/')
        dispatch({
            "type": "logout"
        })
    }

    const quantity = stateCart.reduce((accumulator, currentValue) => {
        return accumulator + currentValue.quantity
    }, 0)

    useEffect(() => {
        const loadNotifications = async () => {
            let res = await authAPI().get(endpoints['notification'])
            // console.log(res.data)
            setNotifications(res.data)
        }
        if (user)
            loadNotifications()
    }, [user])

    let createShop = `/create-shop`
    let myShop = `/my-shop`
    let profileUser = `/profile-user`
    let changePassword = `/profile-user/change-password`
    let listRegisterSeller = `/list-seller`
    let listOrder = `/list-order`
    let statsMyShop = `/stats-shop`

    let userInfo = (
        <>
            <Link to="/login" className="nav-link text-warning">Đăng nhập</Link>
            <Link to="/register" className="nav-link text-danger">Đăng ký</Link>
        </>
    )

    if (user !== null)
        userInfo = (
            <>
                <Dropdown>
                    <Dropdown.Toggle variant="Secondary" id="dropdown-basic">
                        <img src={user.image||user.avatar} alt={user.username} width="30" className="rounded-circle" />
                        Chào {user.username}
                    </Dropdown.Toggle>

                    <Dropdown.Menu variant="secondary dropdown-action">
                        <Dropdown.Header className="text-center px-4">
                            Vai trò: {user.role} 
                            {user.is_verified ? <Badge bg="primary" className="ms-1">Đã xác nhận</Badge> : <Badge bg="danger" className="ms-1">Chưa xác nhận</Badge>}
                        </Dropdown.Header>
                        <Dropdown.Item> <Link className="nav nav-link" to={profileUser}> Thông tin cá nhân </Link> </Dropdown.Item>
                        <Dropdown.Item> <Link className="nav nav-link" to={changePassword}> Đổi mật khẩu </Link> </Dropdown.Item>
                        <Dropdown.Item> <Link className="nav nav-link" to={listOrder}>Danh sách đơn hàng</Link> </Dropdown.Item>
                        {user.shop === null && user.role === "Seller" || user.role === "Employee" 
                            ? <Dropdown.Item> <Link className="nav nav-link" to={createShop}>Tạo cửa hàng</Link></Dropdown.Item> 
                            : ""}
                        {user.is_verified && user.shop !== null && user.role === "Seller" || user.role === "Employee" 
                            ? 
                            <>
                                <Dropdown.Item> <Link className="nav nav-link" to={myShop}> Cửa hàng của bạn </Link></Dropdown.Item> 
                                <Dropdown.Item> <Link className="nav nav-link" to={statsMyShop}> Thống kê doanh thu </Link></Dropdown.Item> 
                            </>
                            : ""}
                        {user.role === "Employee" ? 
                            <Dropdown.Item> <Link className="nav nav-link" to={listRegisterSeller}> Danh sách đăng ký </Link></Dropdown.Item> : null}
                        <Dropdown.Divider />
                        <Button className="btn btn-danger d-flex mx-auto" onClick={logout}>Đăng xuất</Button>
                    </Dropdown.Menu>
                </Dropdown>
            </>
        )

    return (
        <>
            <Navbar expand="lg" className="bg-body-tertiary">
                <Container>
                    <Navbar.Brand><Link to="/" className="nav-link">Fuki-eCommerce</Link></Navbar.Brand>

                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav" className="justify-content-end">
                        <Nav>
                            {userInfo}
                        </Nav>
                        <Nav>
                            <NavDropdown
                                id="nav-dropdown-dark-example"
                                title="Thông báo"
                                menuVariant="dark"
                            >
                            {notifications === null || notifications.length === 0 ? <NavDropdown.Item>Không có thông báo!</NavDropdown.Item> :
                                notifications.map((notification) => {
                                    return (
                                        <>
                                            <NavDropdown.Item key={notification.id}>
                                                <div>{notification.content}</div>
                                                <Moment format="YYYY-MM-DD HH:mm">{notification.created_date}</Moment>
                                            </NavDropdown.Item>
                                            <hr/>
                                        </>
                                    )
                                })
                            }
                            </NavDropdown>
                        </Nav>
                        <Nav>
                            <Link to="/wish-list" className="nav-link d-flex">
                                <div>Danh sách yêu thích</div> 
                            </Link>
                        </Nav>
                        <Nav>
                            <Link to="/cart" className="nav-link d-flex">
                                <div className="mt-1">Giỏ hàng</div> 
                                <LiaShoppingCartSolid size="2em"/>
                                <sup><Badge bg="danger">{quantity?quantity:""}</Badge></sup>
                            </Link>
                        </Nav>
                        <Form onSubmit={search} className="d-flex">
                            <Form.Control
                            type="search"
                            placeholder="Search"
                            className="me-2"
                            aria-label="Search"
                            value={q}
                            onChange={e => setQ(e.target.value)}
                            />
                            <Button type="submit" variant="outline-success">Search</Button>
                        </Form>
                    </Navbar.Collapse>

                </Container>
            </Navbar>
        </>
    )
}

export default Header