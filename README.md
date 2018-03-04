

README
===========================
A Test package for build root test

****

|Author|Albert.Liao|
|---|---
|E-mail|alb423@gmail.com

****

## create a new package in buildroot 
* git clone https://github.com/alb423/buildroot_test
* wget https://buildroot.org/downloads/buildroot-2017.11.tar.gz
* tar xvf buildroot-2017.11.tar.gz
* cd buildroot-2017.11\package\
* vi Config.in, \
    add below configuration, so that you can enable/disable mytest package by menuconfig\
    source "package/mytest/Config.in"
* mkdir mytest
* cd mytest
* cp ~/buildroot_test/mytest.mk .
* cp ~/buildroot_test/Config.in .


## create source code and assign correct path
* cd ~
* mkdir -p code/mytest/
* cd code/mytest
* cp ~/buildroot_test/Makefile .
* cp ~/buildroot_test/mytest.c .
* vi buildroot-2017.11\package\ , change below setting to correct path
   MYTEST_OVERRIDE_SRCDIR = /home/user_name/code/mytest/

## rebuild package
* cp ~/buildroot-2017.11
* make mytest
* make

## Reference:
* https://buildroot.org/downloads/manual/manual.html
* http://albert-oma.blogspot.com/2018/03/embedded-buildroot-qemuarm.html