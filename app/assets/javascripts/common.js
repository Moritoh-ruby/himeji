jQuery(function() {
  $('[data-toggle="popover"]').popover();
});

$(function() {
    $('#excuse_trigger').click(function(){
        $('#excuse_area').show();
    });

    $('#excuse_form').submit(function(){
      $('#waste_money').val(($('#money1').val()));
      console.log($('#waste_money').val())
      return true;
    });

})
