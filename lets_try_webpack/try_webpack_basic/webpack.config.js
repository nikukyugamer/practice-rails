// output.path に指定するパスが OS によって異なることを防ぐために path モジュールを読み込む
const path = require('path');

module.exports = {
  mode: 'development',
  entry: './src/js/app.js',
  output: {
    filename: 'bundle.js',
    // 絶対パスを指定しないとエラーが出るので注意する
    path: path.resolve(__dirname, 'public/js')
  }
};
