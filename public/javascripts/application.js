$(document).ready(function(){ 
    $('input.ui-date-picker').datepicker()//.datepicker("option", "dateFormat", "yy-m-d" );
    $.datepicker.setDefaults({
      showOn: 'both',
      buttonText: 'Calendar',
      dateFormat: 'yy-mm-dd'
    });
});

