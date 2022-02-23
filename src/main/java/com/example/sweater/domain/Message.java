package com.example.sweater.domain;

import javax.persistence.*;

@Entity
public class Message {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	private String text;
	private String tag;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User author;

    private String filename;

	public Message(){
	}
	
	public Message(String text, String tag, User user) {
		this.author = user;
		this.text = text;
		this.tag = tag;
	}

	public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getAuthorName() {
		return author != null ? author.getUsername() : "<none>";
	}
	
	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}
	
	public Integer getId() {
		return id;
	}
	public String getText() {
		return text;
	}
	public String getTag() {
		return tag;
	}
}
