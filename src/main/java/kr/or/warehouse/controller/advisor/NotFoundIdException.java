package kr.or.warehouse.controller.advisor;

public class NotFoundIdException extends Exception{
	public NotFoundIdException() {
		super("사번이 존재하지 않습니다.");
	}
}
