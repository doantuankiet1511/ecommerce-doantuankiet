import { useContext, useEffect } from "react"
import { useState } from "react"
import { authAPI, endpoints } from "../configs/API"
import { Button, Col, FloatingLabel, Form, InputGroup, Row, Tab, Tabs } from "react-bootstrap"
import BarChart from "../charts/BarChart"
import { Link } from "react-router-dom"
import { StatsMyShopContext } from "../configs/MyContext"
import LineChart from "../charts/LineChart"

const StatsMyShop = () => {
    const [statsYear, statsMonth, statsQuarter, setStatsYear, setStatsMonth, setStatsQuarter] = useContext(StatsMyShopContext)

    const currentYear = new Date().getFullYear()
    const [year, setYear] = useState(currentYear)
    const [month, setMonth] = useState("")
    const [quarter, setQuarter] = useState("")
    const [action, setAction] = useState(false)

    const months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    const quarters = [1, 2, 3, 4]
    const month_quarter = [(quarter - 1) * 3 + 1, (quarter - 1) * 3 + 2, (quarter - 1) * 3 +3]

    const [inputYear, setInputYear] = useState({
        "start": "",
        "end": ""
    })
    const [statsListYears, setStatsListYears] = useState([])
    
    const handleSubmitStats = (evt) => {
        evt.preventDefault()
        const process = async () => {
            let resYear = await authAPI().post(endpoints['revenue-stats-year'], {
                "year": year
            })
            // console.log("Năm", resYear.data)
            setStatsYear(resYear.data)
            
            if (month !== "") {
                let resMonth = await authAPI().post(endpoints['revenue-stats-month'], {
                    "year": year,
                    "month": month
                })
                // console.log("Month", resMonth.data)
                setStatsMonth(resMonth.data)
            } else if (quarter !== "") {
                let dataMonthQuarter = []
                for await (const month of month_quarter) {
                    let resMonth = await authAPI().post(endpoints['revenue-stats-month'], {
                        "year": year,
                        "month": month
                    })
                    // console.log("Month" + `${month}`, resMonth.data)
                    dataMonthQuarter.push(resMonth.data)
                }
                setStatsMonth(dataMonthQuarter)
            } else {
                let dataMonths = []
                for await (const number of months) {
                    let resMonth = await authAPI().post(endpoints['revenue-stats-month'], {
                        "year": year,
                        "month": number
                    })
                    // console.log("Month" + `${number}`, resMonth.data)
                    dataMonths.push(resMonth.data)
                }
                setStatsMonth(dataMonths)
            }

            if (quarter !== "") {
                let resQuarter = await authAPI().post(endpoints['revenue-stats-quarter'], {
                    "year": year,
                    "quarter": quarter
                })
                // console.log("Quý", resQuarter.data)
                setStatsQuarter(resQuarter.data)
            } else {
                setStatsQuarter(null)
            }
            
            setAction(true)
        }

        if (quarter && month && month_quarter.includes(parseInt(month)) === false)
            alert(`Tháng ${month} bạn chọn không nằm trong quý ${quarter}`)
        else if (year > currentYear)
            alert(`Bạn nên nhập từ năm ${currentYear} trở về trước`)
        else if (year === "") {
            setYear(currentYear)
            process()
        }
        else {
            process()
        }
    }

    const handleSubmitStatsYear = (evt) => {
        evt.preventDefault()
        const process = async () => {
            let listYears = []
            for (let i = parseInt(inputYear.start); i <= parseInt(inputYear.end); i++) {
                listYears.push(i)
            }

            let dataListYears = []
            for await (const year of listYears) {
                let resListYears = await authAPI().post(endpoints['revenue-stats-year'], {
                    "year": year
                })
                dataListYears.push(resListYears.data)
            }
            setStatsListYears(dataListYears)
        }

        if (inputYear.start > inputYear.end)
            return alert("Năm bắt đầu không được lớn hơn năm kết thúc")
        else if (inputYear.end > currentYear)
            return alert("Năm kết thúc phải nhỏ hơn năm hiện tại")
        else
            process()
    }

    const BarChartYear = () => {
        if (statsYear !== null) {
            const dataStatsYear = {
                labels: statsYear.revenue_best_products.map((item) => item.name),
                datasets: [
                  {
                    label: 'Số lượng sản phẩm bán ra',
                    data: statsYear.revenue_best_products.map((item) => item.total_quantity_sold),
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                  },
                ],
            };
            const optionsStatsYear = {
                responsive: true,
                plugins: {
                  legend: {
                    position: 'top',
                  },
                  title: {
                    display: true,
                    text: `Thống kê số lượng sản phẩm trong năm ${year}`,
                  },
                },
            };
            return (action && <BarChart data={dataStatsYear} options={optionsStatsYear}/>)
        }
    }

    const BarChartMonth = () => {
        if (statsMonth !== null && typeof statsMonth === 'object') {
            const dataStatsMonth = {
                labels: statsMonth.revenue_best_products.map((item) => item.name),
                datasets: [
                  {
                    label: 'Số lượng sản phẩm bán ra',
                    data: statsMonth.revenue_best_products.map((item) => item.total_quantity_sold),
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                  },
                ],
            };
            const optionsStatsMonth = {
                responsive: true,
                plugins: {
                  legend: {
                    position: 'top',
                  },
                  title: {
                    display: true,
                    text: `Thống kê số lượng sản phẩm trong tháng ${month}`,
                  },
                },
            };
            return (action && <BarChart data={dataStatsMonth} options={optionsStatsMonth}/>)
        }
    }

    const BarChartQuarter = () => {
        if (statsQuarter !== null && quarter !== null) {
            const dataStatsQuarter = {
                labels: statsQuarter.revenue_best_products.map((item) => item.name),
                datasets: [
                  {
                    label: 'Số lượng sản phẩm bán ra',
                    data: statsQuarter.revenue_best_products.map((item) => item.total_quantity_sold),
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                  },
                ],
            };
            const optionsStatsMonth = {
                responsive: true,
                plugins: {
                  legend: {
                    position: 'top',
                  },
                  title: {
                    display: true,
                    text: `Thống kê số lượng sản phẩm trong quý ${quarter}`,
                  },
                },
            };
            return (action && <BarChart data={dataStatsQuarter} options={optionsStatsMonth}/>)
        }
    }

    const LineListYears = () => {
        if (statsListYears.length > 0) {
            const data = {
                labels: statsListYears.sort((a, b) => parseInt(a.year) - parseInt(b.year)).map((item) => item.year),
                datasets: [
                  {
                    label: 'Tổng doanh thu từng năm',
                    data: statsListYears.sort((a, b) => parseInt(a.year) - parseInt(b.year)).map((item) => item.total_revenue),
                    borderColor: 'rgb(255, 99, 132)',
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                  },
                ],
            };
            const options = {
                responsive: true,
                plugins: {
                  legend: {
                    position: 'top',
                  },
                  title: {
                    display: true,
                    text: `Thống kê doanh thu từ năm ${inputYear.start} đến năm ${inputYear.end}`,
                  },
                },
            };
            return (<LineChart data={data} options={options} />)
        }
    }
    // console.log("Stats", statsMonth, statsYear, statsQuarter)

    return (
        <>
            <h1 className="text-center">THỐNG KÊ DOANH THU</h1>
            <Tabs
                defaultActiveKey="month_quarter_year"
                id="fill-tab-example"
                className="mb-3"
                fill
            >
                <Tab eventKey="month_quarter_year" title="Tháng - Quý - Năm">
                    <Form onSubmit={handleSubmitStats}>
                        <Row>
                            <Col>
                                <FloatingLabel controlId="floatingInput" label="Năm">
                                    <Form.Control type="text" placeholder="Nhập năm ..." value={year} 
                                        onChange={(e) => {
                                            setYear(e.target.value);
                                            setAction(false)
                                        }}/>
                                </FloatingLabel>
                            </Col>
                            <Col>
                                <FloatingLabel controlId="floatingSelectGrid" label="Tháng">
                                    <Form.Select aria-label="Floating label select example" 
                                        onChange={(e) => {
                                            setMonth(e.target.value); 
                                            setAction(false);
                                        }}>
                                        <option value="">Lựa chọn tháng</option>
                                        {months.map((number) => <option key={number} value={number}>Tháng {number}</option>)}
                                    </Form.Select>
                                </FloatingLabel>
                            </Col>
                            <Col>
                                <FloatingLabel controlId="floatingSelectGrid" label="Quý">
                                    <Form.Select aria-label="Floating label select example" 
                                        onChange={(e) => {
                                            setQuarter(e.target.value); 
                                            setAction(false);
                                        }}>
                                        <option value="">Lựa chọn quý</option>
                                        {quarters.map((quarter) => <option key={quarter} value={quarter}>Quý {quarter}</option>)}
                                    </Form.Select>
                                </FloatingLabel>
                            </Col>
                            <Col>
                                <Button variant="primary" type="submit" className="mt-2">Thống kê</Button>
                            </Col>
                        </Row>
                    </Form>
                    <Row>
                        {action && <Link to={`/stats-table-shop`} className="btn btn-primary mt-3">Xem chi tiết</Link>}
                    </Row>
                    <Row>
                        {statsYear !== null && Array.isArray(statsMonth) === true && quarter === "" ? BarChartYear() : ""}
                        {Array.isArray(statsMonth) === false && BarChartMonth()}
                        {quarter !== null && statsQuarter !== null && BarChartQuarter()}
                    </Row>
                </Tab>
                <Tab eventKey="years" title="Các năm">
                    <Form onSubmit={handleSubmitStatsYear}>
                        <Row>
                            <Col>
                                <InputGroup className="mb-3">
                                    <InputGroup.Text id="inputGroup-sizing-default">
                                        Từ năm
                                    </InputGroup.Text>
                                    <Form.Control
                                        aria-label="Default"
                                        aria-describedby="inputGroup-sizing-default"
                                        value={inputYear.start}
                                        onChange={(evt) => {setInputYear({...inputYear, "start": evt.target.value}); setStatsListYears([])}}
                                    />
                                </InputGroup>
                            </Col>
                            <Col>
                                <InputGroup className="mb-3">
                                    <InputGroup.Text id="inputGroup-sizing-default">
                                        Đến năm
                                    </InputGroup.Text>
                                    <Form.Control
                                        aria-label="Default"
                                        aria-describedby="inputGroup-sizing-default"
                                        value={inputYear.end}
                                        onChange={(evt) => {setInputYear({...inputYear, "end": evt.target.value}); setStatsListYears([])}}
                                    />
                                </InputGroup>
                            </Col>
                            <Col>
                                <Button variant="primary" type="submit">Thống kê</Button>
                            </Col>
                        </Row>
                    </Form>
                    <Row>
                        {statsListYears.length > 0 && LineListYears()}
                    </Row>
                </Tab>
            </Tabs>
        </>
    )
}

export default StatsMyShop