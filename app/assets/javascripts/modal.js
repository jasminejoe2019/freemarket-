$(function () {
  $(".modal_open").click(function (event) {
    event.preventDefault();
    var navClass = $(this).attr("class"),
      href = $(this).attr("href");

    $(href).fadeIn();
    $(this).addClass("open");
    return false;
  });

  $(".modal_close").click(function () {
    $(this).parents(".modal").fadeOut();
    $(".modalOpen").removeClass("open");
    return false;
  });

});