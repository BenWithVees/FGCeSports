package com.markham.tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.joda.time.DateTime;

@Entity
@NamedQuery(name ="Articles.getArticles", query = "SELECT a FROM Articles a")
@Table(name = "articles")
public class Articles {

	@Id
	@Column(name = "id")
	private int id;

	@Column(name = "article_title")
	private String articleTitle;

	@Column(name = "article_thumbnail")
	private byte[] articleThumbnail;

	@Column(name = "author")
	private String author;

	@Column(name = "timestamp")
	private DateTime timestamp;

	@Column(name = "comments")
	private int comments;

	@Column(name = "body")
	private String body;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public byte[] getArticleThumbnail() {
		return articleThumbnail;
	}

	public void setArticleThumbnail(byte[] articleThumbnail) {
		this.articleThumbnail = articleThumbnail;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public DateTime getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(DateTime timestamp) {
		this.timestamp = timestamp;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

}
