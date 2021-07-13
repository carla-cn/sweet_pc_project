<template>
  <div class="login">
    <my-header :select="0"></my-header>
    <div class="content">
      <div class="login-info center">
        <h3 class="title">用户登录</h3>
        <div class="phone">
          <input type="text" v-model="phoneNum" placeholder="请输入手机号">
        </div>
        <div class="pwd">
          <input type="password" v-model="password" placeholder="密码">
        </div>
        <div class="login-btn"><input type="button" value="点击登录" @click="login"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      phoneNum: '',
      password: ''
    }
  },
  methods: {
    login() {
      this.axios.post('/users/login', {phone: this.phoneNum, upwd: this.password}).then(result => {
        this.password = '';
        if (res.data.code == 201) {
          alert('res.data.msg');
        } else {
          alert('登录成功，点击进入首页');
          this.$router.push('./Home.vue');
        }      
      })
    }
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
.login {
  .content {
    margin-top: 2px;
    height: 620px;
    background-color: $backgroundColor;
    padding-top: 100px;
    box-sizing: border-box;
    .login-info {
      height: 500px;
      background-color: $boxColor;
      padding: 120px 100px;
      .title {
        font-weight: 400;
        font-size: 24px;
        color: $textColor3;
        text-align: center;
      }
      input {
        width: 300px;
        height: 50px;
        background: $backgroundColor url('../assets/register/icon_tel.png') no-repeat 20px 10px;
        padding-left: 60px;
        border: 0;
        margin-top: 30px;
        font-size: 16px;
        color: $textColor3;
        outline: none;
        box-sizing: border-box;
      }
      .phone {
        text-align: center;
      }
      .pwd {
        text-align: center;
        input {
          background-image: url('../assets/register/icon_pw.png');
        }
      }
      .login-btn {
        text-align: center;
        input {
          background: $textbackgroundColor;
          padding: 0;
          font-size: 18px;
          color: $textColor2;
          cursor: pointer;
          &:hover {
            opacity: 0.9;
          }
        }
      }
    }
  }
}
</style>