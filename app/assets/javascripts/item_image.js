$(function(){
  var dropbox=$('.dropbox-text-container');
  var dropbox2=$('.dropbox-text-container2');
  var dropbox_area=$('.dropbox-text')
  var images = [];
  var inputs = [];
  var input_area=$('.input_area');
  var thumnail=$('#thumnail');
  var thumnail2=$('#thumnail2');

  function buildHTML(num){
    var html = `<div class="img_view">
                  <img src="">
                  <div class="btn_wrapper">
                    <div class="btn edit">編集</div>
                    <div class="btn delete">削除</div>
                  </div>
                </div>`
    return html;
  }

  $(document).on('change','input[type=file].upload-image',function(event){
    var file=$(this).prop('files')[0];
    var reader=new FileReader();
    var img=$('<div class="img_view"><img></div>');
    inputs.push($(this));
    reader.onload=function(e){
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div><div class="btn edit">');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);
    if(images.length >= 5){
      dropbox2.css({
        'display': 'block'
      })
      dropbox.css({
        'display': 'none'
      })
      $.each(images,function(index,image){
        image.attr('data-image',index);
        if (index < 5){
          thumnail.append(image);
        }else{
          thumnail2.append(image);
        }
        dropbox2.css({
          'width': `calc(620px - (124px * ${images.length - 5}))`
        })
      })
      if(images.length == 9) {
        dropbox2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    } else {
        $('#thumnail').empty();
        $.each(images, function(index, image) {
          console.log(image);
          image.attr('data-image', index);
          thumnail.append(image);
        })
        dropbox.css({
          'width': `calc(620px - (124px * ${images.length}))`
        })
      }
      if(images.length == 4) {
        dropbox.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    if(images.length == 10) {
      dropbox2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input class="upload-image" name="item[images_attributes][${images.length}][image]" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
    console.log(images);
  });

  if (window.location.href.match(/\/items\/\d+\/edit/)){

    $('.img_view').each(function(index){
      $(this).attr('data-image',index);
      images.push($(this));
    })
    $('input[id^=item_images_attributes]'+'input[id$=id]').each(function(index){
      $(this).attr('data-image',index);
      inputs.push($(this));
    });
    dropbox.css({
      'width': `calc(620px - (124px * ${images.length}))`
    })
    $(document).on('click','.edit',function(){
      var target_image=$(this).parent().parent();
       $('input[name=\"item[images_attributes]['+target_image.data('image')+'][image]\"]').trigger('click');
console.log($('input[name=\"item[images_attributes]['+target_image.data('image')+'][image]\"]').data('image'));
      })
    $(document).on('click','.delete',function(){
      var target_image=$(this).parent().parent();
      $.each(inputs,function(index,input){
        if ($(this).data('image')==target_image.data('image')){
          $(`#item_images_attributes_${index}__destroy`).prop('checked', true)
          target_image.remove();
          var num=$(this).data('image');
          images.splice(num,1);
          inputs.splice(num,1);
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
          // image.attr('data-image', index);
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


  }else{
    
    $(document).on('click','.delete',function(){
      var target_image=$(this).parent().parent();
      $.each(inputs,function(index,input){
        if ($(this).data('image')==target_image.data('image')){
          $(this).remove();
          target_image.remove();
          var num=$(this).data('image');
          images.splice(num,1);
          inputs.splice(num,1);
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
      $(".delete").prop("disabled",false);
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
  }

  
});

