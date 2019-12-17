const path = require('path');

module.exports = {
  mode: 'development',
  entry: './src/js/app.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'pubilc/js'),
    // ルートディレクトリが ./public であり、バンドルされたファイルが ./public/js に出力されるから（重要）
    publicPath: '/js/'
  },
  devServer: {
    open: true,
    port: 9000,
    contentBase: './public'
  }
};
