$('html, body').animate({ scrollTop: 0 }, 0);
$('#header').html("<%= j render :partial => 'main/navigation', :locals => {:parents => @parents, :recruits => @recruits, :user => @user} %>");
$('#content').html("<%= j render :partial => 'parents/edit', :locals => {:parent => @parent} %>");
$('#notify').html("<%= j render :partial => 'parents/create_success', :locals => {:parent => @parent} %>");
