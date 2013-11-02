//This function is use to reply an ad
function sender_button(id_sender) {
	var button_reply = document.getElementById("message_receiver_id");
	var form_message = document.getElementById("form_message");
	form_message.hidden =false;
	button_reply.value = id_sender;
}

function cancel_message() {
	var form_message = document.getElementById("form_message");
	form_message.hidden =true;
}