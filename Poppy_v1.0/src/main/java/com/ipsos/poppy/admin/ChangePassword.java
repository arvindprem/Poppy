package com.ipsos.poppy.admin;

public class ChangePassword {
	private String userName;
	private String currentWatchWord;
	private String newWatchWord;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCurrentWatchWord() {
		return currentWatchWord;
	}

	public void setCurrentWatchWord(String currentWatchWord) {
		this.currentWatchWord = currentWatchWord;
	}

	public String getNewWatchWord() {
		return newWatchWord;
	}

	public void setNewWatchWord(String newWatchWord) {
		this.newWatchWord = newWatchWord;
	}

	@Override
	public String toString() {
		return "ChangePassword [userName=" + userName + ", currentWatchWord=" + currentWatchWord + ", newWatchWord="
				+ newWatchWord + "]";
	}

}
