import {
    ContactsTwoTone,
    DashboardOutlined,
    EnvironmentTwoTone,
    FolderOpenTwoTone,
    HddTwoTone,
    HomeOutlined,
    NotificationTwoTone,
    ShopTwoTone,
    ShoppingTwoTone
} from '@ant-design/icons';
import {
    BackTop,
    Breadcrumb,
    Card,
    Col,
    Row,
    Spin
} from 'antd';
import React, { useEffect, useState } from 'react';
import dashBoardApi from "../../apis/dashBoardApi";
import "./dashBoard.css";
import fieldtypesApi from '../../apis/fieldtypesApi';
import areaManagementApi from '../../apis/areaManagementApi';
import productTypeAPI from '../../apis/productTypeApi';
import productAPI from '../../apis/productApi';
import tournamentApi from '../../apis/tournamentApi';
import courtsManagementApi from '../../apis/courtsManagementApi';
import userApi from '../../apis/userApi';
import statisticsApi from '../../apis/statisticsApi';
import bookingApi from '../../apis/bookingApi';

const DashBoard = () => {
    const [statisticList, setStatisticList] = useState([]);
    const [loading, setLoading] = useState(true);
    const [total, setTotalList] = useState([]);
    const [area, setArea] = useState([]);
    const [type, setType] = useState([]);
    const [tournament, setTournament] = useState([]);
    const [product, setProduct] = useState([]);
    const [courts, setCourts] = useState([]);
    const [userData, setUserData] = useState({ _id: null });
    const [statisticListSeller, setStatisticListSeller] = useState([]);
    const [bookingData, setBookingData] = useState([]);
    const [startDate, setStartDate] = useState('2024-01-01');
    const [endDate, setEndDate] = useState('2024-12-31');

    useEffect(() => {
        const fetchData = async () => {
            try {
                setLoading(true);

                const userResponse = await userApi.getProfile();
                console.log("API Response:", userResponse);
                if (userResponse && userResponse.user) {
                    setUserData(userResponse.user);

                    const fetchPromises = [
                        fieldtypesApi.getAllFieldTypes(),
                        statisticsApi.getAllStatistics(userResponse.user.id),
                        productTypeAPI.getAllProductTypes(),
                        productAPI.getAllProducts(),
                        courtsManagementApi.getAllCourts(),
                        areaManagementApi.getAllAreas(),
                        tournamentApi.getAllTournaments(),
                        dashBoardApi.getAssetStatistics(),
                    ];

                    if (userResponse.user.role === "isAdmin") {
                        fetchPromises.push(bookingApi.getDetailedRevenueReport(startDate, endDate));
                    } else {
                        fetchPromises.push(bookingApi.getDetailedRevenueReport(startDate, endDate, userResponse.user.id));
                    }

                    const [
                        fieldTypes,
                        statistics,
                        productTypes,
                        products,
                        courts,
                        areas,
                        tournaments,
                        assetStatistics,
                        bookingReport
                    ] = await Promise.all(fetchPromises);

                    setTotalList(fieldTypes);
                    setStatisticListSeller(statistics);
                    setType(productTypes);
                    setProduct(products);
                    setCourts(courts);
                    setArea(areas);
                    setTournament(tournaments);
                    setStatisticList(assetStatistics);
                    setBookingData(bookingReport);
                }
            } catch (error) {
                console.error('Failed to fetch data:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [startDate, endDate]);

    const renderAdminCards = () => (
        <>
            <Row gutter={12} style={{ marginTop: 20 }}>
                <Col span={6}>
                    <Card className="card_total" bordered={false}>
                        <div className='card_number'>
                            <div>
                                <div className='number_total'>{statisticList?.userCount || 0}</div>
                                <div className='title_total'>Số thành viên</div>
                            </div>
                            <div>
                                <ContactsTwoTone style={{ fontSize: 48 }} />
                            </div>
                        </div>
                    </Card>
                </Col>
                <Col span={6}>
                    <Card className="card_total" bordered={false}>
                        <div className='card_number'>
                            <div>
                                <div className='number_total'>{total?.length || 0}</div>
                                <div className='title_total'>Tổng loại sân</div>
                            </div>
                            <div>
                                <NotificationTwoTone style={{ fontSize: 48 }} />
                            </div>
                        </div>
                    </Card>
                </Col>
                <Col span={6}>
                    <Card className="card_total" bordered={false}>
                        <div className='card_number'>
                            <div>
                                <div className='number_total'>{area?.length || 0}</div>
                                <div className='title_total'>Số khu vực</div>
                            </div>
                            <div>
                                <EnvironmentTwoTone style={{ fontSize: 48 }} />
                            </div>
                        </div>
                    </Card>
                </Col>
                <Col span={6}>
                    <Card className="card_total" bordered={false}>
                        <div className='card_number'>
                            <div>
                                <div className='number_total'>{type?.length || 0}</div>
                                <div className='title_total'>Số loại dịch vụ</div>
                            </div>
                            <div>
                                <ShoppingTwoTone style={{ fontSize: 48 }} />
                            </div>
                        </div>
                    </Card>
                </Col>
            </Row>
            <Row gutter={12} style={{ marginTop: 20 }}>
                <Col span={6}>
                    <Card className="card_total" bordered={false}>
                        <div className='card_number'>
                            <div>
                                <div className='number_total'>{product?.length || 0}</div>
                                <div className='title_total'>Số dịch vụ</div>
                            </div>
                            <div>
                                <FolderOpenTwoTone style={{ fontSize: 48 }} />
                            </div>
                        </div>
                    </Card>
                </Col>
                <Col span={6}>
                    <Card className="card_total" bordered={false}>
                        <div className='card_number'>
                            <div>
                                <div className='number_total'>{tournament?.length || 0}</div>
                                <div className='title_total'>Tổng số giải đấu</div>
                            </div>
                            <div>
                                <HddTwoTone style={{ fontSize: 48 }} />
                            </div>
                        </div>
                    </Card>
                </Col>
                <Col span={6}>
                    <Card className="card_total" bordered={false}>
                        <div className='card_number'>
                            <div>
                                <div className='number_total'>{courts?.length || 0}</div>
                                <div className='title_total'>Số giải đấu</div>
                            </div>
                            <div>
                                <ShopTwoTone style={{ fontSize: 48 }} />
                            </div>
                        </div>
                    </Card>
                </Col>
            </Row>
        </>
    );

    return (
        <div>
            <Spin spinning={loading}>
                <div className='container'>
                    <Breadcrumb style={{ marginTop: 20 }}>
                        <Breadcrumb.Item href="">
                            <HomeOutlined />
                        </Breadcrumb.Item>
                        <Breadcrumb.Item href="">
                            <DashboardOutlined />
                            <span>DashBoard</span>
                        </Breadcrumb.Item>
                    </Breadcrumb>

                    {userData?.role === "isAdmin" ? renderAdminCards() : <div>Seller-specific cards here</div>}

                    <div className="container mx-auto p-8">
                        <h1 className="text-3xl font-bold mb-6 text-center text-gray-800">Báo Cáo Đặt Sân</h1>
                        <div className="flex justify-center mb-8">
                            <input
                                type="date"
                                value={startDate}
                                onChange={(e) => setStartDate(e.target.value)}
                                className="mr-2 p-3 border rounded-md shadow-sm focus:ring focus:ring-blue-200 focus:border-blue-400"
                            />
                            <input
                                type="date"
                                value={endDate}
                                onChange={(e) => setEndDate(e.target.value)}
                                className="mr-2 p-3 border rounded-md shadow-sm focus:ring focus:ring-blue-200 focus:border-blue-400"
                            />
                        </div>
                        {!loading && (
                            <div className="overflow-x-auto">
                                <table className="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
                                    <thead className="bg-gray-800 text-white">
                                        <tr>
                                            <th className="py-3 px-6 text-left">Tên Sân</th>
                                            <th className="py-3 px-6 text-left">Số Lượt Đặt</th>
                                            <th className="py-3 px-6 text-left">Tổng Doanh Thu</th>
                                        </tr>
                                    </thead>
                                    <tbody className="text-gray-700">
                                        {bookingData?.map((item, index) => (
                                            <tr key={index} className="border-b hover:bg-gray-100">
                                                <td className="py-3 px-6">{item.court_name}</td>
                                                <td className="py-3 px-6">{item.booking_count}</td>
                                                <td className="py-3 px-6">{new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.total_revenue)}</td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                        )}
                    </div>
                </div>
            </Spin>
        </div>
    );
};

export default DashBoard;
