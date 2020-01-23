$(function(){
  $('.input_pricebox').on('input', function(){
    var data = $('.input_pricebox').val();
    var profit = Math.round(data * 0.9)
    var fee = (data - profit)
    $('.right_bar').html(fee)
    $('.right_bar').prepend('¥')
    $('.right_bar_2').html(profit)
    $('.right_bar_2').prepend('¥')
    $('#price').val(profit)
    if(profit == '') {
    $('.right_bar_2').html('');
    $('.right_bar').html('');
    }
  })
});


$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendOptionSize(size){
    var html = `<option value="${size.size}" data-category="${size.id}">${size.size}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='select-wrap' id= 'children_wrapper'>
                        <select class="select-default select-product" id="child_category" name="category_id">
                          <option value="--" data-category="--">---</option>
                          ${insertHTML}
                        <select>
                      </div>`;
    $('#category_box').append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='select-wrap' id= 'grandchildren_wrapper'>
                              <select class="select-default select-product" id="grandchild_category" name="category_id">
                                <option value="--" data-category="--">--</option>
                                ${insertHTML}
                              <select>
                            </div>`;
    $('#category_box').append(grandchildSelectHtml);
  }

  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="form-groups select-box" id= 'size_wrapper'>
                        <label for="categories">
                          サイズ
                        </label>
                        <span class="form-require">
                          必須
                        </span>
                        <div class='select-wrap'>
                          <select class="select-default select-product" id="size" name="size_id">
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('#category_box').append(sizeSelectHtml);
  }


  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "--"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  $('#category_box').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "--"){
      console.log(childId)
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });


  $('#category_box').on('change', '#grandchild_category', function(){
    var sizeId = $('#grandchild_category option:selected').data('category');
    if (sizeId != "--"){
      console.log(sizeId)
      $.ajax({
        url: 'get_size',
        type: 'GET',
        data: { size_id: sizeId},
        dataType: 'json'
      })
      .done(function(size){
        if (size.length != 0) {
          // $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML2 = '';
          size.forEach(function(size){
            insertHTML2 += appendOptionSize(size);
          });
          appendSizeBox(insertHTML2);
        }
        console.log("success")
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  })
});