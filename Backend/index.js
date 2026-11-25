require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
// Cấu hình CORS — origin đọc từ biến môi trường CORS_ORIGINS (chuỗi phân tách bằng dấu phẩy)
const corsOrigins = (process.env.CORS_ORIGINS || "http://localhost:3000,http://localhost:3005,http://localhost:3500")
  .split(",")
  .map((o) => o.trim())
  .filter(Boolean);
app.use(cors({
  origin: corsOrigins,
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true
}));

const _CONST = require("./app/config/constant");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static("public"));

require("./app/models/createTables");

// Kết nối MySQL dùng pool duy nhất ở ./app/config/db.js (không còn createConnection riêng ở đây)

const authRoute = require("./app/routers/auth");
const userRoute = require("./app/routers/user");
const paymentRoute = require("./app/routers/paypal");
const dashboardRouter = require("./app/routers/dashboardRouter");
const FieldTypeRouter = require("./app/routers/fieldTypeRouter");
const AreaRouter = require("./app/routers/areaRouter");
const CourtRouter = require("./app/routers/courtRouter");
const ProductTypeRouter = require("./app/routers/productTypeRouter");
const ProductRouter = require("./app/routers/productRouter");
const tournamentRouter = require("./app/routers/tournament");
const tournamentResultRouter = require("./app/routers/tournamentResult");
const bookingRouter = require("./app/routers/bookingRouter");
const orderRouter = require("./app/routers/orderRouter");
const statisticsRouter = require("./app/routers/statisticsRouter");
const residenceRulesRoutes = require("./app/routers/residenceRulesRoutes");
const notificationRoutes = require("./app/routers/notificationRoutes");
const newsRouter = require("./app/routers/newsRouter");
const employeeRouter = require("./app/routers/employee");

app.use("/api/auth", authRoute);
app.use("/api/user", userRoute);
app.use("/api/payment", paymentRoute);
app.use("/api/dashboard", dashboardRouter);
app.use("/api/field-types", FieldTypeRouter);
app.use("/api/areas", AreaRouter);
app.use("/api/courts", CourtRouter);
app.use("/api/product-types", ProductTypeRouter);
app.use("/api/products", ProductRouter);
app.use("/api/tournaments", tournamentRouter);
app.use("/api/tournament-results", tournamentResultRouter);
app.use("/api/booking", bookingRouter);
app.use("/api/orders", orderRouter);
app.use("/api/statistics", statisticsRouter);
app.use("/api/residence-rules", residenceRulesRoutes);
app.use("/api/notifications", notificationRoutes);
app.use("/api/news", newsRouter);
app.use("/api/employee", employeeRouter);

const PORT = process.env.PORT || _CONST.PORT;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
