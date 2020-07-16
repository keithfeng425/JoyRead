function verify() {
	var username = document.forms["form"]["username"].value;
	var password = document.forms["form"]["password"].value;
	if (username == null || username == "")	{
		alert("用户名不能为空，请重新填写！");
		return false;
	}
	if (password == null || password == "")	{
		alert("密码不能为空，请重新填写！");
		return false;
	}
}