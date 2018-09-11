package com.ipsos.poppy.login;

public class RegisterDetails {
	private String email;
	private String confirmWatchWord;
	private String watchWord;
	private String userName;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getConfirmWatchWord() {
		return confirmWatchWord;
	}

	public void setConfirmWatchWord(String confirmWatchWord) {
		this.confirmWatchWord = confirmWatchWord;
	}

	public String getWatchWord() {
		return watchWord;
	}

	public void setWatchWord(String watchWord) {
		this.watchWord = watchWord;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "RegisterDetails [email=" + email + ", confirmWatchWord=" + confirmWatchWord + ", watchWord=" + watchWord
				+ ", userName=" + userName + "]";
	}
}
