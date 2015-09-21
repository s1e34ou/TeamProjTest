package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import dto.Users;

@Repository
public class UsersDaoImpl implements UsersDao {

	@Autowired
	JdbcTemplate jdbcTemp;

	@Autowired
	NamedParameterJdbcTemplate npJdbcTemp;

	private RowMapper<Users> getUsersRowMapper() {
		return new RowMapper<Users>() {
		
			
			@Override
			public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
				Users users = new Users();
				users.setUsersId(rs.getString("users_id"));
				users.setUsersName(rs.getString("users_name"));
				users.setUsersPassword(rs.getString("users_password"));
				users.setUsersAddress(rs.getString("users_address"));
				users.setUsersBirth(rs.getDate("users_birth"));
				users.setUsersEmail(rs.getString("users_email"));
				users.setUsersPhone(rs.getString("users_phone"));
				users.setUsersGender(rs.getString("users_gender"));
				users.setUsersPassques(rs.getString("users_passques"));
				return users;
			}
		};
	}
	
	@Override
	public void insertUser(Users users) {
		String sql = "insert into users values(?,?,?,?,?,?,?,?,?)";
		jdbcTemp.update(sql, users.getUsersName(), users.getUsersId(), users.getUsersPassword(),users.getUsersGender(), users.getUsersPhone(),
				users.getUsersEmail(),users.getUsersAddress(), users.getUsersBirth(),users.getUsersPassques());
	}

	@Override
	public void updateUser(Users users) {
		String sql = "update users set users_password=?, users_address=?, users_birth=?, users_gender=?, users_phone=?, users_email=? where users_id=?";
		jdbcTemp.update(sql, users.getUsersPassword(), users.getUsersAddress(), users.getUsersBirth(), users.getUsersGender(),
				users.getUsersPhone(), users.getUsersEmail(), users.getUsersId());
	}

	@Override
	public void deleteUser(String usersId) {
		String sql = "delete from users where users_id=?";
		jdbcTemp.update(sql,usersId);
		
	}

	@Override
	public Users selectUser(String usersId) {
		String sql = "select * from users where users_id=?";
		Users users = jdbcTemp.queryForObject(sql, getUsersRowMapper(), usersId);
		return users;
	}

	@Override
	public Users findUser(String usersEmail) {
		String sql = "select * from users where users_email=?";
		Users users = jdbcTemp.queryForObject(sql, getUsersRowMapper(), usersEmail);
		return users;
	}


}
