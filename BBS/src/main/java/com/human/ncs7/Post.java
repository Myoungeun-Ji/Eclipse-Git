스크린샷(819).png
액세스 권한이 있는 사용자
공유되지 않음
시스템 속성
유형
이미지
크기
193KB
사용한 용량
193KB
위치
0118-파일
소유자
나
수정 날짜
오전 11:06에 내가 수정
열어 본 날짜
오후 10:53에 내가 열어 봄
생성 날짜
오후 5:22에 Google Drive Web 사용
설명 추가
뷰어가 다운로드할 수 있음
package com.human.ncs7;

//Date Transfer Object (DTO)
public class Post {
	private int id;
	private String name;
	private String title;
	private String content;
	private String created;
	private int hit;
	private int kind;
	private int step;
	private int indent;
	public Post(int id, String name, String title, String content, String created, int hit, int kind, int step,
			int indent) {
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.created = created;
		this.hit = hit;
		this.kind = kind;
		this.step = step;
		this.indent = indent;
	}
	public Post() { //기본생성자의 위치는 상관없다 제일 첫번째 괄호 안에만 있으면된다
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	
}