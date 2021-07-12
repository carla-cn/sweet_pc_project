<template>
  <div class="brand">
    <my-header select="4"></my-header>
      <p style="margin-top: 2px;" class="title">我们一直用心将 SWEET 打造成您眼中的精致礼物首选之一。我们尊崇蛋糕黄金比例配方，烘焙浓情备至的甜蜜礼物，<br>爱与欢乐、爱与分享，由我们为您与家人温馨送上。</p>
    <div class="story">
      <div class="content center">
        <img src="../assets/brand/ppgs_03.jpg" alt="">
        <img src="../assets/brand/ppgs_04.jpg" alt="">
        <img src="../assets/brand/ppgs_05.jpg" alt="">
      </div>
    </div>
  </div>
</template>

<style lang="scss">
@import '/public/scss/color.scss';
$textColor1: $Silver;
$backgroundColor: $Beige;
$boxColor: $White;
.brand {
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
  .story {
    background-color: $backgroundColor;
    .content {
      padding-top: 20px;
      padding-bottom: 20px;
      background-color: $boxColor;
      text-align: center;
    }
  }
}
</style>