const express = require('express');
const app = express();
app.listen(7070);
/* 引入token模块 */
const jwt = require('./jwt.js');
/* 引入路由器模块 */
const userRouter = require('./router/user.js');
const productRouter = require('./router/product.js');
const bodyParser = require('body-parser');

/* 使用中间件处理流数据 */
app.use(bodyParser.urlencoded({ extended: false }))

/* 使用中间件，拦截url对其做token验证 */
app.use((req, res, next) => {
    let urlFilter = (req.url != '/users/login' && req.url != '/users/register') && (req.url.startsWith("/users") || req.url.startsWith("/orders"));
    if (urlFilter) {
        let token = req.headers.token;
        let result = jwt.verifyToken(token);
        // 如果考验通过就next，否则就返回登陆信息不正确
        if (result === undefined) {
            res.send({ status: 403, msg: "未提供证书" })
        } else if (result.name == 'TokenExpiredError') {
            res.send({ status: 403, msg: '登录超时，请重新登录' });
        } else if (result.name == "JsonWebTokenError") {
            res.send({ status: 403, msg: '证书出错' })
        } else {
            req.user = result;
            next();
        }
    } else {
        next();
    }
});

/* 挂载用户模块的路由器 */
app.use('/users', userRouter);
app.use('/products', productRouter);

/* 错误处理中间件 */
app.use((err, req, res, next) => {
    console.log(err);
    res.send({ code: 500, msg: '服务器端错误' });
})