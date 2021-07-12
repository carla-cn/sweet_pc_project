<template>
  <span class="cake-sweetness"><i v-for="(item, i) in sweetnessArr" :key="i" v-cloak class="iconfont" :class="{unselected: !item}">{{item ? '&#xe600;' : '&#xe778;'}}</i></span>
</template>

<script>
export default {
  props: ['sweetness'],
  data() {
    return {
      sweetnessArr: [0, 0, 0, 0, 0],
      sweet: this.sweetness
    }
  },
  created() {
    for (let i = 0; i < this.sweet; i++) {
      this.sweetnessArr[i] = 1;
    }
  }
}
</script>

<style lang="scss">
  @import '/public/scss/color.scss';
  $IconColor: $Peru;
  .cake-sweetness {
    [cloak] {
      display: none;
    }
    i {
      margin: 0 4px;
      color: $IconColor;
    }
    .unselected {
      padding-bottom: 1px;
      font-size: 19px;
    }
  }
</style>