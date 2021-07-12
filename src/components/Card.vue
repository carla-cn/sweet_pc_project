<template>
  <div class="card">
    <a href="#" class="pro-img"><img src="../../public/pictures/cheese/cake1_1.jpg" alt=""></a>
    <h3 class="cake-name" v-if="sweetness"><a href="#">诞辰</a></h3>
    <p class="sweetness" v-if="sweetness">甜度指数：<cake-sweetness :sweetness="sweetness"></cake-sweetness></p>
    <div class="price"><i>188</i> RMB</div>
  </div>
</template>

<script>
export default {
  props: ['sweetness']
}
</script>

<style lang="scss">
@import '../../public/scss/color.scss';
$textColor1: $Silver;
$textColor2: $Peru;
$textColor3: $SandyBrown;
$textColor4: $SaddleBrown;
.card {
  width: 100%;
  text-align: center;
  .pro-img {
    img {
      transition: 0.5s;
    }
    &:hover img {
      transform: scale(1.1, 1.1);
    }
  }
  .cake-name {
    position: relative;
    z-index: 1;
    font-weight: 400;
    a {
      color: $textColor2;
      &:hover {
        color: $textColor3;
      }
    }
  }
  .sweetness {
    margin: 16px 0;
    color: $textColor1;
  }
  .price {
    position: relative;
    color: $textColor2;
    z-index: 1;
    i {
      font-size: 40px;
      color: $textColor4;
    }
  }
}
</style>