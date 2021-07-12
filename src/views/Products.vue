<template>
  <div class="products-category">
    <my-header select="2"></my-header>
    <p style="margin-top: 2px;" class="title">对完美细节的固执，悉心关注顾客的感受。SWEET的每一款蛋糕中都凝结了蛋糕师的用心与专注，<br>专注每一个细节，用心来打造产品，追求精致时尚的健康理念。</p>
    <!-- 产品分类 -->
    <div class="products">
      <div class="category center">
        <!-- 分类标题 -->
        <ul class="nav">
          <li @click="navSelected(0)" :class="{active: 0 == selectedId}">不限</li>
          <li v-for="i in 6" :key="i" @click="navSelected(i)" :class="{active: i == selectedId}">乳酪蛋糕</li>
        </ul>
        <!-- 分类下的产品 -->
        <ul class="content">
          <li class="content-item" v-for="i in 8" :key="i">
            <my-card :sweetness="3"></my-card>
          </li>
        </ul>
        <el-pagination background layout="prev, pager, next" :total="12" :page-size="4"></el-pagination>
      </div>
    </div>
    <!-- 猜您喜欢 -->
    <div class="conjecture">
      <h3 class="center title">HOT SWEET CAKE 您可能会喜欢</h3>
      <ul class="products center">
        <li v-for="i in 4" :key="i">
          <my-card :sweetness="3"></my-card>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedId: 0
    }
  },
  methods: {
    navSelected(i) {
      this.selectedId = i;
    }
  }
}
</script>

<style lang="scss">
@import '/public/scss/color.scss';
$textColor1: $Silver;
$textColor2: $White;
$textColor3: $SaddleBrown;
$textbackgroundColor: $SaddleBrown;
$backgroundColor: $Beige;
$boxColor: $White;
@mixin clearfix {
  &::after {
    content: "\200B";
    display: block;
    height: 0;
    clear: both;
  }
  *zoom: 1;
}
.products-category {
  .title {
    margin: 0 auto;
    padding-top: 100px;
    padding-bottom: 50px;
    background-color: $backgroundColor;
    font-size: 14px;
    line-height: 1.5;
    color: $textColor1;
    text-align: center;
  }
  .products {
    background-color: $backgroundColor;
    padding-bottom: 10px;
    .category {
      background-color: $boxColor;
      padding: 10px 50px;
      height: 740px;
      .nav {
        @include clearfix;
        padding-left: 10px;
        padding-bottom: 20px;
        border-bottom: 20px solid $backgroundColor;
        li {
          float: left;
          margin-right: 40px;
          padding: 10px;
          font-size: 16px;
          color: $textColor3;
          border-radius: 5px;
          cursor: pointer;
          transition: 0.5s;
          box-shadow: 2px 2px 2px #ccc;
          &:hover {
            color: $textColor2;
            background-color: $textbackgroundColor;
          }
        }
        .active {
          color: $textColor2;
          background-color: $textbackgroundColor;
        }
      }
      .content {
        @include clearfix;
        font-size: 14px;
        .content-item {
          float: left;
          width: 25%;
          margin: 20px 0;
          .card {
            img {
              height: 200px;
            }
            .price {
              display: none;
            }
          }
        }
      }
      .el-pagination {
        text-align: right; 
        .el-pager {
          li {
            color: $textColor3;
            &:not(.disabled).active {
              color: $textColor2;
              background-color: $textbackgroundColor;
            }
          }
        }
      }
    }
  }
}
.conjecture {
    background-color: $backgroundColor;
    .title {
      background-color: $boxColor;
      padding: 40px 0;
      color: $textColor3;
      font-size: 22px;
      font-weight: 400;
      text-align: center;
      text-shadow:1px 1px white, -1px -1px $textColor3; // 内凹文字阴影
    }
    .products {
      background-color: $boxColor;
      @include clearfix;
      li {
        float: left;
        font-size: 16px;
        width: 24%;
        padding-left: 10px;
        border-right: 1px solid $textColor3;
        &:last-child {
          border: none;
        }
        .card {
          img {
            height: 200px;
          }
        }
      }
    }
  }
</style>