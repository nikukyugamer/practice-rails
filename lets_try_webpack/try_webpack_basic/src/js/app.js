import $ from 'jquery';
import add from './modules/add';
import tax from './modules/tax';

const item1Price  = 400;
const item2Price  = 600;
const totalPrice  = add(item1Price, item2Price);
const salesTax    = 1.08;
const priceIncludeTax = tax(totalPrice, salesTax);

$('body').text(priceIncludeTax);

// export と import の様々な書き方

// export
// export const add = (n1, n2) => n1 + n2
// export const sub = (n1, n2) => n1 - n2

// import
// {} を用いることで、そこに指定されている引数のメソッドだけを import できる
// import { add } from './math.js';
// import { add, sub as SUB } from './math.js';
// import * as math from './math.js';
