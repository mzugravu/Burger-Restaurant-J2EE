package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import extra.DatabaseConnection;

import models.Member;

public class MemberDAOImpl implements MemberDAO {
	private static Connection con;
	private static Statement st;
	private static PreparedStatement ps;
	private static ResultSet rs;
	private static String query;

	public MemberDAOImpl() {
		con = DatabaseConnection.getConnexion();
	}

	@Override
	public int verifyLogin(String email, String password) {
		try {
			ps = con.prepareStatement("SELECT * from users where mail=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next())
				return 1;
			else
				return 0;
		} catch (Exception e) {
			System.out.println("Connection error : verifyLogin");
		}
		return -1;
	}

	@Override
	public int addUser(Member user) {

		try {
			ps = con.prepareStatement(
					"INSERT INTO users (fullname,phone,mail, password, address,role) Values (?, ?, ?, ?,?,?)");
			ps.setString(1, user.getFullname());
			ps.setString(2, user.getPhone());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getPassword());
			ps.setString(6, user.getRole());

			int i = ps.executeUpdate();
			if (i > 0)
				return 1;
			else
				return 0;
		} catch (Exception e) {
			System.out.println("Connection error " + e);
		}
		return -1;
	}

	@Override
	public Member getUserById(int id) {
		try {
			query = "SELECT * from users where id=?";
			ps = con.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				Member user = new Member();
				user.setId(rs.getInt(1));
				user.setFullname(rs.getString(2));
				user.setPhone(rs.getString(3));
				user.setPassword(rs.getString(5));
				user.setRole(rs.getString(6));

				return user;
			} else {
				return null;
			}

		} catch (Exception e) {
			System.out.println("Error");
		}
		return null;
	}

	public static Member getUserByEmail(String email) {
		try {
			query = "SELECT * from users where mail=?";
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				Member user = new Member();
				user.setId(rs.getInt(1));
				user.setFullname(rs.getString(2));
				user.setPhone(rs.getString(3));
				user.setPassword(rs.getString(5));
				user.setRole(rs.getString(6));

				return user;
			} else {
				return null;
			}

		} catch (Exception e) {
			System.out.println("Error");
		}
		return null;
	}

	public static int updateUser(String fullname, String mail,String phone, String address){
			try{
					query="UPDATE users set mail=?,phone=?,address=? where fullname=?";
					ps=con.prepareStatement(query);
					ps.setString(1,mail);
					ps.setString(2,phone);
					ps.setString(3,address);
					ps.setString(4,fullname);
					int i = ps.executeUpdate();
					if (i > 0){
						return 1;
					}else{
						return 0;
					}
			}catch(Exception e){
					System.out.println("Error while updating"+e);
					return -1;
			}
	}


	public static Boolean userExists(String mail){
			try{
					query="SELECT * from users where mail=?";
					ps=con.prepareStatement(query);
					ps.setString(1,mail);
					rs=ps.executeQuery();
					if (rs.next()) {
							return true;
					}else{
							return false;
					}
			}catch(Exception e){
					System.out.println("Error while verifying the existence of the user: "+mail+" "+e);
					return null;
			}
	}

	public static String getRole(String mail){
			String result = "";
			try{
					query="SELECT role from users where mail=?";
					ps=con.prepareStatement(query);
					ps.setString(1,mail);
					rs=ps.executeQuery();
					if (rs.next()) {
							result = rs.getString("role");
							return result;
					}else{
							return result;
					}
			}catch(Exception e){
					System.out.println("Error while searching for role: "+mail+" "+e);
					return result;
			}
	}

	public static int changePassword(String mail,String password){
			try{
					query="UPDATE users set password=? where mail=?";
					ps=con.prepareStatement(query);
					ps.setString(1,password);
					ps.setString(2,mail);
					int i = ps.executeUpdate();
					if (i > 0){
						return 1;
					}else{
						return 0;
					}
			}catch(Exception e){
					System.out.println("Error while changing password"+e);
					return -1;
			}
	}

	public static int deleteAccount(String mail){
			try{
					query="DELETE FROM users WHERE mail=?";
					ps=con.prepareStatement(query);
					ps.setString(1,mail);
					int i = ps.executeUpdate();
					if (i > 0){
						return 1;
					}else{
						return 0;
					}
			}catch(Exception e){
					System.out.println("Error while deleting account"+e);
					return -1;
			}
	}

	public static Boolean passwordVerification(String mail, String pass){
			try{
					query="SELECT * FROM USERS WHERE mail=? AND password=?";
					ps=con.prepareStatement(query);
					ps.setString(1,mail);
					ps.setString(2,pass);
					rs=ps.executeQuery();
					if(rs.next()){
							return true;
					}else{
							return false;
					}
			}catch(Exception e){
					System.out.println("Error while verifying password for the user: "+mail+" :"+e);
					return null;
			}
	}

	@Override
	public int updateUser(Member user) {
		return 0;
	}

	@Override
	public int deleteUser(int id) {
		return 0;
	}

	@Override
	public int EmailExist(String email) {
		try {
			ps = con.prepareStatement("SELECT * from users where mail=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next())
				return 1;
			else
				return 0;
		} catch (Exception e) {
			System.out.println("connexion error");
		}

		return -1;
	}

	@Override
	public int verifyLoginAdmin(String email, String password) {
		try {
			ps = con.prepareStatement("SELECT * from users where mail=? and password=? And role='admin' ");
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next())
				return 1;
			else
				return 0;
		} catch (Exception e) {
			System.out.println("Connection error : verifyLogin");
		}
		return -1;
	}

}
