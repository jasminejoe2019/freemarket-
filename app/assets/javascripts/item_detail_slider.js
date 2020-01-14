$(function(){
  $('#detail').slick({
    dots:true,
    speed: 800,
    customPaging: function(slick,index) {
      var targetImage = $(slick.$slides[index]).find(".item__slider-images").attr('src');
      return '<img src=" ' + targetImage + ' "/>';
    }
  });
});
