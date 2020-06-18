clear all
close all
format long
%Homework 4 Question 2(d)
f = @(x) x^4;
a = 0.5;
b = 1.0;
n = 4;

integral = CompositeSimpsons(f,a,b,n)