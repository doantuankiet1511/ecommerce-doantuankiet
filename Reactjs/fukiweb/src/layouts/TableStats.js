import { Accordion, Col, Row, Tab, Table, Tabs } from "react-bootstrap"

const TableStats = ({ obj, statsMonth }) => {
    let title = (
        <>
            {obj.year && (
                <h1 className="text-center">BẢNG THỐNG KÊ DOANH THU NĂM {obj.year}</h1>
            )}
            {obj.quarter && (
                <h1 className="text-center">BẢNG THỐNG KÊ DOANH THU QUÝ {obj.quarter}</h1>
            )}
        </>
    )
    return (
        <>
            {title}
            <div className="d-flex justify-content-between">
                <div>
                    <h5>Cửa hàng {obj && obj.shop_name}</h5>
                </div>
                <div>
                    <h5>
                        Tổng doanh thu {Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(obj && obj.total_revenue ? obj.total_revenue : 0)}
                    </h5>
                </div>
            </div>
            <Tabs
                defaultActiveKey="revenue_products"
                id="justify-tab-example"
                className="mb-3"
                justify
            >
                <Tab eventKey="revenue_products" title="Doanh thu sản phẩm">
                    <Row>
                        <h4 className="text-center">Doanh thu sản phẩm</h4>
                        <Table bordered hover variant="light" className="mt-4">
                            <thead className="text-center">
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Tổng số lượng</th>
                                    <th>Doanh thu</th>
                                </tr>
                            </thead>
                            <tbody>
                                {obj && obj.revenue_best_products.map( (item) => 
                                    <>
                                        <tr key={item.id}>
                                            <td>{item.name}</td>
                                            <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.price ? item.price : 0)}</td>
                                            <td>{item.total_quantity_sold ? item.total_quantity_sold : 0}</td>
                                            <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.revenue_sold ? item.revenue_sold : 0)}</td>
                                        </tr>
                                    </>
                                )}
                            </tbody>
                        </Table>
                    </Row>
                    <Row>
                        <h4 className="text-center">DOANH THU CÁC SẢN PHẨM TRONG {statsMonth.length >= 12 ? "12 THÁNG" : `QUÝ ${obj.quarter}`}</h4>
                        <Accordion defaultActiveKey={['0']} alwaysOpen>
                            {statsMonth && statsMonth.sort((a, b) => parseInt(a.month) - parseInt(b.month)).map( (itemM, index) => {
                                return (
                                    <>
                                        <Accordion.Item eventKey={index}>
                                            <Accordion.Header>
                                                    <Col md={5} xs={5}>Tháng {itemM.month}</Col>
                                                    <Col md={5} xs={5}>
                                                        Doanh thu {Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(itemM.total_revenue ? itemM.total_revenue : 0)}
                                                    </Col>
                                            </Accordion.Header>
                                            <Accordion.Body>
                                                <Table bordered hover variant="light" className="mt-4">
                                                    <thead className="text-center">
                                                        <tr>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Giá</th>
                                                            <th>Tổng số lượng</th>
                                                            <th>Doanh thu</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {itemM.revenue_best_products.map((item) => 
                                                            <>
                                                                <tr key={item.id}>
                                                                    <td>{item.name}</td>
                                                                    <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.price ? item.price : 0)}</td>
                                                                    <td>{item.total_quantity_sold ? item.total_quantity_sold : 0}</td>
                                                                    <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.revenue_sold ? item.revenue_sold : 0)}</td>
                                                                </tr>
                                                            </>
                                                        )}
                                                    </tbody>
                                                </Table>
                                            </Accordion.Body>
                                        </Accordion.Item>
                                    </>
                                )
                            })}
                        </Accordion>
                    </Row>
                </Tab>
                <Tab eventKey="revenue_categories" title="Doanh thu loại sản phẩm">
                    <Row>
                        <h4 className="text-center">Doanh thu loại sản phẩm</h4>
                        <Table bordered hover variant="light" className="mt-4">
                            <thead className="text-center">
                                <tr>
                                    <th>Tên loại sản phẩm</th>
                                    <th>Doanh thu</th>
                                </tr>
                            </thead>
                            <tbody>
                                {obj && obj.revenue_category.map( (item) => 
                                    <>
                                        <tr key={item.id}>
                                            <td>{item.name}</td>
                                            <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.total_revenue_cate ? item.total_revenue_cate : 0)}</td>
                                        </tr>
                                    </>
                                )}
                            </tbody>
                        </Table>
                    </Row>
                    <Row>
                        <h4 className="text-center">DOANH THU CÁC LOẠI SẢN PHẨM TRONG {statsMonth.length >= 12 ? "12 THÁNG" : `QUÝ ${obj.quarter}`}</h4>
                        <Accordion defaultActiveKey={['0']} alwaysOpen>
                            {statsMonth && statsMonth.sort((a, b) => parseInt(a.month) - parseInt(b.month)).map( (itemM, index) => {
                                return (
                                    <>
                                        <Accordion.Item eventKey={index}>
                                            <Accordion.Header>
                                                <Col md={5} xs={5}>Tháng {itemM.month}</Col>
                                                <Col md={5} xs={5}>
                                                    Doanh thu {Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(itemM.total_revenue ? itemM.total_revenue : 0)}
                                                </Col>
                                            </Accordion.Header>
                                            <Accordion.Body>
                                                <Table bordered hover variant="light" className="mt-4">
                                                    <thead className="text-center">
                                                        <tr>
                                                            <th>Tên loại sản phẩm</th>
                                                            <th>Doanh thu</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {itemM.revenue_category.map((item) => 
                                                            <>
                                                                <tr key={item.id}>
                                                                    <td>{item.name}</td>
                                                                    <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.total_revenue_cate ? item.total_revenue_cate : 0)}</td>
                                                                </tr>
                                                            </>
                                                        )}
                                                    </tbody>
                                                </Table>
                                            </Accordion.Body>
                                        </Accordion.Item>
                                    </>
                                )
                            })}
                        </Accordion>
                    </Row>
                </Tab>
            </Tabs>
        </>
    )
}

export default TableStats