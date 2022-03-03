/*!
 * Start Bootstrap - One Page Wonder v6.0.4 (https://startbootstrap.com/theme/one-page-wonder)
 * Copyright 2013-2021 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-one-page-wonder/blob/master/LICENSE)
 */
// This file is intentionally blank
// Use this file to add JavaScript to your project
var slides = document.querySelector(".slides"),
  slide = document.querySelectorAll(".slides li"),
  currentIdx = 0,
  slideCount = slide.length,
  prevBtn = document.querySelector(".prev"),
  slideWidth = 300,
  slideMargin = 30,
  nextBtn = document.querySelector(".next");

slides.style.width =
  (slideWidth + slideMargin) * slideCount - slideMargin + "px";

function moveSlide(num) {
  slides.style.left = -num * 1 + "px";
  currentIdx = num;
}

nextBtn.addEventListener("click", function () {
  console.log(slideCount * 100);
  if (currentIdx < slideCount * 90) {
    //  이미지 위치 지정
    moveSlide(currentIdx + 200);
    console.log(currentIdx);
    console.log(slideCount);
  }
});
prevBtn.addEventListener("click", function () {
  if (currentIdx > 0) {
    moveSlide(currentIdx - 200);
    console.log(currentIdx);
  } else {
    moveSlide(0);
  }
});

var slides2 = document.querySelector(".slide2"),
  slide2 = document.querySelectorAll(".slide2 li"),
  currentIdx = 0,
  slideCount = slide2.length,
  prevBtn2 = document.querySelector(".prev2"),
  slideWidth = 300,
  slideMargin = 30,
  nextBtn2 = document.querySelector(".next2");

slides2.style.width =
  (slideWidth + slideMargin) * slideCount - slideMargin + "px";

function moveSlide2(num) {
  slides2.style.left = -num * 1 + "px";
  currentIdx = num;
}

nextBtn2.addEventListener("click", function () {
  console.log(slideCount * 100);
  if (currentIdx < slideCount * 90) {
    //  이미지 위치 지정
    moveSlide2(currentIdx + 200);
    console.log(currentIdx);
    console.log(slideCount);
  }
});
prevBtn2.addEventListener("click", function () {
  if (currentIdx > 0) {
    moveSlide2(currentIdx - 200);
    console.log(currentIdx);
  } else {
    moveSlide2(0);
  }
});
