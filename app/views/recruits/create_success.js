$('html, body').animate({ scrollTop: 0 }, 0);
$('#header').html("<%= j render :partial => 'main/navigation', :locals => {:parents => @parents, :recruits => @recruits, :user => @user} %>");
$('#content').html("<%= j render :partial => 'recruits/edit', :locals => {:recruit => @recruit, :user => @user, :patrols => @patrols, :burrows => @burrows, :sixers => @sixers} %>");
$('#notify').html("<%= j render :partial => 'recruits/create_success', :locals => {:recruit => @recruit} %>");
