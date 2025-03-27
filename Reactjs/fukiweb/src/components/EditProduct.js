import { useEffect, useRef, useState } from "react"
import { Link, useNavigate, useParams } from "react-router-dom"
import API, { authAPI, endpoints } from "../configs/API"
import Loading from "../layouts/Loading"
import ErrorAlert from "../layouts/ErrorAlert"
import { Button, Form } from "react-bootstrap"
import InputItem from "../layouts/InputItem"
import ClassicEditor from "@ckeditor/ckeditor5-build-classic"
import { CKEditor } from "@ckeditor/ckeditor5-react"

const EditProduct = () => {
    const [product, setProduct] = useState(null)
    const {productId} = useParams()
    const [categories, setCategories] = useState([])

    const [formProduct, setFormProduct] = useState({
        "name": "",
        "price": "",
        "description": "",
    })
    const [selectedCategory, setSelectedCategory] = useState()
    const image = useRef()

    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")

    const nav = useNavigate()

    useEffect(() => {
        const loadProduct = async () => {
            let res = await authAPI().get(endpoints['product-detail'](productId))

            setProduct(res.data)
            setFormProduct(res.data)
            setSelectedCategory(res.data.category.id)
        }

        const loadCategories = async () => {
            let res = await API.get(endpoints['categories'])
            setCategories(res.data)
        }

        loadProduct()
        loadCategories()
    }, [productId])

    const editProduct = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("name", formProduct.name)
                form.append("price", formProduct.price)
                form.append("description", formProduct.description)
                form.append("category", selectedCategory)

                if (image.current.files.length > 0)
                    form.append("image", image.current.files[0])

                let res = await authAPI().patch(endpoints['action-product'](productId), form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                if (res.status === 200) {
                    nav("/my-shop")
                } else {
                    setErr("Hệ thống bị lỗi! Vui lòng quay lại!")
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
            setErr("Vui lòng nhập tên sản phẩm")
        else if (formProduct.price === "")
            setErr("Vui lòng nhập giá sản phẩm")
        else {
            setLoading(true)
            process()
        }
    }

    //Thay thể dangerouslySetInnerHTML={{__html:  product.description}}
    // const decodeHTMLEntities = (text) => {
    //     var textArea = document.createElement('textarea')
    //     textArea.innerHTML = text
    //     return textArea.value
    // }
    // const htmlString = formProduct ? formProduct.description : ""
    // const decodedString = decodeHTMLEntities(htmlString).replace(/<\/?p>/g, '')

    if (product === null)
        return <Loading />

    console.log(selectedCategory)

    return (
        <>
            <h1 className="text-center">CHỈNH SỬA SẢN PHẨM</h1>
            {err?<ErrorAlert err={err} />:""}
            <Form onSubmit={editProduct}>
                <InputItem label="Tên sản phẩm" type="text" 
                    value={formProduct.name} setValue={e => setFormProduct({...formProduct, "name": e.target.value})} />
                <InputItem label="Giá sản phẩm" type="number"
                    value={parseInt(formProduct.price)} setValue={e => setFormProduct({...formProduct, "price": e.target.value})} />
                {/* <InputItem label="Mô tả sản phẩm" type="text"
                    value={decodedString} setValue={e => setFormProduct({...formProduct, "description": e.target.value})} /> */}
                <Form.Group className="mb-3">
                    <Form.Label>Mô tả sản phẩm</Form.Label>
                    <CKEditor 
                        editor={ClassicEditor}
                        data={formProduct.description}
                        onChange={(event, editor) => setFormProduct({...formProduct, "description": editor.getData()})}
                    />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Loại sản phẩm</Form.Label>
                    <select className="ms-3" onChange={e => setSelectedCategory(e.target.value)}>
                        {categories.map((category) => 
                            category.id === selectedCategory
                            ? <option key={category.id} defaultValue={category.id} selected>{category.name}</option> 
                            : <option key={category.id} value={category.id}>{category.name}</option> 
                        )}
                    </select>
                </Form.Group>
                <InputItem label="Ảnh sản phẩm" type="file" ref={image} name="image" />
                {loading ? <Loading /> : 
                    <>
                        <Button variant="primary" type="submit" className="me-2">Chỉnh sửa</Button>
                        <Link to={"/my-shop"} className="btn btn-danger">Quay lại</Link>
                    </>
                }
            </Form>
        </>
    )
}

export default EditProduct