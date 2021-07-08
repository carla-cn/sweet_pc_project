<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style lang="scss">
@import '../public/scss/common.scss';
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
}

.center {
  width: 1170px;
  margin: 0 auto;
  // background-color: pink;
  -moz-user-select:none;
   -webkit-user-select:none;
   user-select:none;
}
</style>
