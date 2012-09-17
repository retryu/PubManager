package com.model;

import java.util.Arrays;

public class WordEntity {
	String  term;
	String  part;
	String  definition;
	String author;
	String  [] quote;
	
	
	public WordEntity() {
	}
	public WordEntity(String term, String part, String definition,
			 String[] quote,String author) {
		super();
		this.term = term;
		this.part = part;
		this.definition = definition;
		this.author = author;
		this.quote = quote;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getDefinition() {
		return definition;
	}
	public void setDefinition(String definition) {
		this.definition = definition;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String[] getQuote() {
		return quote;
	}
	public void setQuote(String[] quote) {
		this.quote = quote;
	}
	@Override
	public String toString() {
		return "WordEntity [term=" + term + ", part=" + part + ", definition="
				+ definition + ", author=" + author + ", quote="
				+ Arrays.toString(quote) + "]";
	}
	 
}
