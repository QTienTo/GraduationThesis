module.exports = Object.freeze({
    PORT: process.env.PORT ? Number(process.env.PORT) : 3100,
    // CẢNH BÁO: giá trị mặc định 'secretkey' chỉ dùng cho dev local.
    // Production BẮT BUỘC đặt JWT_ACCESS_KEY trong .env (key cũ đã lộ trên repo public).
    JWT_ACCESS_KEY: process.env.JWT_ACCESS_KEY || 'secretkey',
})
