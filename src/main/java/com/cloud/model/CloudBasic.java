package com.cloud.model;

public class CloudBasic {

	private String greeting;

	public String getGreeting() {
		return greeting;
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CloudBasic [greeting=").append(greeting).append("]");
		return builder.toString();
	}

}
