


function  notify(){
	var  mnotify=document.getElementById("mnotify");
	var  downbox=document.getElementById("downbox");
//	alert("ml:"+mnotify.style.left+"  mt:"+mnotify.style.top+"  dl:"+downbox.style.left+"  dt:"+downbox.style.top);
		mnotify.onclick=function(){
		if(downbox.style.display=="none")
		downbox.style.display="block"	;
		else{
			downbox.style.display="none";
		}
		}
	 }
function  notifyani(num){
	 
	var mnotify=document.getElementById("mnotify");
	if(mnotify.style.visibility=="visible"){
		mnotify.style.visibility="hidden";
	setTimeout("notifyani()",500);
	}
	else{
		mnotify.style.visibility="visible";
			setTimeout("notifyani()",2000);
	}
}
function   setNotifynum(num){
	var  notifynum=document.getElementById("notifynum");
	if(num!=null)
	notifynum.innerText=num;
}
function   showdownBox(text){
	var downbox=document.getElementById("downbox");
	downbox.style.display="block";
	var   downboxtext=document.getElementById("dropdowntext");
	downboxtext.innerHTML=text;
}

 


addLoadEvent(notify);
addLoadEvent(notifyani)
