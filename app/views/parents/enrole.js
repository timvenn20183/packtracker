$('#content').html("<%= j render :partial => 'parents/enrole', :locals => {:parent => @parent, :user => @user} %>");