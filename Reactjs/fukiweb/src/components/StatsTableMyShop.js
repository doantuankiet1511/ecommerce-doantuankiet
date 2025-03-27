import { useContext } from "react"
import { Link } from "react-router-dom"
import { StatsMyShopContext } from "../configs/MyContext"
import { Accordion, Alert, Col, Row, Table } from "react-bootstrap"
import TableStats from "../layouts/TableStats"

const StatsTableMyShop = () => {
    const [statsYear, statsMonth, statsQuarter, setStatsYear, setStatsMonth, setStatsQuarter] = useContext(StatsMyShopContext)

    let buttonComeBack = (
        <Link to={`/stats-shop`} className="btn btn-primary mt-3" 
            onClick={() => {
                setStatsMonth(null)
                setStatsQuarter(null)
                setStatsYear(null)
            }}>
            Quay lại
        </Link>
    )

    if (statsYear && Array.isArray(statsMonth) && statsQuarter === null) {
        return (
            <>
                <TableStats obj={statsYear} statsMonth={statsMonth} />
                {buttonComeBack}
            </>
        )
    }

    if (statsQuarter && Array.isArray(statsMonth) && statsYear) {
        return (
            <>
                <TableStats obj={statsQuarter} statsMonth={statsMonth}/>
                {buttonComeBack}
            </>
        )
    }

    if (typeof statsMonth === 'object' && statsYear) {
        return (
            <>
                <h1 className="text-center">BẢNG THỐNG KÊ DOANH THU THÁNG {statsMonth && statsMonth.month}</h1>
                <div className="d-flex justify-content-between">
                    <div>
                        <h5>Cửa hàng {statsMonth && statsMonth.shop_name}</h5>
                    </div>
                    <div>
                        <h5>
                            Tổng doanh thu {Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(statsMonth && statsMonth.total_revenue ? statsMonth.total_revenue : 0)}
                        </h5>
                    </div>
                </div>
                <Row>
                    <h4>Doanh thu loại sản phẩm</h4>
                    <Table bordered hover variant="light" className="mt-4">
                        <thead className="text-center">
                            <tr>
                                <th>Tên loại sản phẩm</th>
                                <th>Doanh thu</th>
                            </tr>
                        </thead>
                        <tbody>
                            {statsMonth && statsMonth.revenue_category.map( (item) => 
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
                    <h4>Doanh thu sản phẩm</h4>
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
                            {statsMonth && statsMonth.revenue_best_products.map( (item) => 
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
                
                {buttonComeBack}
            </>
        )
    }

    return (
        <>
            <Alert className="mt-2">Vui lòng bấm nút quay lại!</Alert>
            {buttonComeBack}
        </>
    )
}

export default StatsTableMyShop