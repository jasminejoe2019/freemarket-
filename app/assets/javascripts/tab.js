$(function () {
  let tabs = $(".mypage__firstMenu__tabs__menu");
  function tabSwitch() {
    $('.active').removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".mypage__firstMenu__contents__notice").removeClass("show").eq(index).addClass("show");
  }
  tabs.click(tabSwitch);
})

$(function () {
  let tabs = $(".mypage__secondMenu__tabs__menu");
  function tabSwitch2() {
    $('.active2').removeClass("active2");
    $(this).addClass("active2");
    const index = tabs.index(this);
    $(".mypage__secondMenu__contents__transactionNow").removeClass("show2").eq(index).addClass("show2");
  }
  tabs.click(tabSwitch2);
})