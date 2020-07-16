function firm1()
 
{
    if(confirm("警告：您确定要清空当前购物车内的商品？"))
 
    {
    	location.href="cartempty.jsp";
    	return;
     }
}

function firm2()
 
{
    if(confirm("警告：您确定要删除全部的注册用户？"))
 
    {
    	location.href="alldelsuccess.jsp";
    	return;
     }
}