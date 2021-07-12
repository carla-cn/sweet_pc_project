<template>
  <div class="events">
    <my-header select="3"></my-header>
    <p style="margin-top: 2px;" class="title">我们一直用心将 SWEET 打造成您眼中的精致礼物首选之一。我们尊崇蛋糕黄金比例配方，烘焙浓情备至的甜蜜礼物，<br>爱与欢乐、爱与分享，由我们为您与家人温馨送上。</p>
    <div class="content">
      <div class="events-list center">
        <ul>
          <li v-for="i in 5" :key="i">
            <div class="picture"><a href="#"><img src="../../public/pictures/cheese/cake1_1.jpg" alt=""></a></div>
            <div class="text">
              <div class="top">
                <h3 class="event-title"><a href="#">请收下Sweet给您的消暑福利</a></h3>
                <div class="time">2017-07-17</div>
              </div>
              <div class="bottom">
                <p>夏日消暑福利来袭 太阳炙烤，天气炎热 sweet带给您一份盛夏时光， 让您品尝到舌尖的美味， 这一刻，爱上夏天。</p>
                <div><a href="#">详细内容</a></div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

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
.events {
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
  .content {
    background-color: $backgroundColor;
    .events-list {
      background-color: $boxColor;
      ul {
        li {
          @include clearfix;
          height: 160px;
          padding: 20px 20px;
          .picture {
            float: left;
            width: 194px;
            height: 100%;
            padding: 3px;
            border: 1px solid #CBBBAE;
            box-sizing: border-box;
            a {
              transition: 0.5s;
              img {
                width: 186px;
                height: 152px;
              }
              &:hover {
                opacity: 0.8;
              }
            }
          }
          .text {
            float: right;
            width: 840px;
            font-size: 16px;
            .top {
              @include clearfix;
              padding-bottom: 10px;
              font-size: 16px;
              color: $textColor3;
              border-bottom: 1px solid #ccc;
              .event-title {
                float: left;
                font-weight: 400;
                width: 300px;
                a {
                  color: $textColor3;
                  &:hover {
                    opacity: 0.8;
                  }
                }
              }
              .time {
                float: right;
              }
            }
            .bottom {
              padding-top: 10px;
              p {
                padding: 10px 0;
                color: $textColor1;
              }
              div {
                padding: 10px 20px;
                text-align: right;
                a {
                  padding: 5px;
                  background-color: $textbackgroundColor;
                  color: $textColor2;
                  font-size: 14px;
                  border-radius: 4px;
                  transition: 0.5s;
                  &:hover {
                    opacity: 0.8;
                  }
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