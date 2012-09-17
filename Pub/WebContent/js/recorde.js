function selectchange(){
    var selects = document.getElementsByClassName("select");
	var  form =document.getElementById("recordeform");
	var recordetype=document.getElementById("roomtype");
	 
    for (var i = 0; i < selects.length; i++) {
		var  a=i;
 		selects[i].onclick=function(){
				recover(selects);
				this.className="select  activity";
				recordetype.value=this.id;
				form.submit();
		}   
    }
}


function   recover(selects){
	for(var  j=0;j<selects.length;j++){
		selects[j].className="select";
	}

}
function initselect(){
  var  tabtag=document.getElementById("tag");
   var selects = document.getElementsByClassName("select");
  var  tag=tabtag.innerHTML;
  selects[tag-1].className="select  activity";
}



addLoadEvent(initselect);
addLoadEvent(selectchange);
