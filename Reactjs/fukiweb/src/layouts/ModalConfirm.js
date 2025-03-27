import { useState } from "react";
import { Button, Modal } from "react-bootstrap"
import { authAPI, endpoints } from "../configs/API";

const ModalConfirm = ({ obj, setLoading }) => {
    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const confirmRegister = (id) => {
        const process = async () => {
            let res = await authAPI().patch(endpoints['confirm-seller'](id))
            if (res.status === 200) {
                handleClose()
                setLoading(false)
            } else {
                alert("Xác nhận tài khoản không thành công")
            }
        }
        setLoading(true)
        process()
    }

    return (
        <>
            <Button variant="primary" onClick={handleShow}>
                Xác nhận
            </Button>

            <Modal show={show} onHide={handleClose}>
                <Modal.Header closeButton>
                    <Modal.Title>Xác nhận tài khoản</Modal.Title>
                </Modal.Header>
                <Modal.Body className="text-center">
                    Bạn muốn xác nhận tài khoản {obj.username}?
                </Modal.Body>
                <Modal.Footer className="justify-content-center">
                    <Button variant="primary" onClick={() => confirmRegister(obj.id)}>
                        Xác nhận
                    </Button>
                    <Button variant="secondary" onClick={handleClose}>
                        Close
                    </Button>
                </Modal.Footer>
            </Modal>
        </>
    )
}

export default ModalConfirm