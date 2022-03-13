package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

	Connection DBConnect() {

		Connection conn = null;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board2?serverTimezone=UTC", "root", "");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e2) {
			e2.printStackTrace();
		}

		return conn;
	}
	//전체 공지사항 리스트
	public List<Admin> getAdminList() {
		List<Admin> AdminList = new ArrayList<Admin>();

		Connection conn = DBConnect();
		try {

			String sql = "select * from t_admin order by adminId desc";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Admin a = new Admin();
				a.setAdminId(rs.getInt("adminId"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setRegUser(rs.getString("regUser"));
				a.setRegDate(rs.getString("regDate"));

				AdminList.add(a);
			}
		} catch (SQLException e) {

			e.printStackTrace();

		}

		return AdminList;
	}
	
	//게시글 추가
	void insertAdmin(String title, String content, String regUser) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;

		String sql = "insert into t_admin set title = ?, content = ?, regUser = ?, regDate = now()";

		try {

			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, regUser);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//공지사항 내용 불러오기
	public Admin getAdminById(int adminId) {

		Admin a = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = DBConnect();
		
		String sql = "select * from t_admin where adminId = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setInt(1, adminId);

			rs = ps.executeQuery();

			if (rs.next()) {

				a = new Admin();

				a.setAdminId(rs.getInt("adminId"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setRegUser(rs.getString("regUser"));
				a.setRegDate(rs.getString("regDate"));
				a.setViews(rs.getInt("views"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return a;
	}
	// 공지사항 변경
	void updateAdmin(String title, String content, String regUser, int adminId) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;

		String sql = "update t_admin set title = ?, content = ?, regUser = ? where adminId = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, regUser);
			ps.setInt(4, adminId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 게시물 삭제
	void deleteAdmin(int adminId) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;

		String sql = "delete from t_admin where adminId = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setInt(1, adminId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 조회수 추가
	void updateAdminViews(int adminId) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;

		String sql = "UPDATE t_admin SET views = views + 1 WHERE adminId = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setInt(1, adminId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
