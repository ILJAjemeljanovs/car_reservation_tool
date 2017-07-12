// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

$(function () {
    $('#datetimepicker').datetimepicker({format: 'YYYY-MM-DD'});
    $('#datetimepicker1').datetimepicker({ sideBySide: true, format: 'YYYY-MM-DD HH:mm'});
    $('#datetimepicker2').datetimepicker({ sideBySide: true, format: 'YYYY-MM-DD HH:mm'});

    // $("#datetimepicker1").on("dp.change", function (e) {
    //   $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
    // });
    // $("#datetimepicker2").on("dp.change", function (e) {
    //   $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
    // });
});
