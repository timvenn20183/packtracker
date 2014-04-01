$('html, body').animate({ scrollTop: 0 }, 0);
$('#header').html("<%= j render :partial => 'main/navigation', :locals => {:parents => @parents, :recruits => @recruits, :user => @user} %>");
$('#notify').html("<%= j render :partial => 'recruits/success' %>");

