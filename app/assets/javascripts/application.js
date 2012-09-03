// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
    url                 = this.URL;
    query_string_list   = url.split('?')
    query_string        = query_string_list[1]

    if (typeof(query_string) === "undefined") {
        action = 'list_fans';
    } else {
        action = query_string.split('=')[1];
    }

    $('#li_fans').addClass('active');
    $('#div_fans').addClass('active');

    switch(action) {
        case 'do_not_follow':
        case 'follow':
            $('#li_fans').removeClass('active');
            $('#div_fans').removeClass('active');

            $('#li_leaders').addClass('active');
            $('#div_leaders').addClass('active').tab('show');;
            break;

        default:
            $('#div_fans').tab('show');
    }
})