var vm = new Vue({
  el: '#app',
  data: {
    message: {}
  },
  created: function() {
    self = this;

    axios
        // ローカルファイルを汎用的に読み込む方法
        // https://medium.com/@negarjf/how-to-access-a-static-json-file-in-vue-cli-3-8943dc343f95
        .get('http://localhost:3000/vuejs/ichiban_yasashii/test.json')
        // .get('./test.json')
        // .get('https://qiita.com/api/v2/items?page=1&per_page=5')
        .then(function(res) {
          console.log(res);
          self.message = res;
        })
        .catch(function(err) {
          console.log(err);
        });
  },
});
