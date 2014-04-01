$('#content').html("<%= j render :partial => 'family/my_family', :locals => {:user => @user, :parent => @parent, :parents => @parents, :recruits => @recruits} %>");
