package com.yolo.user.vo;

import org.springframework.social.google.api.plus.Person;

public class GoogleVO extends UserVO{

	private Person person;

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}
	
}
