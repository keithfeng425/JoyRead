function verify() {
	var username = document.forms["form"]["username"].value;
	var nickname = document.forms["form"]["nickname"].value;
	var password = document.forms["form"]["password"].value;
	var age = document.forms["form"]["age"].value;
	var gender = document.forms["form"]["gender"].value;
	var phone = document.forms["form"]["phone"].value;
	var number = /^[0-9]+$/;
	var pn = /^[1][0-9]{10}$/;  
	if (username == null || username == "")	{
		alert("用户名不能为空，请重新填写！");
		return false;
	}
	if (username.indexOf(" ") != -1) {
		alert("用户名中不能包含空格，请重新填写！");
		return false;
	}
	if (nickname == null || nickname == "")	{
		alert("昵称不能为空，请重新填写！");
		return false;
	}
	if (nickname.indexOf(" ") != -1) {
		alert("昵称中不能包含空格，请重新填写！");
		return false;
	}
	if (password == null || password == "")	{
		alert("密码不能为空，请重新填写！");
		return false;
	}
	if (password.length < 6) {
		alert("密码长度需不小于6位，请重新填写！");
		return false;
	}
	if (age == null || age == "")	{
		alert("年龄不能为空，请重新填写！");
		return false;
	}
	if (!number.test(age))	{
		alert("年龄只能为数字，请重新填写！");
		return false;
	}
	if (gender == null || gender == "")	{
		alert("未选择性别，请重新填写！");
		return false;
	}
	if (phone == null || phone == "")	{
		alert("手机号不能为空，请重新填写！");
		return false;
	}
	if (!pn.test(phone))	{
		alert("手机号填写有误，请重新填写！");
		return false;
	}
}