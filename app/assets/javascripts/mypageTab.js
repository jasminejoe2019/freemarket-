$(function () {
  let tabs = $(".mypage__notification__tabs__menu");
  function tabSwitch() {
    $('.active').removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".mypage__notification__contents__list").removeClass("show").eq(index).addClass("show");
  }
  tabs.click(tabSwitch);
})

$(function () {
  let tabs = $(".mypage__itemList__tabs__menu");
  function tabSwitch() {
    $('.active2').removeClass("active2");
    $(this).addClass("active2");
    const index = tabs.index(this);
    $(".mypage__itemList__contents__list").removeClass("show2").eq(index).addClass("show2");
  }
  tabs.click(tabSwitch);
})