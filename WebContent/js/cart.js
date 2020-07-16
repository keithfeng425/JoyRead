$(document).ready(function(){		
var name,value;
var str=location.href;
var num=str.indexOf("?")
str=str.substr(num+1).toString();
if (str == "empty=yes") {
	location.href='bookdisplay.jsp';
}})

	function total() {
		var tableInfo = "";
	    var tableObj = document.getElementById("table");
	    var amount;
	    var bookprice;
	    var totalprice = 0;
	    
	    for (var i = 1; i < tableObj.rows.length; i++) {    
	          
	            tableInfo = parseFloat(tableObj.rows[i].cells[1].innerText);   
	            amount = parseFloat(tableObj.rows[i].cells[2].getElementsByTagName("INPUT")[1].value);
	            bookprice = tableInfo * amount;
	            tableObj.rows[i].cells[3].innerHTML = bookprice.toFixed(2).toString();
	            //t = setTimeout("total()", 50);

	    }
	    
	    for (var i = 1; i < tableObj.rows.length; i++) {    
	          
            tableInfo = parseFloat(tableObj.rows[i].cells[3].innerText);   
            totalprice += tableInfo;
            
            t = setTimeout("total()", 50);

    }
	    document.getElementById("totalprice").innerHTML = totalprice.toFixed(2).toString();
	    
	    
	    
	  }
	
	function plus(v) {
		//alert(v);
		var amElements = document.getElementsByName("amount");
		
		//for (var i = 0; i < amElements.length; i++) {
		amElements[v].value++;
		//}
	}
	
	function minus(v) {
		var amElements = document.getElementsByName("amount");
		if (amElements[v].value > 1)
			amElements[v].value--;
	}
	
	function cal() {
		if (document.getElementById("totalprice").innerText != "0.00")
		window.location.href = "cartcal.jsp?price=" + document.getElementById("totalprice").innerText;
		else alert("您尚未添加商品！");
	}
	
