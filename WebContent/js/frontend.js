function snapscreen() {
	html2canvas($("body"), {
		onrendered: function(canvas) {
			alert(window.height);
			var url = canvas.toDataURL(); //base64数据  
			var image = new Image();
			image.src = url;
			image.width = 530;
			image.height = 280;
			$("#showScreen").html("");
			$("#showScreen").append(image);
		}
	});
}

function readyLoadanswer() {
	
}

/*function showApp() {
	if($registerOut[0] != undefined) {
		$registerOut.hide();
	} else {
		$mainDiv.hide();
	};
	$end.hide();
	$appbg.show();
}

function hideApp() {
	if($registerOut[0] != undefined) {
		$registerOut.show();
	} else {
		$mainDiv.show();
	};
	$end.show();
	$appbg.hide();
}

function checkPassword(password) {
	var flag = /^\w{6,}$/.test(password);
	if(!flag) {
		$("#passwordImply").show();
		return false;
	} else {
		$("#passwordImply").hide();
		return true;
	}
}

function checkPhone(phoneNumber) {
	var flag = /^1[34578]\d{9}$/.test(phoneNumber);
	if(!flag) {
		$("#phoneImply").show();
		return false;
	} else {
		$("#phoneImply").hide();
		return true;
	}
}*/

/*function checkForm() {
	var phonenum = $("#phonenumber").val();
	var pw = $("#password").val();

	return checkPhone(phonenum) && checkPassword(pw);
}*/