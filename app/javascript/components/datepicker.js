import jQuery

var $ = require('jQuery');

$(function() {
  $('input[name="birthday"]').daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    minYear: 2018,
    maxYear: parseInt(moment().format('YYYY'),10)
  }
});
