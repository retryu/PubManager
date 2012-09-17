/**
 * @author yu
 */
function addLoadEvent(func){
    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
        window.onload = func;
    }
    else {
        window.onload = function(){
            oldonload();
            func();
        }
    }
}


function immediately(){
    var element = document.getElementById("activitytitle");
	if (element == null) 
		return;
		
    if ("\v" == "v") {
        alert("ie");
        element.onpropertychange = webChange;
    }
    else {
        element.addEventListener("input", webChange, false);
        
    }
    function webChange(){
            document.getElementById("phonetitle").innerHTML = element.value
            }
}





function immediately2(){
	 
    var element2 = document.getElementById("activitytext");
	if (element2 == null) 
		return;
	if ("\v" == "v") {
        alert("ie");
        element2.onpropertychange = webChange;
    }
    else {
        element2.addEventListener("input", webChange2, false);
        
    }
    function webChange2(){
            document.getElementById("phonetext").innerHTML = element2.value
            }
}

 
 function  tabchange(){
    var tabs = document.getElementById("tabs");
    lis = tabs.getElementsByTagName("li");
    content = document.getElementById("content");
    divs = content.getElementsByClassName("ui-tabs-panel");
	
  
    clearAllClass = function(arr,name){
        var lens = arr.length,re = new RegExp(name,'gi');
        for(var j = 0;j<lens;j++){
            if(re.test(arr[j].className)){
                arr[j].className = arr[j].className.replace(re,'');
            }
        }
        return arr;
    },
    addClass = function(o,name){
        var re = new RegExp(name,'gi');
        if (!re.test(o.className)) o.className += " "+name;
        return o;
    };
    for(var i=0 ,len=lis.length;i<len;i++){
        ~function(a){
            lis[a].onclick = function(){
				//alert("onclick");
                addClass(clearAllClass(lis,'ui-state-active')[a],'ui-state-active');
				for(var j=0;j<lis.length;j++){
					if(j!=a){
					 if(divs[j].className.indexOf("ui-tabs-hide")==-1){
					 	addClass(divs[j],'ui-tabs-hide');
					 }
					}
				}
				var  cn=divs[a].className;
				divs[a].className=cn.replace('ui-tabs-hide','');
			 alert("j:"+j+divs[j].className+"  a:"+a+divs[j].className);
            }
        }(i);
    }
}    







 addLoadEvent(tabchange);
addLoadEvent(immediately);

addLoadEvent(immediately2);
