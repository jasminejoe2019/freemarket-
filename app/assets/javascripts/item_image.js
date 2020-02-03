$(function(){
  var file_field =document.querySelector('input[type=file]')
  $('#img-file').change(function(){
    var file=$('input[type="file"]').prop('files')[0];
    var fileReader=new FileReader();
    fileReasder.onloaded=function(){
      
    }
  });
});