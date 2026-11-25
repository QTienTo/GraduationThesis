const nodemailer = require("nodemailer");

// Tạo transporter gửi mail. Cấu hình đọc từ biến môi trường.
// Secret SMTP cũ đã lộ trên repo public — phải xoay và đặt lại trong .env, không hard-code.
function createTransporter() {
  return nodemailer.createTransport({
    host: process.env.SMTP_HOST || "smtp-relay.brevo.com",
    port: process.env.SMTP_PORT ? Number(process.env.SMTP_PORT) : 587,
    auth: {
      user: process.env.SMTP_USER,
      pass: process.env.SMTP_PASS,
    },
  });
}

module.exports = { createTransporter };
