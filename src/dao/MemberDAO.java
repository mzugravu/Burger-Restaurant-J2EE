package dao;

import models.Member;

public interface MemberDAO {

	public int verifyLogin(String email, String password);

	public int verifyLoginAdmin(String email, String password);

	public int addUser(Member user);

	public Member getUserById(int id);

	public int updateUser(Member user);

	public int deleteUser(int id);

	int EmailExist(String email);

}
