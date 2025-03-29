import { useEffect, useRef, useState } from "react"
import InputItem from "../layouts/InputItem"
import { Button, Form } from "react-bootstrap"
import API, { authAPI, endpoints } from "../configs/API"
import Loading from "../layouts/Loading"
import { Link, useNavigate } from "react-router-dom"
import ErrorAlert from "../layouts/ErrorAlert"
import InputTags from "../layouts/InputTags"
import ClassicEditor from "@ckeditor/ckeditor5-build-classic"
import { CKEditor } from "@ckeditor/ckeditor5-react"

const AddProduct = () => {
    const [formProduct, setFormProduct] = useState({
        "name": "",
        "price": "",
        "description": "",
        "category": "",
    })
    const image = useRef()
    const [tagsValue, setTagsValue] = useState([])

    const [categories, setCategories] = useState([])

    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const nav = useNavigate()

    useEffect(() => {
        const loadCategories = async () => {
            let res = await API.get(endpoints['categories'])
            setCategories(res.data)
        }

        loadCategories()
    }, [])

    const addProduct = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("name", formProduct.name)
                form.append("price", formProduct.price)
                form.append("description", formProduct.description)
                form.append("category", formProduct.category)
                form.append("tags", JSON.stringify(tagsValue))

                if (image.current.files.length > 0)
                    form.append("image", image.current.files[0])
                
                let res = await authAPI().post(endpoints['add-product'], form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                console.log(res.data)
                if (res.status === 201) {
                    setFormProduct({
                        "name": "",
                        "price": "",
                        "description": "",
                        "category": ""
                    })
                    setTagsValue([])
                    nav("/my-shop")
                } else {
                    setErr("Hệ thống đang bị lỗi! Vui lòng quay lại sau!")
                }
            } catch (ex) {
                let msg = ""
                for (let e of Object.values(ex.response.data))
                    msg += `${e}`
                setErr(msg)
            } finally {
                setLoading(false)
            }
        }

        if (formProduct.name === "")
            setErr("Bạn cần phải nhập tên sản phẩm")
        else if (formProduct.price === "")
            setErr("Bạn cần phải nhập giá của sản phẩm")
        else if (formProduct.category === "")
            setErr("Bạn cần lựa chọn loại sản phẩm")
        else if (image.current.files.length === 0)
            setErr("Bạn cần phải thêm ảnh của sản phẩm")
        else {
            setLoading(true)
            process()
        }
    }
console.log(formProduct)
    return (
        <>
            <h1 className="text-center">Thêm sản phẩm</h1>
            {err?<ErrorAlert err={err} />:""}
            <Form onSubmit={addProduct}>
                <InputItem label="Tên sản phẩm" type="text" 
                    value={formProduct.name} setValue={e => setFormProduct({...formProduct, "name": e.target.value})} />
                <InputItem label="Giá sản phẩm" type="number"
                    value={formProduct.price} setValue={e => setFormProduct({...formProduct, "price": e.target.value})} />
                {/* <InputItem label="Mô tả sản phẩm" type="text"
                    value={formProduct.description} setValue={e => setFormProduct({...formProduct, "description": e.target.value})} /> */}
                <Form.Group className="mb-3">
                    <Form.Label>Mô tả sản phẩm</Form.Label>
                    <CKEditor 
                        editor={ClassicEditor}
                        onChange={(event, editor) => setFormProduct({...formProduct, "description": editor.getData()})}
                    />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Loại sản phẩm</Form.Label>
                    <select className="ms-3" value={formProduct.category} onChange={e => setFormProduct({...formProduct, "category": e.target.value})}>
                        <option value=""></option>
                        {categories.map((category) => 
                            <option key={category.id} value={category.id}>{category.name}</option>
                        )}
                    </select>
                </Form.Group>
                <InputTags tagsValue={tagsValue} setTagsValue={setTagsValue} />

                <InputItem label="Ảnh sản phẩm" type="file" ref={image} name="image" />

                {loading ? <Loading /> : 
                    <>
                        <Button variant="primary" type="submit" className="me-2">Thêm sản phẩm</Button>
                        <Link to={"/my-shop"} className="btn btn-danger">Quay lại</Link>
                    </>
                }
            </Form>
        </>
    )
}

export default AddProduct