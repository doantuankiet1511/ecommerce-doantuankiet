import { useEffect, useRef, useState } from "react"
import { authAPI, endpoints } from "../configs/API"
import { Badge, Button, ButtonGroup, Col, Form, Image, Modal, Row, Table } from "react-bootstrap"
import Loading from "../layouts/Loading"
import { Link } from "react-router-dom"
import Moment from "react-moment"
import ModalUpdateTags from "../layouts/ModalUpdateTags"
import ErrorAlert from "../layouts/ErrorAlert"
import InputItem from "../layouts/InputItem"
import ClassicEditor from "@ckeditor/ckeditor5-build-classic"
import { CKEditor } from "@ckeditor/ckeditor5-react"
import PaginationUI from "../layouts/PaginationUI"

const MyShop = () => {
    const [shopDetail, setShopDetail] = useState(null)
    const [page, setPage] = useState(1)
    const [formEditShop, setFormEditShop] = useState({
        "name": "",
        "description": "",
    })
    const image = useRef()
    const [actionProduct, setActionProduct] = useState(false)
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const [errEdit, setErrEdit] = useState("")
    const [totalProducts, setTotalProducts] = useState(0)
    const [productsPerPage, setProductsPerPage] = useState(10)

    const [show, setShow] = useState(false);

    const handleClose = () => {
        setShow(false);
        if (errEdit)
            setErrEdit("")
    } 
    const handleShow = () => setShow(true);

    useEffect(() => {
        const loadMyShopDetail = async () => {
            try {
                let e = `${endpoints['my-shop']}?page=${page}`
                let res = await authAPI().get(e)
                console.log(res.data.results)
                setShopDetail(res.data.results)
                setFormEditShop(res.data.results.shop)
                setTotalProducts(res.data.count)
            } catch (ex) {
                setPage(1)
            }
        }

        loadMyShopDetail()
    }, [page, actionProduct, show])

    if (formEditShop.description === null) {
        setFormEditShop({...formEditShop, "description": ""})
    }

    const editShop = (evt , id) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("name", formEditShop.name)
                if (formEditShop.description !== null)
                    form.append("description", formEditShop.description)
                if (image.current.files.length > 0)
                    form.append("avatar", image.current.files[0])

                let res = await authAPI().patch(endpoints['edit-shop'](id), form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                
                if (res.status === 200) {
                    setFormEditShop(res.data)
                    setTimeout(() => handleClose(), 1000)
                    alert("Chỉnh sửa thành công")
                }
            } catch (ex) {
                setErrEdit("Hệ thống đang bị lỗi")
            } finally {
                setLoading(false)
            }
        }

        if (formEditShop.name === "")
            setErrEdit("Tên cửa hàng không được để trống!")
        else {
            setLoading(true)
            process()
        }
    }

    const deletedProduct = (obj) => {
        const process = async () => {
            try {
                let res = await authAPI().delete(endpoints['action-product'](obj.id))
                if (res.status === 204) {
                    alert("Xóa thành công")
                }
            } catch (ex) {
                setErr("Sản phẩm đang có đơn đặt hàng! Không thể xóa sản phẩm " + `${obj.name}`)
            } finally {
                setActionProduct(false)
            }
        }

        if (window.confirm("Bạn có chắc chắn muốn xóa sản phẩm " + `${obj.name}` + "?")) {
            setActionProduct(true)
            process()
        }
    }

    const nextPage = () => setPage(current => current + 1)
    const prevPage = () => setPage(current => current - 1)

    if (shopDetail === null)
        return (
            <>
                <ErrorAlert err="Bạn chưa tạo cửa hàng" />
                <Link to={`/create-shop`} className="btn btn-primary">Tạo cửa hàng</Link>
            </>
        )

    return (
        <>
            <h1 className="text-center">CỬA HÀNG CỦA TÔI</h1>
            <Row className="mt-2">
                <Col md={4} className="text-center">
                    <Image src={shopDetail.shop.image||shopDetail.shop.avatar} alt={shopDetail.shop.name} width="40%"/>
                </Col>
                <Col md={8}>
                    <Row>
                        <Col md={3}>Tên cửa hàng</Col>
                        <Col md={9}>{shopDetail.shop.name}</Col>
                    </Row>
                    <Row>
                        <Col md={3}>Mô tả</Col>
                        <Col md={9} className="_p-features" dangerouslySetInnerHTML={{ __html: shopDetail.shop.description }}></Col>
                    </Row>
                    <Row>
                        <Col md={3}>Số lượng sản phẩm</Col>
                        <Col md={9}>{shopDetail.shop.product_count}</Col>
                    </Row>
                </Col>
            </Row>
            <Row>
                <Button className="mt-2" variant="primary" onClick={handleShow}>
                    Chỉnh sửa cửa hàng
                </Button>

                <Modal show={show} onHide={handleClose}>
                    <Form onSubmit={(evt) => editShop(evt, shopDetail.shop.id)}>
                        <Modal.Header closeButton>
                            <Modal.Title>Chỉnh sửa cửa hàng</Modal.Title>
                        </Modal.Header>
                        <Modal.Body>
                            {errEdit ? <ErrorAlert err={errEdit} /> : ""}
                            <InputItem label="Tên cửa hàng" type="text" value={formEditShop.name}
                                        setValue={e => setFormEditShop({...formEditShop , "name": e.target.value})} />
                            {/* <InputItem label="Mô tả" type="text" value={formEditShop.description}
                                        setValue={e => setFormEditShop({...formEditShop , "description": e.target.value})} /> */}
                            <Form.Group className="mb-3">
                                <Form.Label>Mô tả cửa hàng</Form.Label>
                                <CKEditor 
                                    editor={ClassicEditor}
                                    data={formEditShop.description}
                                    onChange={(event, editor) => setFormEditShop({...formEditShop, "description": editor.getData()})}
                                />
                            </Form.Group>
                            <InputItem label="Ảnh cửa hàng" type="file" ref={image} name="image" />
                        </Modal.Body>
                        <Modal.Footer>
                            <Button variant="secondary" onClick={handleClose}>
                                Close
                            </Button>
                            <Button variant="primary" type="submit">Lưu</Button>
                        </Modal.Footer>
                    </Form>
                </Modal>
            </Row>
            <Row>
                <h4 className="mt-3 text-center">DANH SÁCH SẢN PHẨM</h4>
                <Link to={`/add-product`}> 
                    <Button>Thêm sản phẩm</Button>
                </Link>
                {err ? <ErrorAlert err={err}/> : ""}
                <Table striped bordered hover variant="light" className="mt-4">
                    <thead className="text-center">
                        <tr>
                            <th>STT</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Loại sản phẩm</th>
                            <th>Giá</th>
                            <th>Ngày tạo</th>
                            <th>Tags</th>
                            <th colSpan={4}></th>
                        </tr>
                    </thead>
                    <tbody>
                        {shopDetail.products.sort((a, b) => new Date(b.updated_date) - new Date(a.updated_date)).map((product, index) => 
                            <>
                                <tr key={product.id}>
                                    <td className="text-center">{index + 1}</td>
                                    <td className="text-center">
                                        <Image src={product.image} alt={product.name} width="30%"/>
                                    </td>
                                    <td>{product.name}</td>
                                    <td>{product.category.name}</td>
                                    <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.price)}</td>
                                    <td style={{width: 100}}>{product.updated_date ? <Moment format="YYYY-MM-DD HH:mm">{product.updated_date}</Moment> : <Moment format="YYYY-MM-DD HH:mm">{product.created_date}</Moment>} </td>
                                    <td style={{width: 100}}>{product.tags.map((tag) => <Badge key={tag.id} className="me-1">{tag.name}</Badge>)}</td>
                                    <td>
                                        <Link to={`/products/${product.id}`} className="btn btn-primary">Xem</Link>
                                    </td>
                                    <td>
                                        <Link to={`/edit-product/${product.id}`} className="btn btn-secondary">Sửa</Link>
                                    </td>
                                    <td style={{width: 144}}>
                                        <ModalUpdateTags obj={product} setAction={setActionProduct} />
                                    </td>
                                    <td>
                                        <Button onClick={() => deletedProduct(product)} className="btn btn-danger">Xóa</Button>
                                    </td>
                                </tr>
                            </>
                        )}
                    </tbody>
                </Table>
            </Row>
            <Row>
                <PaginationUI totalItems={totalProducts} itemsPerPage={productsPerPage} currentPage={page} setCurrentPage={setPage} />
                {/* <ButtonGroup aria-label="Basic example" className="mt-2">
                    <Button onClick={prevPage} variant="outline-primary">&lt;&lt;</Button>
                    <Button onClick={nextPage} variant="outline-primary">&gt;&gt;</Button>
                </ButtonGroup> */}
            </Row>
        </>
    )
}

export default MyShop