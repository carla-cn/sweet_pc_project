<template>
  <div class="header">
    <div class="top">
      <div class="center">
        <div class="common-function">
          <span class="icon-car">
            <router-link to="/shoppingcar">
              <i class="iconfont">&#xe859;</i> 购物车
            </router-link>
          </span>
          <!-- 未登录时显示  登录  注册 -->
          <div class="login">
            <span>
              <a href="#">LOGIN IN登录</a>
            </span>
            <span>
              <a href="#">SIGN UP注册</a>
            </span>
          </div>
          <!-- 登录成功后分别显示  手机号  登录成功 -->
        </div>
      </div>
    </div>
    <div class="navbar">
      <div class="center">
        <ul>
          <li :class="selectId==1?'active': ''" @click="isSelected(1)"><router-link to="/">Home Page<br />首页</router-link></li>                                  
          <li :class="selectId==2?'active': ''" @click="isSelected(2)"><router-link to="/products">All Products<br />全部产品</router-link></li>    
          <li><a href="#"><img src="../assets/logo.png" alt /></a></li>                      
          <li :class="selectId==3?'active': ''" @click="isSelected(3)"><router-link to="/events">Latest Events<br />最新活动</router-link></li>                                  
          <li :class="selectId==4?'active': ''" @click="isSelected(4)"><router-link to="/brand">Brand Story<br />品牌理念</router-link></li>    
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ['select'],
  data() {
    return {
      selectId: this.select
    }
  },
  methods: {
    /* 1. 控制页头的样式：当被选中时，应用active的样式*/
    isSelected(id) {
      this.selectId = id;
    }
  }
}
</script>
<style lang="scss">
@import '../../public/scss/color.scss';
$BackgroundColor: $White;
$TextColor: $SaddleBrown;
$IconColor: $SandyBrown;
.header {
  color: $TextColor;
  box-shadow: #ccc 0px 1px 3px;
  height: 96px;
  a {
    color: $TextColor;
  }
  .top {
    height: 28px;
    line-height: 28px;
    border-bottom: 1px solid #e9e9e9;
    .common-function {
      float: right;
      width: 300px;
      font-size: 14px;
      & a:hover {
        text-decoration: underline;
      }
      .icon-car {
        float: left;
      }
      .login {
        float: right;
        span {
          margin-left: 16px;
        }
      }
    }
  }
  .navbar {
    height: 96 - 28px;
    text-align: center;
    font-size: 16px;
    ul {
        li {
          float: left;
          height: 48px;
          margin-right: 111px;
          padding: 20px 20px 0 20px;
          a {
            display: block;
            height: 48px;
          }
          &:nth-child(3) {
            position: relative;
            top: -40px;
          }
          & a:hover {
            color: $IconColor;
          }
        }
        .active a:hover {
          color: $TextColor;
        }
        li:last-child {
          margin-right: 0;
        }
        .active {
          border-bottom: 2px solid $TextColor;
        }
    }
  }
}
</style>