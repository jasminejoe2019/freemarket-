$(function () {
  $('input[name="pointUse"]').change(function () {
    let val = $("#pointUse:checked").val();
    if (val == "true") {
      $('.confirmMain__wrapper__buyerInfo__inner__point__use').slideDown(300);
    } else {
      $('.confirmMain__wrapper__buyerInfo__inner__point__use').slideUp(300);
    }
  });
});