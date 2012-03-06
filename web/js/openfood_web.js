var openfood = {};

openfood.raw_text = function() {

    $('a.raw-text-link').each(function(){
      $(this).bind('onmouseover', function(){
      
      });

    var txt = $(this).attr("href");

  });
}

$(document).ready(function() {
openfood.raw_text();
/*
	$(function() {
		$( "#tabs" ).tabs();
		
    $('a[href]').each(function(){
      if(this.hash){
        if($(this.hash + '.ui-tabs-panel').length > 0 && $(this).parents('div.ui-tabs').length == 0 ){
          link = this.href.replace(this.hash, '');
          page = window.location.href.replace(window.location.hash, '');
          if(link == page || link == ''){
            this.onclick = function(){
              $('.tabs').tabs('select', this.hash);
              return false;
            }
          }
        }
      }
    });
	});

  $.address.change(function(event){
    $("#tabs").tabs( "select" , window.location.hash );
  });

  // when the tab is selected update the url with the hash
  $("#tabs").bind("tabsselect", function(event, ui) { 
    window.location.hash = ui.tab.hash;
  });
*/





});
