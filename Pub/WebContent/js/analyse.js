/**
 * @author yu
 */
function   stripeTables(){
	if(!document.getElementsByTagName)return  false;
	var  tables =document.getElementsByTagName("table");
	var  odd=false;
	var  rows=tables[0].getElementsByTagName("tr");
	for(var  j=0;j<rows.length;j++){
		if(odd==true){
			addClass(rows[j],"oddtr");
			odd=false;
		}
		else{
			addClass(rows[j], "eventr");
			odd=true;
		}
	}
}

function highlightRows() {
	  if(!document.getElementsByTagName) return false;
	  var rows = document.getElementsByTagName("tr");
	  for (var i=1; i<rows.length; i++) {
	    rows[i].oldClassName = rows[i].className
	    rows[i].onmouseover = function() {
	      addClass(this,"highlight");
	    }
	    rows[i].onmouseout = function() {
	      this.className = this.oldClassName
	    }
	  }
	}


function addClass(element,value){
	if(!element.className){
		element.className=value;
	}
	else{
		  newClassName = element.className;
		    newClassName+= " ";
		    newClassName+= value;
		    element.className = newClassName;
	}
}
addLoadEvent(stripeTables);
addLoadEvent(highlightRows);