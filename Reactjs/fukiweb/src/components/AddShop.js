import { useContext, useRef, useState } from "react"
import { Button, Form } from "react-bootstrap"
import { useNavigate } from "react-router-dom"
import Loading from "../layouts/Loading"
import { authAPI, endpoints } from "../configs/API"
import ErrorAlert from "../layouts/ErrorAlert"
import InputItem from "../layouts/InputItem"
import { MyUserContext } from "../configs/MyContext"
import cookie from "react-cookies"
import ClassicEditor from "@ckeditor/ckeditor5-build-classic"
import { CKEditor } from "@ckeditor/ckeditor5-react"

const AddShop = () => {
    const [user, dispatch] = useContext(MyUserContext)
    const [shop, setShop] = useState({
        "name": "",
        "description": ""
    })
    const image = useRef()
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const nav = useNavigate()

    const addShop = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("name", shop.name)
                form.append("description", shop.description)

                if (image.current.files.length > 0)
                    form.append("avatar", image.current.files[0])

                let res = await authAPI().post(endpoints['add-shop'], form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })

                if (res.status === 200) {
                    let user = await authAPI().get(endpoints['current-user'])
                    cookie.save('current-user', user.data) 
        
                    dispatch({
                        "type": "edit",
                        "payload": user.data
                    })

                    nav("/my-shop")
                }
                else
                    setErr("Hệ thống đang có lỗi! Vui lòng quay lại sau!")
            } catch (ex) {
                let msg = ""
                for (let e of Object.values(ex.response.data))
                    msg += `${e}`
                setErr(msg)
            } finally {
                setLoading(false)
            }
        }

        if (user.is_verified === false)
            setErr("Tài khoản của bạn chưa được xác nhận! Vui lòng chờ xác nhận!")
        else if (shop.name === "")
            setErr("Tên cửa hàng không được để trống")
        else {
            setLoading(true)
            process()
        }
    }

    const setValue = (e) => {
        const { name, value } = e.target
        setShop(current => ({...current, [name]: value}))
    }

    return (
        <>
            {user.is_verified ?
            <>
                <h1 className="text-center">Tạo cửa hàng</h1>
                {err ? <ErrorAlert err={err} /> : ""}

                <Form onSubmit={addShop}>
                    <InputItem label="Tên cửa hàng" type="text" value={shop.name}
                                name="name" setValue={setValue} />
                    {/* <InputItem label="Mô tả cửa hàng" type="text" value={shop.description} 
                                name="description" setValue={setValue} /> */}
                    <Form.Group className="mb-3">
                        <Form.Label>Mô tả cửa hàng</Form.Label>
                        <CKEditor 
                            editor={ClassicEditor}
                            data={shop.description}
                            onChange={(event, editor) => setShop({...shop, "description": editor.getData()})}
                        />
                    </Form.Group>
                    <InputItem label="Ảnh cửa hàng" type="file" ref={image} name="image" />
                
                    {loading?<Loading />:<Button variant="primary" type="submit">Tạo</Button>}
            </Form>
            </> : <ErrorAlert err="Tài khoản của bạn chưa được xác nhận! Vui lòng chờ xác nhận!"/>}
        </>
    )
}

export default AddShop