package com.example.demo;


public class Service {

	UserDao dao = new UserDao();
	ArticleDao adao = new ArticleDao();
	
	public boolean loginCheck(String id, String pw) {
		
		User u = dao.getUserById(id);	
		
		if(u != null) {
			if(u.getLoginPw().equals(pw)){
				return true;
			}
		}
		
		return false;
	}
	// 아이디 중복체크
	public boolean getloginIdCheck(String id) {
		
		int result = dao.getloginIdCheck(id);	
		
		if(result == 0) {
				return true;
		}
		
		return false;
	}
	
	// 닉네임 중복체크
	public boolean getuserNameCheck(String name) {
		
		int result = dao.getuserNameCheck(name);	
		
		if(result == 0) {
				return true;
		}
		
		return false;
	}
	
	
	String getUserNameById(String id){
		
		return dao.getUserNameById(id);
	}
}
