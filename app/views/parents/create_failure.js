$('html, body').animate({ scrollTop: 0 }, 0);
$('#notify').html("<%= j render :partial => 'parents/create_failure', :locals => {:parent => @parent} %>");
