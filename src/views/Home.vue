<template>
  <div class="home">
    <my-header select="1"></my-header>
    <div class="main" style="margin-top: 2px;">
      <!-- 动画广告 -->
      <div class="banner center">
        <div class="animation-obj1">
          <a href="#"><img src="../assets/index/banner_pic2.png" alt=""></a>
          <img class="shade" src="../assets/index/nn-03-bg.png" alt="">
        </div>
        <img src="../assets/index/banner_pic6.png" alt="" class="animation-obj2">
        <img src="../assets/index/banner_pic7.png" alt="" class="animation-obj3">
        <div class="animation-obj4">
          <a href="#"><img src="../assets/index/banner_pic3.png" alt=""></a>
          <img class="shade" src="../assets/index/nn-05-bg.png" alt="">
        </div>
        <img src="../assets/index/banner_pic5.png" alt="" class="animation-obj5">
        <img src="../assets/index/banner_pic4.png" alt="" class="animation-obj6">
        <div class="animation-obj7">
          <h2>蓝莓芝士 / Blueberry Cheese</h2>
          <p>清透诱人的蓝莓酱，混合醇厚奶油芝士，拥有慕斯般的柔和口感，淡淡的乳香中透出丝丝酸甜的果味，生命原来可以这样的安宁和美丽。</p>
          <p>Blueberry Cheese cake gives you a light brandy taste, the freshness of blueberry and softness of cheese.</p>
          <i class="iconfont">&#xe6c7;</i>
          <a class="mini" href="#">立即购买</a>
        </div>
        <div class="animation-obj8">
          <h2>玫瑰情人 / Rose Lover Cake</h2>
          <p>百利甜酒的加入与淡奶油产生的奇妙反应，就像爱情的突然发生……</p>
          <p>Mmmmm. The only thing you need in order to marry these two delights on the plate is a scoop of the finest French vanilla ice cream. Sheer decadence!</p>
          <i class="iconfont">&#xe85a;</i>
          <a class="mini" href="#">立即购买</a>
        </div>
        <img src="../assets/index/banner_logo.png" alt="" class="animation-obj9">
      </div>
      <!-- 热卖新品 -->
      <div class="hot-sale center">
        <h2>MENU<i>热卖新品</i></h2>
        <div class="products">
          <div class="cake">
            <el-carousel height="500px" indicator-position="none" arrow="hover">
              <el-carousel-item v-for="item in 3" :key="item">
                <my-card :sweetness="sweetness"></my-card>
              </el-carousel-item>
            </el-carousel>
          </div>
          <div class="flower">
            <div class="top">
              <h3>幸福时刻要有思味特</h3>
              <p>做一棵开花的树，站在四季的风里，带着微笑，带着满足，感谢每一米阳光，感谢每一滴雨露，只要心是简单的，世界就不会复杂，只要心是善良的，生活就会孕育生香。</p>
            </div>
            <div class="bottom">
              <div class="bottom-item" v-for="i in 3" :key="i">
                <my-card></my-card>
              </div>
            </div>
          </div>
        </div>
        <div class="move-show">
          <ul>
            <li v-for="i in 4" :key="i">
              <my-card></my-card>
              <h3 class="flower-name"><a href="#">Alive&Well 祝好花集/仲夏夜之梦/韩式混搭花篮</a></h3>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      sweetness: 3
    }
  }
}
</script>
<style lang="scss">
@import '../../public/scss/color.scss';
$backgroundColor: $Beige;
$backgroundIconColor: $Peru;
$backgroundIconActiveColor: $SandyBrown;
$boxColor: $White;
$textColor1: $Silver;
$textColor2: $SaddleBrown;
$textColor3: $Peru;
$textColor4: $SandyBrown;
@keyframes mymove { 
  from {opacity:0;}
  to {opacity:1;}
}
@mixin show($top, $left, $time) {
  position: absolute;
  top: $top;
  left: $left;
  opacity: 0;
  animation: mymove 0.5s linear $time forwards;
}
.home {
  .main {
    background-color: $backgroundColor;
    /* 动画部分 */
    .banner {
      position: relative;
      height: 800px;
      .animation-obj1 {
        @include show(114px, 786px, 0.25s);
        & a:first-child img:hover {
          opacity: .9;
        }
        .shade {
          position: relative;
          top: -96px;
          left: 2px;
          z-index: -1;
        }
      }
      .animation-obj2 {
        @include show(336px, 674px, 0.5s);
      }
      .animation-obj3 {
        @include show(220px, 1096px, 0.75s);
      }
      .animation-obj4 {
        @include show(384px, -10px, 1s);
        & a:first-child img:hover {
          opacity: .9;
        }
        .shade {
          position: relative;
          top: -226px;
          left: 2px;
          z-index: -1;
        }
      }
      .animation-obj5 {
        @include show(684px, 30px, 1.25s);
      }
      .animation-obj6 {
        @include show(550px, 500px, 1.5s);
      }
      .animation-obj7 {
        width: 400px;
        font-size: 16px;
        color: $textColor2;
        @include show(186px, 176px, 1.75s);
        h2 {
          margin-bottom: 5px;
          font-weight: 400;
          text-align: center;
        }
        p {
          padding: 5px 0;
        }
        & p:nth-child(3) {
          border-bottom: 1px solid $textColor1;
        }
        i {
          position: relative;
          top: -92px;
          left: 440px;
          font-size: 100px;
        }
        .mini {
          position: relative;
          top: -54px;
          left: 54px;
          width: 100px;
          height: 40px;
          padding: 6px;
          border: 1px solid $textColor1;
          background-color: $backgroundIconColor;
          color: $boxColor;
          font-size: 14px;
          border-radius: 4px;
          &:hover {
            background-color: $backgroundIconActiveColor;
          }
        }
      }
      .animation-obj8 {
        @extend .animation-obj7;
        @include show(500px, 690px, 2s);
        i {
          top: -92px;
          left: -150px;
        }
      }
      .animation-obj9 {
        @include show(54px, 24px, 0s);
        @keyframes move {
          from {opacity:0; top: 10px; left: 144px;}
          to {opacity:1; top: 54px; left: 24px;}
        }
        animation: move 0.1s ease-out 2.25s forwards;
      }
    }
    /* 热卖商品 */
    .hot-sale {
      margin-top: 40px;
      h2 {
        padding-bottom: 18px;
        font-weight: 400;
        font-size: 34px;
        color: $textColor1;
        text-align: center;
        border-bottom: 1px solid $textColor1;
        text-shadow:1px 1px white, -1px -1px #444; // 内凹文字阴影
        i {
          display: block;
          margin-top: 5px;
          font-size: 20px;
          font-style: normal;
        }
      }
      .products {
        height: 500px;
        margin-top: 40px;
        .cake {
          float: left;
          height: 100%;
          width: 400px;
          background-color: $boxColor;
          font-size: 16px;
          .card {
            margin-top: 40px;
            img {
              height: 300px;
            }
          }
        }
        .flower {
          float: right;
          height: 100%;
          width: 760px;
          .top {
            height: 24%;
            background-color: $boxColor;
            padding: 26px 30px;
            color: $textColor1;
            box-sizing: border-box;
            h3 {
              font-size: 18px;
              font-weight: 400;
              text-align: center;
              margin-bottom: 10px;
            }
            p {
              font-size: 14px;
              line-height: 1.4;
              text-indent: 2;
              text-indent: 2em;
            }
          }
          .bottom {
            height: 312px;
            margin-top: 10px;
            padding-top: 58px;
            background-color: $boxColor;
            font-size: 16px;
            .bottom-item {
              float: left;
              width: 33%;
              padding: 20px 0;
              &:nth-child(2) {
                border-left: 1px dotted $textColor3;
                border-right: 1px dotted $textColor3;
              }
              .card {
                img {
                  height: 180px;
                }
                .price {
                margin-top: 20px;
                }
              }
            }
          }
        }
      }
      .move-show {
        height: 280px;
        margin-top: 10px;
        padding: 24px 10px;
        background-color: $boxColor;
        overflow: hidden;
        box-sizing: border-box;
        ul {
          li {
            float: left;
            width: 226px;
            padding: 0 30px;
            text-align: center;
            .card {
              img {
                height: 180px;
              }
              .price {
                display: none;
              }
            }
            h3 {
              position: relative;
              z-index: 1;
              font-weight: 400;
              a {
                font-size: 16px;
                color: $textColor3;
                &:hover {
                  color: $textColor4;
                }
              }
            }
          }
        }
      }
    }
  }
}
</style>