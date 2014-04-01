$('html, body').animate({ scrollTop: 0 }, 0);
$('#notify').html("<%= j render :partial => 'recruits/create_failure', :locals => {:recruit => @recruit, :user => @user} %>");
