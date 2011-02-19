  var amounts = ["regular", "principal", "interest", "late_interest", "permitted_fee"];
  var permitted_fees = ["acceptance_fees", "revolving_renewal_fees", "late_repayment", "terms_of_contract_variation", "cheque_dishonour", "preclosure_termination_fees", "legal_fees"];
  $("#show_permitted_fees").click(function() {$("#permitted_fees").toggle()});
  function onTransactionTypeChange() {
    $("#permitted_fees, #show_permitted_fees").hide();
    for(i in amounts)
      $('#transaction_'+amounts[i]).val("0.0");
    $('#loan_group').hide();
    $('#book_transfer_group').hide();
    $('#account_transfer_group').hide();
    $('#book_transfer_group').hide();
    $('#account_transfer_group').hide();
    if ($('#transaction_transaction_type').val() == 'repayment') {
      $("#show_permitted_fees").show();
      for(i in amounts)
        $('#transaction_' + amounts[i] + '_input').show();
    } else {
      // hide amounts
      for(i in amounts)
        $('#transaction_' + amounts[i] + '_input').hide();
      //
      var transaction_type = $('#transaction_transaction_type').val();
      if (transaction_type == 'book_transfer')
        $('#book_transfer_group').show();
      else if (transaction_type == 'account_transfer')
        $('#account_transfer_group').show();
      else if (transaction_type == 'repayment' || transaction_type == 'disbursement')
        $('#loan_group').show();
    }
  }
  //
  // Amount
  //
  function onAmountsChange() {
    if ($('#transaction_transaction_type').val() == 'repayment') {
      var amount = 0.0;
      for(i in amounts)
        amount += parseFloat($('#transaction_'+amounts[i]).val());
      console.debug("amount: ", amount);
      $('#transaction_amount').val(amount);
    }
  }
  $('#transaction_transaction_type').change(onTransactionTypeChange);
  onTransactionTypeChange();
  for(i in amounts)
    $('#transaction_'+amounts[i]).keyup(onAmountsChange);
  //
  // Permitted Fees
  //
  function onPermittedFeesChange() {
    var amount = 0.0;
    for(i in permitted_fees)
      amount += parseFloat($('#transaction_' + permitted_fees[i]).val());
    console.debug("permitted_fees: ", amount);
    $('#transaction_permitted_fee').val(amount);
    onAmountsChange();
  }
  for(i in permitted_fees)
    $('#transaction_'+permitted_fees[i]).keyup(onPermittedFeesChange);
  onPermittedFeesChange();
  //

