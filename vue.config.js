module.exports = {
    devServer: {
        proxy: {
            '/api': {
                target: `http://127.0.0.1:8080`,
                changeOrigin: true,
                pathRewrite: {
                    "^/api": ""
                        //因为真实的服务器端的地址中不包含/api ，所以应该将程序中的、api删除（替换空字符串），再和target中的基础路径拼接起来作为发送到服务器端的最终请求地址
                }
            }
        }
    }
}