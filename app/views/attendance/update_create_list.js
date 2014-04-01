$('#attendance_list').html("<%= j render :partial => 'attendance/update_create_list', :locals => {:recruits => @recruits, :applydate => @applydate, :attendancetype => @attendancetype} %>");
