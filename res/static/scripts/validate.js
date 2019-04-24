function validate() {
	var f = document.getElementById("form");
	var hasFirstNameError = firstNameValidate(f);
	var hasCardNumber = cardValidate(f);
	var hasExpire = expireValidate(f);
	var hasCVV = cvvValidate(f);
	if (!hasCardNumber || !hasFirstNameError || !hasCVV)
		return false;
	else
		return true;
}
function firstNameValidate(form) {
	var error2 = document.getElementById("firstNameError");

	var firstName = form["firstName"].value;

	error2.innerHTML = "";

	if (firstName == null || firstName == "") {
		error2.innerHTML = "Input Your FirstName";
	}

	else if (!isNaN(firstName)) {
		error2.innerHTML = "Name Can Not be a number";
	}

	else if (firstName.length < 1 || firstName.length > 10) {
		error2.innerHTML = "Name has to be 1 to 10 chars"
	}

}
function cardValidate(form) {
	var error2 = document.getElementById("cardError");

	var card = form["card"].value;

	error2.innerHTML = "";

	if (card == null || card == "") {
		error2.innerHTML = "Input Your Card Number";
	}

	else if (isNaN(card)) {
		error2.innerHTML = "Card Number Can Not be alphabate";
	}

	else if (card.length != 16) {
		error2.innerHTML = "Card number has to be 16 digits"
	}

}
/*function expireValidate(form) {
	var error2 = document.getElementById("expireError");
	var expire = document.getElementById("expire").value;
	error2.innerHTML = "";

	if (expire == null || expire == "") {
		error2.innerHTML = "Input Your Expiration date";
	}

	else if (isNaN(expire)) {
		error2.innerHTML = "Expiration date Can Not be alphabate";
	}

	else if (expire.length > 4 || expire.length < 1) {
		error2.innerHTML = "Expiration date has to be 2 digits"
	}
}*/
function cvvValidate(form) {
	var error2 = document.getElementById("cvvError");
	var cvv = form["cvv"].value;
	error2.innerHTML = "";

	if (cvv == null || cvv == "") {
		error2.innerHTML = "Input Your CVV";
	}

	else if (isNaN(cvv)) {
		error2.innerHTML = "CVV Can Not be alphabate";
	}

	else if (cvv.length != 3) {
		error2.innerHTML = "CVV has to be 3 digits"
	}
}

function valid() {
	var f1 = document.getElementById("form1");
	var hasFirstNameError1 = firstNameValidate1(f1);
	var hasCardNumber1 = cardValidate1(f1);
	var hasExpire1 = expireValidate1(f1);
	var hasCVV1 = cvvValidate1(f1);
	if (!hasCardNumber1 || !hasFirstNameError1 || !hasExpire1 || !hasCVV1)
		return false;
	else
		return true;
}
function firstNameValidate1(form1) {
	var error1 = document.getElementById("firstNameError1");

	var firstName1 = form1["firstName1"].value;

	error1.innerHTML = "";

	if (firstName1 == null || firstName1 == "") {
		error1.innerHTML = "Input Your FirstName";
	}

	else if (!isNaN(firstName1)) {
		error1.innerHTML = "Name Can Not be a number";
	}

	else if (firstName1.length < 1 || firstName1.length > 10) {
		error1.innerHTML = "Name has to be 1 to 10 chars"
	}

}
function cardValidate1(form1) {
	var error1 = document.getElementById("cardError1");

	var card1 = form1["card1"].value;

	error1.innerHTML = "";

	if (card1 == null || card1 == "") {
		error1.innerHTML = "Input Your Card Number";
	}

	else if (isNaN(card1)) {
		error1.innerHTML = "Card Number Can Not be alphabate";
	}

	else if (card1.length != 16) {
		error1.innerHTML = "Card number has to be 16 digits"
	}

}
function expireValidate1(form1) {
	var error1 = document.getElementById("expireError1");
	var expire1 = form1["expire1"].value;
	error1.innerHTML = "";

	if (expire1 == null || expire1 == "") {
		error1.innerHTML = "Input Your Expiration date";
	}

	else if (isNaN(expire1)) {
		error1.innerHTML = "Expiration date Can Not be alphabate";
	}

	else if (expire1.length > 4 || expire1.length < 1) {
		error1.innerHTML = "Expiration date has to be 2 digits"
	}
}
function cvvValidate1(form1) {
	var error1 = document.getElementById("cvvError1");
	var cvv1 = form1["cvv1"].value;
	error1.innerHTML = "";

	if (cvv1 == null || cvv1 == "") {
		error1.innerHTML = "Input Your CVV";
	}

	else if (isNaN(cvv1)) {
		error1.innerHTML = "CVV Can Not be alphabate";
	}

	else if (cvv1.length != 3) {
		error1.innerHTML = "CVV has to be 3 digits"
	}
}