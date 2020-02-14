$(function(){
  var dropbox=$('.dropbox-text-container');
  var dropbox2=$('.dropbox-text-container2');
  var dropbox_area=$('.dropbox-text')
  var images = [];
  var inputs = [];
  var input_area=$('.input_area');
  var thumnail=$('#thumnail');
  var thumnail2=$('#thumnail2');

  function preview(array){
    if(array.length >= 5){
      dropbox2.css({
        'display': 'block'
      })
      dropbox.css({
        'display': 'none'
      })
      $.each(array,function(index,element){
        element.attr('data-image',index);
        if (index < 5){
          thumnail.append(element);
        }else{
          thumnail2.append(element);
        }
        dropbox2.css({
          'width': `calc(620px - (124px * ${array.length - 5}))`
        })
      })
      if(array.length == 9) {
        dropbox2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    } else {
        $('#thumnail').empty();
        $.each(array, function(index, element) {
          element.attr('data-image', index);
          thumnail.append(element);
        })
        dropbox.css({
          'width': `calc(620px - (124px * ${array.length}))`
        })
      }
      if(array.length == 4) {
        dropbox.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    if(array.length == 10) {
      dropbox2.css({
        'display': 'none'
      })
      return;
    }
  }


  $(document).on('change','input[type=file].upload-image',function(event){
    var file=$(this).prop('files')[0];
    // inputに振ったindexを取得
    var index =$(this).data('image');
    var reader=new FileReader();
    var img=$('<div class="img_view"><img></div>');
    if(this.id == 'upload-image'){
      inputs.push($(this));
      reader.onload=function(e){
        var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete" id="new-image">削除</div><div class="btn edit">');
        img.append(btn_wrapper);
        img.find('img').attr({
          src: e.target.result
        })
      }
      reader.readAsDataURL(file);
      images.push(img);
      preview(images);
      var new_image = $(`<input class="upload-image" name="item[images_attributes][${images.length-1}][image]" data-image= ${images.length-1} type="file" id="upload-image"></<input>`);
      input_area.prepend(new_image);
    }else{
      // .img_vieのdata-image=indexのもの の 直下のimgタグを取得
      img = $(`.img_view[data-image=${index}]>img`)
      reader.onload=function(e){
        // imgタグのsrcを e.target.result で上書き
        img.attr('src', e.target.result)
      }
      reader.readAsDataURL(file);
    }
    
  });
  $(document).on('click','.delete',function(){
    var target_image=$(this).parent().parent();
    $.each(inputs,function(index,input){
      if ($(this).data('image')==target_image.data('image')){
        if ($(this).attr('id') =="upload-image"){
          $(this).remove();
        }else{
          $(`#item_images_attributes_${index}__destroy`).prop('checked', true)
        }
        var num=$(this).data('image');
          images.splice(num,1);
          inputs.splice(num,1);
        target_image.remove();
        $(this).removeAttr('data-image');
        if(inputs.length==0){
          $('input[type="file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type="file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropbox2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        thumnail2.append(image);
      })
      dropbox2.css({
        'width': `calc(620px - (124px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        dropbox2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        dropbox2.find('i').replaceWith('<p>ココをクリックしてください</p>')
      }
    } else {
      dropbox.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        thumnail.append(image);
      })
      dropbox.css({
        'width': `calc(620px - (124px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      dropbox2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      dropbox.find('i').replaceWith('<p>ココをクリックしてください</p>')
    }
  })
  $(document).on('click','.edit',function(){
    var target_image=$(this).parent().parent();
    $('input[name=\"item[images_attributes]['+target_image.data('image')+'][image]\"]').trigger('click');
  })

  if (window.location.href.match(/\/items\/\d+\/edit/)){

    $('.img_view').each(function(index){
      $(this).attr('data-image',index);
      images.push($(this));
    })
    $('input[id^=item_images_attributes]'+'input[id$=id]').each(function(index){
      $(this).attr('data-image',index);
      inputs.push($(this));
    });
    preview(images);
  }
  $('#item-update').click(function(){
    if ($('.img_view').length == 0){
      $('.notifications').append('<div class="alert">画像は1枚以上登録してください</div>');
      $(window).scrollTop(0);
      return false;
    }
  })
});

// $(document).on('click','.delete',function(){
//   var target_image=$(this).parent().parent();
//   $.each(inputs,function(index,input){
//     if ($(this).data('image')==target_image.data('image')){
//       $(this).remove();
//       target_image.remove();
//       var num=$(this).data('image');
//       images.splice(num,1);
//       inputs.splice(num,1);
//       if(inputs.length==0){
//         $('input[type="file"].upload-image').attr({
//           'data-image': 0
//         })
//       }
//     }
//   })
//   $('input[type= "file"].upload-image:first').attr({
//     'data-image': inputs.length
//   })
//   $.each(inputs, function(index, input) {
//     var input = $(this)
//     input.attr({
//       'data-image': index
//     })
//     $('input[type="file"].upload-image:first').after(input)
//   })
// if (images.length >= 5) {
//   dropbox2.css({
//     'display': 'block'
//   })
//   $.each(images, function(index, image) {
//     image.attr('data-image', index);
//     thumnail2.append(image);
//   })
//   dropbox2.css({
//     'width': `calc(620px - (124px * ${images.length - 5}))`
//   })
//   if(images.length == 9) {
//     dropbox2.find('p').replaceWith('<i class="fa fa-camera"></i>')
//   }
//   if(images.length == 8) {
//     dropbox2.find('i').replaceWith('<p>ココをクリックしてください</p>')
//   }
// } else {
//   dropbox.css({
//     'display': 'block'
//   })
//   $.each(images, function(index, image) {
//     image.attr('data-image', index);
//     thumnail.append(image);
//   })
//   dropbox.css({
//     'width': `calc(620px - (124px * ${images.length}))`
//   })
// }
// if(images.length == 4) {
//   dropbox2.css({
//     'display': 'none'
//   })
// }
// if(images.length == 3) {
//   dropbox.find('i').replaceWith('<p>ココをクリックしてください</p>')
// }
// })