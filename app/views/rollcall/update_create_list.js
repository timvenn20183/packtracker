$('#rollcall_list').html("<%= j render :partial => 'rollcall/update_create_list', :locals => {:recruits => @recruits, :applydate => @applydate} %>");