const express = require('express');
const r = express.Router();
const pool = require('../pool.js');
const jwt = require('../jwt.js');

/* 1. 注册 */
r.post('/register', (req, res, next) => {
    let obj = req.body;
    if (req.body.upwd) {
        pool.query('insert into user set ?', [obj], (err, result) => {
            if (err) {
                next(err);
                return;
            }
            res.send({ code: 200, msg: 'OK' });
        })
    } else {
        pool.query('select * from user where phone = ?', [req.body.phone], (err, result) => {
            if (err) {
                next(err);
                return;
            }
            if (result.length) {
                res.send({ code: 201, msg: 'Has been registered' })
            } else {
                res.send({ code: 200, msg: 'OK' });
            }
        })
    }
})

/* 2. 登录 */
r.post('/login', (req, res, next) => {
    let { phone, upwd } = req.body;
    if (!/^1[3456789]\d{9}$/.test(phone)) { res.send({ code: 202, msg: 'phone error' }); return; };
    if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(upwd)) { res.send({ code: 203, msg: 'password error' }); return; };
    let sql = 'select uid,phone from user where phone=? and upwd=?';
    pool.query(sql, [phone, upwd], (err, result) => {
        if (err) {
            next(err);
            return;
        }
        if (result.length) {
            res.send({ code: 200, msg: 'OK', token: jwt.generateToken(result[0]) });
        } else {
            res.send({ code: 201, msg: 'Username or password error' });
        }
    })
})

module.exports = r;