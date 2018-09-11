package com.ipsos.poppy.login;

public class LoginValidate {
	private String userName;
	private String enableCookies;
	private String watchWord;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEnableCookies() {
		return enableCookies;
	}

	public void setEnableCookies(String enableCookies) {
		this.enableCookies = enableCookies;
	}

	public String getWatchWord() {
		return watchWord;
	}

	public void setWatchWord(String watchWord) {
		this.watchWord = watchWord;
	}

	@Override
	public String toString() {
		return "LoginValidate [userName=" + userName + ", enableCookies=" + enableCookies + ", watchWord=" + watchWord
				+ "]";
	}

}
