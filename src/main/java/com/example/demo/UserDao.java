package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDao {

	Connection DBConnect() {
		
		Connection conn = null;
		
		try {
			//Class 객체를 이용해 mysql 드라이버를 찾는다.
			Class.forName("com.mysql.cj.jdbc.Driver");
			//Class.forName에서 드라이버를 찾으면 자동적으로 해당 드라이버로 DriverManager객체를 생성해준다.
			//DriverManager는 DB에 접속하여 DB 접속 정보(Connetion)을 얻어오는 getConnection 메서드를 제공.
			//url, user, password 순으로 파라미터를 받아 사용한다.
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board2?serverTimezone=UTC","root","");			
		} catch(ClassNotFoundException e1) {
			e1.printStackTrace(); 	
		} catch(SQLException e2) {
			e2.printStackTrace();
		}
		
		return conn;
	}
	
	public List<String> getUserIdList() { //아이디 리스트 
		List<String> userIdList = new ArrayList<String>();
		Connection conn = DBConnect();
		
		try {
			//PreparedStatement에 넘겨줄 sql문을 작성.
			String sql = "select * from t_user";
			
			// PreparedStatement는 DB와 자바간의 sql통로 역할을 한다. PreparedStatement를 이용해
			// DB에 sql문을 실행시킬수 있고 또 결과를 받아올 수 있다.
			PreparedStatement ps =conn.prepareStatement(sql);
			
			// PreparedStatement를 이용해 sql문을 수행하면 그 결과가 ResultSet이라는 객체에 담겨져 온다.
			// ResultSet은 결과를 어떻게 가져오고 가공할지에 대한 메서드들을 제공한다.
			ResultSet rs = ps.executeQuery();
			//ResultSet객체가 제공하는 next() 메서드는 자신이 가지고 있는 결과물을 처음부터 하나씩 탐색하여 결과물이 남아있으면
			//true 없으면 false를 리턴한다. next()메서드는 한번 수행할 때마다 가리키는 결과물이 직전 결과물에서 한칸씩 다음으로 이동한다.
			while(rs.next()) {
				//ResultSet의 getString()메서드는 DB의 컬럼명을 인자로 받아 해당 컬럼의 결과를 리턴해주는 메서드다.
				userIdList.add(rs.getString("loginId"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return userIdList;
	}
	

	// 회원가입
	void insertUser(String loginId, String loginPw, String userName) {
		
		PreparedStatement ps = null;
		Connection conn = DBConnect();
		String sql = "insert into t_user set loginId = ?, loginPw = ?, userName = ?, regDate = NOW()";

		try {
		
			ps = conn.prepareStatement(sql);
			ps.setString(1, loginId);
			ps.setString(2, loginPw);
			ps.setString(3, userName);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getloginIdCheck(String id){ //회원가입 아이디 중복검사
		
		
		Connection conn = DBConnect();
		int result = 0;
		String sql = "select count(loginId) from t_user where loginId = ?";
		
		
		try {

			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next()) {
	
				result = rs.getInt(1);
			}

		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getuserNameCheck(String name){ //회원가입 닉네임 중복검사
			
		Connection conn = DBConnect();
		int result = 0;
		String sql = "select count(userName) from t_user where userName = ?";
		
		
		try {

			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, name);

			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next()) {
	
				result = rs.getInt(1);
			}

		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public User getUserById(String id){ // 로그인을 위한.
		
		User u = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = DBConnect();
		String sql = "select * from t_user where loginId = ?";
		
		try {

			ps =conn.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			
			
			if(rs.next()) {
				
				u = new User();
				
				u.setLoginId(rs.getString("loginId"));
				u.setLoginPw(rs.getString("loginPw"));
				u.setUserName(rs.getString("userName"));
				u.setRegDate(rs.getString("regDate"));
			}

		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
	public String getUserNameById(String id){ //로그인후 유저명을 이용하여 로그인 화면 변경
		
		
		Connection conn = DBConnect();
		String result = "";
		String sql = "select userName from t_user where loginId = ?";
		
		
		try {

			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next()) {
				
				result = rs.getString("userName");
			}

		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
