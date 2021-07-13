<template>
  <div class="register">
    <my-header :select="0"></my-header>
    <div class="content">
      <div class="register-info center">
        <h3>免费注册</h3>
        <div class="phone">
          <input type="text" v-model="phoneNum" placeholder="请输入手机号">
          <span class="info" v-html="phoneInfo"></span>
        </div>
        <div class="pwd">
          <input type="password" v-model="password" placeholder="密码">
          <span class="info" v-html="pwdInfo"></span>
        </div>
        <div class="rePwd">
          <input type="password" v-model="rePassword" placeholder="密码确认">
          <span class="info" v-html="repwdInfo"></span>
        </div>
        <div class="verification">
          <input type="text" placeholder="验证码" v-model="codes">
          <canvas width="100" height="50" @click="draw(verificationCode)" ref="canvas"></canvas>
        </div>
        <button @click="register">点击注册</button>
        <div class="login center">
          <img src="../assets/register/zhuce_07.jpg" alt="">
          <span>我已经注册为会员,<br>现在就 <a href="#">登录</a></span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      phoneNum: '',
      phoneInfo: '',
      password: '',
      pwdInfo: '', 
      rePassword: '',
      repwdInfo: '',
      verificationCode: [],
      codes: ''
    }
  },
  methods: {
    /* canvas绘制验证码 */
    draw(numShow) {
      // numShow = []; // 该做法错误，会导致形参指向另一个地址，导致不能更改原地址中的值
      /* 每次调用此方法前都重新清空为空数组，注意：不能使用length，因为每次减少一个该数字会变，最终的结果是想删除固定的4个字符 */
      for (let i = 0; i < 4; i++) {
        numShow.pop();
      }
      let cvs = this.$refs.canvas;
      let canvas_width = cvs.width;
      let canvas_height = cvs.height;
      let ctx = cvs.getContext('2d'); // //获取到canvas画图的环境
      ctx.clearRect(0,0,100,50); // 每次绘画前都必须清空画布中的内容
      let strCode = 'a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0,0';
      let arrCode = strCode.split(',');
      let arrLength = arrCode.length; // 获取可用字符的个数
      /* 一、绘制四个倾斜的、有颜色的随机字符 */
      for (var i = 0; i < 4; i++) {
        let j = Math.floor(Math.random() * (arrLength - 1)); // 产生随机的字符的下标
        let deg = Math.random() * Math.PI / 6; // 产生30°以内的弧度值
        let txt = arrCode[j].toLowerCase();
        let x = 10 + i * 20; //文字在canvas上的x坐标
        let y = 20 + Math.random() * 8; //文字在canvas上的y坐标
        /* 1. 将随机得到的字符，旋转一定的角度，生成某个颜色然后再在canvas中绘制出来 */
        ctx.font = "bold 23px 微软雅黑";
        ctx.translate(x, y); // 坐标原点换为(x,y)
        ctx.rotate(deg); // 字符旋转30°以内的角度
        ctx.fillStyle = this.randomColor(); // 随机生成文本填充颜色
        // console.log(txt);
        ctx.fillText(arrCode[j], 0, 0);
        /* 2. 恢复原点的位置 */
        ctx.rotate(-deg);
        ctx.translate(-x, -y);
        /* 3. 将该字符放入numShow中 */
        numShow.push(txt);
      }
      /* 二、验证码上显示线条 */
      for (var i = 0; i < 5; i++) {
        ctx.strokeStyle = this.randomColor();
        ctx.beginPath();
        ctx.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
        ctx.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
        ctx.stroke();
      }
      /* 三、验证码上显示小点 */
      for (var i = 0; i <= 30; i++) { //验证码上显示小点
        ctx.strokeStyle = this.randomColor();
        ctx.beginPath();
        var x = Math.random() * canvas_width;
        var y = Math.random() * canvas_height;
        ctx.moveTo(x, y);
        ctx.lineTo(x + 1, y + 1);
        ctx.stroke();
      }
    },
    /* 生成验证码中的随机颜色 */
    randomColor() {
      let r = Math.floor(Math.random() * 256);
      let g = Math.floor(Math.random() * 256);
      let b = Math.floor(Math.random() * 256);
      return "rgb(" + r + "," + g + "," + b + ")";
    },
    /* 验证手机号 */
    verifyPhone() {
      let result = /^1[3456789]\d{9}$/.test(this.phoneNum);
      if (result) {
        this.phoneInfo = `<i class="iconfont" style="color: green;">&#xe61a;</i>`;
      } else {
        this.phoneInfo = `<i class="iconfont" style="color: red;">&#xe695;</i> 手机号格式不正确`;
      }
      return result;
    },
    /* 验证密码：必须为8-16位同时且含有数字和字母 */
    verifyPwd() {
      let result = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(this.password);
      if (result) {
        this.pwdInfo = `<i class="iconfont" style="color: green;">&#xe61a;</i>`;
      } else {
        this.pwdInfo = `<i class="iconfont" style="color: red;">&#xe695;</i> 密码必须由8-16位的数字和字母组成`;
      }
      return result;
    },
    /* 再次确认密码 */
    reVerifyPwd() {
      let result = this.rePassword === this.password;
      if (result) {
        this.repwdInfo = `<i class="iconfont" style="color: green;">&#xe61a;</i>`;
      } else {
        this.repwdInfo = `<i class="iconfont" style="color: red;">&#xe695;</i> 两次输入的密码不一致`;
      }
      return result;
    },
    /* 注册验证 */
    register() {
      if (this.codes === this.verificationCode.join('')) {
        console.log('注册成功');
      } else {
        console.log('注册失败');
        this.codes = '';
        this.draw(this.verificationCode);
      }
    }
  },
  watch: {
    phoneNum() {
      this.verifyPhone();
    },
    password() {
      this.verifyPwd();
    },
    rePassword() {
      this.reVerifyPwd();
    }
  },
  mounted() {
    this.draw(this.verificationCode);
  }
}
</script>

<style lang="scss">
@import '/public/scss/color.scss';
$textColor2: $White;
$textColor3: $SaddleBrown;
$textbackgroundColor: $SaddleBrown;
$backgroundColor: $Beige;
$boxColor: $White;
.register {
  .content {
    margin-top: 2px;
    height: 620px;
    background-color: $backgroundColor;
    padding-top: 100px;
    box-sizing: border-box;
    .register-info {
      position: relative;
      height: 500px;
      background-color: $boxColor;
      padding: 60px 100px;
      h3 {
        padding-bottom: 10px;
        border-bottom: 1px solid #ccc;
        margin-bottom: 6px;
        font-weight: 400;
        font-size: 24px;
        color: $textColor3;
      }
      input {
        width: 300px;
        height: 50px;
        background: $backgroundColor url('../assets/register/icon_tel.png') no-repeat 20px 10px;
        padding-left: 60px;
        border: 0;
        margin: 10px 0;
        font-size: 16px;
        color: $textColor3;
        outline: none;
        box-sizing: border-box;
      }
      .info {
        margin-left: 20px;
        font-size: 16px;
        color: $textColor3;
        i {
          font-size: 20px;
          transform: translateY(20px);
        }
      }
      div {
        vertical-align: center;
      }
      .pwd {
        input {
          background-image: url('../assets/register/icon_pw.png');
        }
      }
      .rePwd {
        input {
          background-image: url('../assets/register/icon_pw2.png');
        }
      }
      .verification {
        input {
          background-image: url('../assets/register/icon_yzm.png');
        }
        canvas {
          width: 100px;
          height: 50px;
          transform: translate(40px, 20px);
          cursor: pointer;
        }
      }
      button {
        background-color: $textbackgroundColor;
        padding: 8px 14px;
        border: 0;
        margin-top: 10px;
        color: $textColor2;
        font-size: 16px;
        border-radius: 5px;
        outline: none;
        cursor: pointer;
        box-sizing: border-box;
        &:hover {
          opacity: 0.8;
        }
      }
      .login {
        position: absolute;
        top: 200px;
        right: 200px;
        width: 180px;
        span {
          position: absolute;
          top: 4px;
          right: 0;
          font-size: 16px;
          color: #666;
          a {
            color: $textColor3;
            font-weight: 700;
            &:hover {
              opacity: 0.8;
            }
          }
        }
      }
    }
  }
}
</style>