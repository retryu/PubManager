package com.servelet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.directwebremoting.json.types.JsonArray;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.groovy.JsonGroovyBuilder;

import com.model.WordEntity;
 

public class DictionaryServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8"); 
			System.out.print("get   Dictionay   Servlet");
			WordEntity  wordEntity=new  WordEntity("BACCHUS", "n.", 
					"definition",
					new  String[]{"IS public","That  for  devotions  paid  to  Bacchus","The  lictors  dare  to run  us in","And  resolutely"},
					"Jorace");
			PrintWriter  p=resp.getWriter();
			JSONObject  json=JSONObject.fromObject(wordEntity);
			
			p.print(Json2Html(json,wordEntity));
			System.out.println(json.toString());
			p.close();
	}
	
	public  String   Json2Html(JSONObject  json,WordEntity  wordEntity){
		String html="";
		html="<div  class=\"entry\">";
		html+="<h3  class=\"term\">"+json.getString("term")+"</h3>";
		html+="<div class=\"part\">"+json.getString("part")+"</div>";
		html+="<div  class=\"quote\">";
		for(int  i=0;i<wordEntity.getQuote().length;i++){
			html+="<div  class=\"quote-line\">"+wordEntity.getQuote()[i]+"</div>";
		}
		html+="</div>";
		html+="<div  class=\"quote-author\">"+wordEntity.getAuthor()+"</div>";
		
		
		return  html;
	}
}
