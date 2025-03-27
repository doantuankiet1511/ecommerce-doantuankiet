import { useContext, useRef, useState } from "react"
import { MyUserContext } from "../configs/MyContext"
import { authAPI, endpoints } from "../configs/API"
import { Button, Col, Form, Image, Modal, Row } from "react-bootstrap"
import ErrorAlert from "../layouts/ErrorAlert"
import InputItem from "../layouts/InputItem"
import Loading from "../layouts/Loading"
import cookie from "react-cookies"

const ProfileUser = () => {
    const [profileUser, dispatch] = useContext(MyUserContext)
    const [updateUser, setUpdateUser] = useState({
        "firstName": profileUser ? profileUser.first_name : "",
        "lastName": profileUser ? profileUser.last_name : "",
        "email": profileUser ? profileUser.email : ""
    })
    const avatar = useRef()

    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const editUser = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("first_name", updateUser.firstName)
                form.append("last_name", updateUser.lastName)
                form.append("email", updateUser.email)
                if (avatar.current.files.length > 0)
                    form.append("avatar", avatar.current.files[0])

                let res = await authAPI().put(endpoints['current-user'], form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                if (res.status === 200) {
                    cookie.save('current-user', res.data) 
                    dispatch({
                        "type": "edit",
                        "payload": res.data
                    })
                    setTimeout(() => handleClose(), 1000)
                }
            } catch (ex) {
                let msg = ""
                for (let e in Object.values(ex.response.data))
                    msg += `${e}`
                setErr(msg)
            } finally {
                setLoading(false)
            }
        }

        setLoading(true)
        process()
    }

    if (profileUser === null)
        return <Loading />

    const setValue = (e) => {
        const { name, value } = e.target
        setUpdateUser((current) => ({...current, [name]: value}))
    }

    return (
        <>
            <h1 className="text-center text-success">
                Thông tin cá nhân của {profileUser.first_name === "" && profileUser.last_name === "" ? <h1>của bạn</h1> : <h1>{profileUser.username}</h1>}
            </h1>
            <Row className="mt-7">
                <Col xs={4}>
                    {/* <Image src={profileUser.avatar} rounded style={{ width: '50%' }}/> */}
                    <Image src={profileUser.image||profileUser.avatar} rounded style={{ width: '50%' }}/>
                </Col>
                <Col xs={8}>
                    <Row >
                        <Col> <h3>First name</h3> </Col>
                        <Col> <h3>{profileUser.first_name}</h3> </Col>
                    </Row>
                    <Row>
                        <Col> <h3>Last name</h3> </Col>
                        <Col> <h3>{profileUser.last_name}</h3> </Col>
                    </Row>
                    <Row>
                        <Col> <h3>Username</h3> </Col>
                        <Col> <h3>{profileUser.username}</h3> </Col>
                    </Row>
                    <Row>
                        <Col> <h3>Email</h3> </Col>
                        <Col> <h3>{profileUser.email}</h3> </Col>
                    </Row>
                    <Row>
                        <Button variant="primary" onClick={handleShow}>
                            Cập nhật
                        </Button>
                    </Row>
                </Col>
            </Row>

            {err?<ErrorAlert err={err} />:""}

            <Modal show={show} onHide={handleClose}>
                <Form onSubmit={editUser}>
                    <Modal.Header closeButton>
                        <Modal.Title>Chỉnh sửa thông tin cá nhân</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                            <InputItem label="First name" type="text" value={updateUser.firstName} 
                                        name="firstName" setValue={setValue} />
                            <InputItem label="Last name" type="text" value={updateUser.lastName} 
                                        name="lastName" setValue={setValue} />
                            <InputItem label="Email" type="email" value={updateUser.email} 
                                        name="email" setValue={setValue} />

                            <InputItem label="Ảnh của bạn" type="file" ref={avatar} name="image" />
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleClose}>
                            Đóng
                        </Button>
                        {loading?<Loading />:<Button variant="primary" type="submit">Lưu</Button>}
                    </Modal.Footer>
                </Form>
            </Modal>
        </>
    )
}

export default ProfileUser