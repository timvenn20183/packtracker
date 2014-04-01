$('#content').html("<%= j render :partial => 'recruits/edit', :locals => {:recruit => @recruit, :user => @user, :patrols => @patrols, :burrows => @burrows, :sixers => @sixers} %>");

