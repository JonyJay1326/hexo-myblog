---
title: 常见面试题 - JS
abbrlink: 16112
categories: [前端]
tags: [JavaScript]
---

一些常见面试题的整理
<!-- more -->

### 数组去除
#### ES6的set()
```javascript
var arr =[1,2,3,4,3,2,1];
var arrSet =new Set(arr);
var newArr = [...arrSet]; //[1,2,3,4]
```
#### 使用push
```javascript
var arr = [1,2,3,4,3,2,1];
var newArr =[];
for (var index = 0; index < arr.length; index++) {
    if(newArr.indexOf(arr[index])== -1){
        newArr.push(arr[index]);
    }
}
console.log(newArr)//[1,2,3,4]
```
#### 排序去除相邻重复元素
```javascript
var arr = [1, 2, 3, 4, 3, 2, 1];
var arr = arr.sort();
for (var i = 0; i < arr.length-1; i++) {
    if(arr[i] == arr[i+1]){
        arr.splice(i,1)
    }
}
console.log(arr)//[1,2,3,4]
```
