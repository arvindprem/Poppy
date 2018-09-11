package com.ipsos.poppy.calendar;

public class CalendarDto {
	private int id;
	private String title;
	private String start;
	private String end;
	private String color;
	private String description;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "CalendarDto [id=" + id + ", title=" + title + ", start=" + start + ", end=" + end + ", color=" + color
				+ ", description=" + description + "]";
	}
}