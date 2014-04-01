$('#content').html("<%= j render :partial => 'parents/edit', :locals => {:parent => @parent, :user => @user} %>");

