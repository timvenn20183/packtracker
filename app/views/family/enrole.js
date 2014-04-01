$('html, body').animate({ scrollTop: 0 }, 0);
$('#family_management_dropdown').dropdown('toggle');
$('#content').html("<%= j render :partial => 'family/enrole' %>");