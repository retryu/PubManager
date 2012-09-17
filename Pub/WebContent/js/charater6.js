	$(document).ready(function(){
			$('#letter-a ').click(function(){
						//		alert("text:"+$(this).text());
		$.get("http://localhost:8080/PubManager/dictionaryServlet",function(data){
		
		alert("test");
		});		
	
				// $.getJSON('http://localhost:8080/PubManager/dictionaryServlet',function(data){
					// alert("test  term:"+entry['term']);
					// $('#dictionary').empty();
// 	 			
					// $.each(data,function(entryIndex,entry){
						// var  html='<div  class="entry">';
						// html+='<h3  class="term">'+entry['term']+'</h3>';
						// html+='<div  class="part">'+entry['part']+'</div>';
						// html+='<div  class="definition">'+entry['definition']+"</div>";
						// if(entry['quote']){
							// html+='<div  class="quote">';
// 							
							// $.each(entry['quote'],function(lineIndex,line){
								// html+='<div  class="quote-line">'+line+"</div>";
							// });
							// html+="</div>";
						// };
// 						
						// if(entry['author']){
								// html+='<div  class="quote-author">'+entry['author']+'</div>';
							// }
// 
						// $('#dictionary').append(html);
						// html+='</div>';
// 						
					// });
// 					
// 					
				// });
			})

	});