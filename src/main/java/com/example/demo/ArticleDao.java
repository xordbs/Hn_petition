package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ArticleDao {

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
	//인기 게시물 리스트
	public List<Article> getArticleVeiwsList() {
		List<Article> ArticleViewsList = new ArrayList<Article>();

		Connection conn = DBConnect();
		try {

			String sql = "select * from t_article order by views desc";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Article a = new Article();
				a.setArticleId(rs.getInt("articleId"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setRegUser(rs.getString("regUser"));
				a.setRegDate(rs.getString("regDate"));
				a.setViews(rs.getInt("views"));
				a.setLimitDate(rs.getString("limitDate"));

				ArticleViewsList.add(a);
			}
		} catch (SQLException e) {

			e.printStackTrace();

		}

		return ArticleViewsList;
	}
	// 만료된 게시글
	public List<Article> getArticleLimitList() {
		List<Article> ArticleLimitList = new ArrayList<Article>();

		Connection conn = DBConnect();
		try {

			String sql = "select * from t_article where limitDate <= now();";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Article a = new Article();
				a.setArticleId(rs.getInt("articleId"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setRegUser(rs.getString("regUser"));
				a.setRegDate(rs.getString("regDate"));
				a.setViews(rs.getInt("views"));
				a.setLimitDate(rs.getString("limitDate"));

				ArticleLimitList.add(a);
			}
		} catch (SQLException e) {

			e.printStackTrace();

		}

		return ArticleLimitList;
	}
	
	// 진행중인 게시물
	public List<Article> getArticleProgressList() {
		List<Article> ArticleProgressList = new ArrayList<Article>();

		Connection conn = DBConnect();
		try {

			String sql = "select * from t_article where limitDate > now();";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Article a = new Article();
				a.setArticleId(rs.getInt("articleId"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setRegUser(rs.getString("regUser"));
				a.setRegDate(rs.getString("regDate"));
				a.setViews(rs.getInt("views"));
				a.setLimitDate(rs.getString("limitDate"));

				ArticleProgressList.add(a);
			}
		} catch (SQLException e) {

			e.printStackTrace();

		}

		return ArticleProgressList;
	}
	
	//조회수 top 5
	public List<Article> getArticleTopList() {
		List<Article> ArticleTopList = new ArrayList<Article>();

		Connection conn = DBConnect();
		try {

			String sql = "select * from t_article order by views desc limit 5";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Article a = new Article();
				a.setArticleId(rs.getInt("articleId"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setRegUser(rs.getString("regUser"));
				a.setRegDate(rs.getString("regDate"));
				a.setViews(rs.getInt("views"));

				ArticleTopList.add(a);
			}
		} catch (SQLException e) {

			e.printStackTrace();

		}

		return ArticleTopList;
	}
	
	//게시글 추가
	void insertArticle(String title, String content, String regUser) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		cal.setTime(time);
		cal.add(Calendar.DATE, 7);
		String sql = "insert into t_article set title = ?, content = ?, regUser = ?, regDate = ?, views = ?, limitDate = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, regUser);
			ps.setString(4, format1.format(time));
			System.out.println(format1.format(time));
			ps.setInt(5, 0);
			ps.setString(6, format1.format(cal.getTime()));
			System.out.println(format1.format(cal.getTime()));
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//게시글 내용 불러오기
	public Article getArticleById(int articleId) {

		Article a = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = DBConnect();
		
		String sql = "select * from t_article where articleId = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setInt(1, articleId);

			rs = ps.executeQuery();

			if (rs.next()) {

				a = new Article();

				a.setArticleId(rs.getInt("articleId"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setRegUser(rs.getString("regUser"));
				a.setRegDate(rs.getString("regDate"));
				a.setViews(rs.getInt("views"));
				a.setLimitDate(rs.getString("limitDate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return a;
	}
	// 게시물 변경
	void updateArticle(String title, String content, String regUser, int articleId) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;

		String sql = "update t_article set title = ?, content = ?, regUser = ? where articleId = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, regUser);
			ps.setInt(4, articleId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 게시물 삭제
	void deleteArticle(int articleId) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;

		String sql = "delete from t_article where articleId = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setInt(1, articleId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 댓글 보기
	public List<Article> getArticleReplyList(int articleId) {
		List<Article> ArticleReplyList = new ArrayList<Article>();
		
		Article a = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = DBConnect();
		
		try {

			String sql = "SELECT * FROM articleReply WHERE articleId = ? GROUP BY regDate DESC";
		
			ps = conn.prepareStatement(sql);
			ps.setInt(1, articleId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				a = new Article();
				a.setId(rs.getInt("id"));
				a.setRegDate(rs.getString("regDate"));
				a.setArticleId(rs.getInt("articleId"));
				a.setUserName(rs.getString("userName"));
				a.setBody(rs.getString("body"));

				ArticleReplyList.add(a);
			}
		} catch (SQLException e) {

			e.printStackTrace();

		}

		return ArticleReplyList;
	}
	// 댓글 추가
	void insertArticleReply(int articleId, String userName, String body) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;

		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String sql = "insert into articleReply set regDate = ?, articleId = ?, userName = ?, body = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setString(1, format1.format(time));
			ps.setInt(2, articleId);
			ps.setString(3, userName);
			ps.setString(4, body);
			

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 조회수 추가
	void updateView(int articleId) {
		Connection conn = DBConnect();
		PreparedStatement ps = null;

		String sql = "UPDATE t_article SET views = views + 1 WHERE articleId = ?";

		try {

			ps = conn.prepareStatement(sql);
			ps.setInt(1, articleId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 내가 쓴 게시물 보기
	public List<Article> getArticleMyPostList(String regUser) {
		List<Article> ArticleMyPostList = new ArrayList<Article>();
		
		Article a = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = DBConnect();
		
		try {

			String sql = "SELECT * FROM t_article WHERE regUser = ? GROUP BY regDate DESC";
		
			ps = conn.prepareStatement(sql);
			ps.setString(1, regUser);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				a = new Article();
				a.setArticleId(rs.getInt("articleId"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setRegUser(rs.getString("regUser"));
				a.setRegDate(rs.getString("regDate"));
				a.setViews(rs.getInt("views"));
				a.setLimitDate(rs.getString("limitDate"));
				ArticleMyPostList.add(a);
			}
		} catch (SQLException e) {

			e.printStackTrace();

		}
		
		return ArticleMyPostList;
	}


}
