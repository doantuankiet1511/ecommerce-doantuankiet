import { useEffect, useState } from "react";
import { Button, Form, Modal } from "react-bootstrap";
import InputTags from "./InputTags";
import { authAPI, endpoints } from "../configs/API";

const ModalUpdateTags = ({ obj, setAction }) => {
    const [tagsValue, setTagsValue] = useState([])
    const [err, setErr] = useState("")

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const tagsProduct = obj.tags.map((item) => {
        return item.name
    })

    useEffect(() => {
        const loadTags = () => {
            setTagsValue(tagsProduct)
        }
        loadTags()
    }, [show])

    const updatedTags = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let res = await authAPI().put(endpoints['updated-tags'](obj.id), {
                    "tags": tagsValue
                })
                if (res.status === 200) {
                    console.log(res.data.tags.map((item) => item.name))
                    handleClose()
                } else {
                    setErr("Cập nhật không thành công!")
                }
            } catch (ex) {
                let msg = ""
                for (let e of Object.values(ex.response.data))
                    msg += `${e} `
                setErr(msg)
            } finally {
                setAction(false)
            }
        }

        setAction(true)
        process()
    }

    return (
        <>
            <Button variant="primary" onClick={handleShow}>
                Cập nhật tags
            </Button>

            <Modal show={show} onHide={handleClose}>
                <Form onSubmit={updatedTags}>
                    <Modal.Header closeButton>
                        <Modal.Title>Cập nhật tags của sản phẩm {obj.name}</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                            <InputTags tagsValue={tagsValue} setTagsValue={setTagsValue} />
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleClose}>
                            Close
                        </Button>
                        <Button variant="primary" type="submit">
                            Cập nhật
                        </Button>
                    </Modal.Footer>
                </Form>
            </Modal>
        </>
    )
}

export default ModalUpdateTags