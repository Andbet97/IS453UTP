int : cantidad = 9550;

var 0..100 : m50;
var 0..100 : m100;
var 0..100 : m200;
var 0..100 : m500;
var 0..100 : b1;
var 0..100 : b2;
var 0..100 : b5;
var 0..100 : b10;
var 0..100 : b20;
var 0..100 : b50;
var 0..100 : b100;

constraint 50*m50+100*m100+200*m200+500*m500+
            1000*b1+2000*b2+5000*b5+10000*b10+20000*b20+50000*b50+100000*b100 =
            cantidad;

solve satisfy;
