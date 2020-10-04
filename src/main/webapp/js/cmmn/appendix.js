$(function() {
   $('.download').click(function () {
       var $target = $(this);

       var filename = $target.data("filename");
       var originFilename = $target.data("origin");
       var url =  $target.data("url");

       var html = [];

       html.push("<form id='commonForm' name='commonForm'></form>");

       $("body").append(html.join(""));

       var comSubmit = new ComSubmit();

       comSubmit.setUrl(url);
       comSubmit.addParam("filename", filename);
       comSubmit.addParam("originFilename", originFilename);
       comSubmit.submit();

       $("#commonForm").remove();
   })
});