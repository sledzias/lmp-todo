// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

function executePostRequest(url) {
  executeRequestWithMethod(url, 'post');
}

function executeRequestWithMethod(url, method) {
  divId = 'hidden-div'
  formId = 'hidden_post_form'
  if($('#'+divId).length===0);
    $("body").append('<div id="'+divId+'" style="display:none;"></div>');
  $('#'+divId).html(
    '<form action="'+url+'" id="'+formId+'" method="'+method+'"></form>'
  );
  $('#'+formId).submit();
}

function executeDeleteRequest(url) {
  divId = 'hidden-div'
  formId = 'hidden_post_form'
  if($('#'+divId).length===0);
    $("body").append('<div id="'+divId+'" style="display:none;"></div>');
  $('#'+divId).html(
    '<form action="'+url+'" id="'+formId+'" method="delete"></form>'
  );
  $('#'+formId).submit();
}

var oldValue;

$( document ).ready(function() {

    $(".mark_as_complete").click(function(){
      executePostRequest('/tasks/'+this.id+'/mark_as_complete')
    });

    $( "#create_new_task" ).click(function() {
      $("#todo-form").submit();
    });

    $("#toggle-all").click(function(){
      executePostRequest('/tasks/mark_all_as_complete')
    });

    $(".editafterblur").blur(function(){
      if(this.value==oldValue)
        return;
      $.ajax({
        type: 'PATCH',
        data: { task: {description:this.value} },
        url: '/tasks/'+this.id+'/update',
      });
    });
    
    $(".editafterblur").focus(function() {
      oldValue=this.value;
    });

    $("#clear-completed").click(function(){
      executePostRequest('/tasks/clear_completed')
    });

    $(".destroy").click(function(){
      $.ajax({
        type: 'DELETE',
        url: '/tasks/'+this.id+'/destroy',
      });
    });
    
});
