
function checkbox(selectbox){
	var checkallbox = selectbox.getElementsByClassName("checkallbox");
	var  c=checkallbox[0];
	c.onclick = function(){
		var checkboxes = selectbox.getElementsByClassName("checkbox");
		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = c.checked;
		}
		
	}
}
function  setCheck(){
	var  selectbox=document.getElementsByClassName("selectbox");
	for(var  i=0;i<selectbox.length;i++){
	checkbox(selectbox[i]);
		
	}
}

function  addkeyword(){
	
	var  inputkeywords=document.getElementsByName("keywords")[0];
	var  addbtn=document.getElementById("addkey");
	var  keycontent=document.getElementById("keycontent");
	addbtn.onclick=function(){
		if (keywordtext == "") {
			alert("请输入关键字");
		}
		else {
			var  keywordtext=document.getElementById("inputkey").value;
			var keywordDiv = document.createElement("div");
			keywordDiv.setAttribute("class", "keyword");
			keywordDiv.appendChild(document.createTextNode(keywordtext));
			keycontent.appendChild(keywordDiv);
			if (inputkeywords.value != "") {
				inputkeywords.value  = inputkeywords.value + "&" + keywordtext;
			}
			else{
				inputkeywords.value=keywordtext;
			}
			document.getElementById("inputkey").value="";
		}
	}
}

 
	addLoadEvent(addkeyword);
	addLoadEvent(setCheck);
 

