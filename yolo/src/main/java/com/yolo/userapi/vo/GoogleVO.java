package com.yolo.userapi.vo;

import org.springframework.social.google.api.plus.Person;

import com.yolo.user.vo.UserVO;

public class GoogleVO extends UserVO{

	private Person person;

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}
	
}
