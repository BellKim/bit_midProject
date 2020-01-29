package main;

import java.io.Serializable;

public class MovieVo implements Serializable{

	private String title;
	private int like;
	
	public MovieVo() {
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	@Override
	public String toString() {
		return "MovieVo [title=" + title + ", like=" + like + "]";
	}
	
	
}
