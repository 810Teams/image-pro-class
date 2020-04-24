%
% script_03.m
% Laplacian of Gaussian (LoG) Detector / Zero-Crossing Detector
%

clear all;
close all;

H = fspecial('log', 40, 5);
mesh(H);
