import { HomeOutlined, BarChartOutlined } from "@ant-design/icons";
import { PageHeader } from "@ant-design/pro-layout";
import { BackTop, Breadcrumb, Col, Form, Row, Space, Spin } from "antd";
import React, { useEffect, useState } from "react";
import axiosClient from "../../apis/axiosClient";
import bookingApi from "../../apis/bookingApi";
import Chart from "react-apexcharts";
import * as XLSX from "xlsx";

import "./statistical.css";

const Statistical = () => {
  const [order, setOrder] = useState([]);
  const [loading, setLoading] = useState(true);
  const [form2] = Form.useForm();
  const [id, setId] = useState();
  const [userOptions, setUserOptions] = useState({
    labels: ["Nguời dùng hoạt động", "Người dùng không hoạt động"],
    dataLabels: {
      enabled: true,
    },
  });
  const [userSeries, setUserSeries] = useState([]);
  const [userTotal, setUserTotal] = useState(0);

  const [bookingOptions, setBookingOptions] = useState({
    labels: [
      "Đã huỷ",
      "Đang xem xét",
      "Đã xác nhận - Đã thanh toán",
      "Đợi xác nhận",
    ],
    dataLabels: {
      enabled: true,
    },
  });
  const [bookingSeries, setBookingSeries] = useState([]);
  const [bookingTotal, setBookingTotal] = useState(0);
  const [totalPrice, setTotalPrice] = useState(0);

  const [priceOptions, setPriceOptions] = useState({
    labels: ["Tổng doanh thu", "Tổng tiền huỷ sân"],
    dataLabels: {
      enabled: true,
    },
  });
  const [priceSeries, setPriceSeries] = useState([]);

  useEffect(() => {
    getAllData();
  }, []);

  const getAllData = async () => {
    setLoading(true);
    try {
      await axiosClient.post("/user/get-all-client").then((response) => {
        const users = response.data;
        const usersActive = users.filter((u) => u.status === "actived").length;
        const usersNotActive = users.length - usersActive;
        setUserSeries([usersActive, usersNotActive]);
        setUserTotal(users.length);
      });
      const local = localStorage.getItem("user");
      const user = JSON.parse(local);
      await bookingApi.getBookingByCourtsUser(user.id).then((res) => {
        const rejected = res.filter(
          (item) => item.status === "rejected"
        ).length;
        const approved = res.filter(
          (item) => item.status === "approved"
        ).length;
        const final = res.filter((item) => item.status === "final").length;
        const confirm = res.length - rejected - approved - final;
        setBookingSeries([rejected, approved, final, confirm]);
        setBookingTotal(res.length);
        let totalPrice = 0;
        res
          .filter((item) => item.status === "final")
          .map((item) => {
            totalPrice += Number(item.total_amount);
          });
        let totalPriceCancel = 0;
        res
          .filter((item) => item.status === "rejected")
          .map((item) => {
            totalPriceCancel += Number(item.total_amount);
          });
        setTotalPrice(totalPrice);
        setPriceSeries([totalPrice, totalPriceCancel]);
      });
    } catch (error) {
      throw error;
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <Spin spinning={loading}>
        <div className="container">
          <div style={{ marginTop: 20 }}>
            <Breadcrumb>
              <Breadcrumb.Item href="">
                <HomeOutlined />
              </Breadcrumb.Item>
              <Breadcrumb.Item href="">
                <BarChartOutlined />
                <span>Thống kê</span>
              </Breadcrumb.Item>
            </Breadcrumb>
          </div>

          <div style={{ marginTop: 20 }}>
            <div id="my__event_container__list">
              <PageHeader subTitle="" style={{ fontSize: 14 }}>
                <Row>
                  <Col span="18"></Col>
                  <Col span="6">
                    <Row justify="end">
                      <Space></Space>
                    </Row>
                  </Col>
                </Row>
              </PageHeader>
            </div>
          </div>

          <div style={{ marginTop: 30, marginLeft: 50 }}>
            <div>
              <h4 className="text-xl font-bold">1. Thống kê người dùng</h4>
              <h4 className="text-md font-bold">
                Tổng số người dùng : {userTotal}
              </h4>
              <div id="chart">
                <Chart
                  options={userOptions}
                  series={userSeries}
                  type="donut"
                  width={600}
                />
              </div>
              <h4 className="text-xl font-bold">2. Thống kê lịch đặt sân</h4>
              <h4 className="text-md font-bold">
                {" "}
                Tổng số lịch đặt sân : {bookingTotal}
              </h4>
              <div id="chart_bar">
                <Chart
                  options={bookingOptions}
                  series={bookingSeries}
                  type="donut"
                  width={600}
                />
              </div>
              <h4 className="text-xl font-bold">3.Thống kê doanh thu</h4>
              <h4 className="text-md font-bold">
                {" "}
                Tổng doanh thu :
                {Number(totalPrice)?.toLocaleString("vi", {
                  style: "currency",
                  currency: "VND",
                })}
              </h4>
              <div id="chart_bar">
                <Chart
                  options={priceOptions}
                  series={priceSeries}
                  type="donut"
                  width={600}
                />
              </div>
            </div>
          </div>
        </div>

        <BackTop style={{ textAlign: "right" }} />
      </Spin>
    </div>
  );
};

export default Statistical;
