<template>
  <div id="app">
    <h1>{{ msg }}</h1>
    <el-input
  type="textarea"
  :autosize="{ minRows: 10, maxRows: 15}"
  placeholder="解题代码"
  v-model="textarea1">
</el-input>
<div style="margin: 20px 0;"></div>
<el-button type="success" v-on:click="greet">提交解题答案</el-button>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      msg: 'Leetcode-admin',
      textarea1 : ''
    }
  },
  methods: {
    greet: function (event) {
      if (event) {
         alert(this.textarea1)
      }
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
