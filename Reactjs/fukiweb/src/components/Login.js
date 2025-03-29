import { useContext, useState } from "react"
import { Button, Form, Row } from "react-bootstrap"
import API, { authAPI, endpoints } from "../configs/API"
import cookie from "react-cookies"
import Loading from "../layouts/Loading"
import { MyUserContext } from "../configs/MyContext"
import { Navigate } from "react-router-dom"
import ErrorAlert from "../layouts/ErrorAlert"

const Login = () => {
    const [username, setUsername] = useState("")
    const [password, setPassword] = useState("")
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState()
    const [user, dispatch] = useContext(MyUserContext)

    const login = (evt) => {
        evt.preventDefault()

        const processLogin = async () => {
            try {
                if (!process.env.REACT_APP_CLIENT_ID || !process.env.REACT_APP_CLIENT_SECRET) {
                    throw new Error("Bạn quên thiết lập REACT_APP_CLIENT_ID hoặc REACT_APP_CLIENT_SECRET")
                }
                
                let res = await API.post(endpoints['login'], {
                    "username": username,
                    "password": password,
                    "client_id": process.env.REACT_APP_CLIENT_ID,
                    "client_secret": process.env.REACT_APP_CLIENT_SECRET,
                    "grant_type": "password"
                })
    
                cookie.save('access-token', res.data.access_token)
    
                let user = await authAPI().get(endpoints['current-user'])
                cookie.save('current-user', user.data) 
    
                dispatch({
                    "type": "login",
                    "payload": user.data
                })
            } catch (ex) {
                console.error(ex)
                setErr("Username hoặc password không hợp lệ !!!")
            } finally {
                setLoading(false)
            }
        }

        if (username === "" || password === "")
            setErr("Phải nhập username và password")
        else {
            setLoading(true)
            processLogin()
        }
    }

    if (user !== null)
        return <Navigate to="/" />

    return (
        <>
            <div className="my-5 d-flex justify-content-center align-items-center">
                <Row className="border rounder-5 p-3 bg-white shadow" style={{width: 930}}>
                    <h1 className="text-center text-success">ĐĂNG NHẬP NGƯỜI DÙNG</h1>

                    {err?<ErrorAlert err={err} />:""}

                    <Form onSubmit={login}>
                        <Form.Group className="mb-3" controlId="formGroupUsername">
                            <Form.Label>Tên đăng nhập</Form.Label>
                            <Form.Control type="text" 
                                            value={username}
                                            onChange={e => setUsername(e.target.value)}
                                            placeholder="Nhập tên đăng nhập" />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formGroupPassword">
                            <Form.Label>Mật khẩu</Form.Label>
                            <Form.Control type="password" 
                                            value={password}
                                            onChange={e => setPassword(e.target.value)}
                                            placeholder="Nhập mật khẩu" />
                        </Form.Group>
                        {loading ? <Loading /> : <Button variant="primary" type="submit">Đăng nhập</Button>}

                    </Form>
                </Row>
            </div>
        </>
    )
}

export default Login