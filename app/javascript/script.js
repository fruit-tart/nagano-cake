// Swiperのオプションを定数化
const swiperOption = {
  loop: true,
  speed: 1500,
  slidesPerView: "auto",
  centeredSlides: true,
  autoplay: {
    delay: 3000,
    disableOnInteraction: false,
  },
  pagination: {
    el: '.swiper-pagination',
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  }
}

$(document).on('turbolinks:load', function() {
  //.swiper-slideの枚数が少ないと正常にループしないバグを修正
  //※swiper-wrapperの中身を複製しているのでページネーションを表示する場合は要注意
  $('.swiper-wrapper').children().clone(true).appendTo('.swiper-wrapper');
  //Swiperを実行(初期化)
  let swiper = new Swiper('.swiper', swiperOption);
});