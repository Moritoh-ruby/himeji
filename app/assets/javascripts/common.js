jQuery(function() {
  $('[data-toggle="popover"]').popover();
});

$(function() {

    //show/hide excuse text box
    $('#excuse_trigger').click(function() {
        $('#excuse_area').toggle();
    });

    //add money1 to the excuse form before submit
    $('#excuse_form').submit(function() {
      $('#waste_money').val(($('#money1').val()));
      return true;
    });

    //add validation for endurance form
    $('#endurance_form').submit(function() {
      if ($('#endurance').val() == '') {
       $('#endurance-validation-msg').text('入力してください');
       return false;
      } else {
       return true;
      }
    });

    //add validation for goal form
    $('#goal_form').submit(function() {
    var error = false;
      if ($('#goal-text').val() == '') {
       $('#goal-text-validation-msg').text('入力してください');
       error = true;
      } 
      if ($('#goal-money').val() == '') {
       $('#goal-money-validation-msg').text('入力してください');
       error = true;
      } 
      if (1 > $('#goal-money').val() || $('#goal-money').val() > 50) {
       $('#goal-money-validation-msg').text('1~50で入力してください');
       error = true;
      } 
      if (error) {
        return false
      } else {
        return true;
      }
    });

    //add validation for update goal form
    $('#update_form').submit(function() {
    var error = false;
    var current_saving = parseInt($('#current-saving').val());
    var goal_update_money = parseInt($('#goal-update-money').val())

      if ($('#goal-update-text').val() == '') {
       $('#update-text-validation-msg').text('入力してください');
       error = true;
      } 
      if ($('#goal-update-money').val() == '' || isNaN(goal_update_money)) {
       $('#update-money-validation-msg').text('数値を入力してください');
       return false;
      } 
      if (current_saving > goal_update_money || goal_update_money > 50) {
       $('#update-money-validation-msg').text('貯金額~50で入力してください');
       error = true;
      } 
      if (error) {
        return false
      } else {
        return true;
      }
    });
})
