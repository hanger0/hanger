package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.vo.User;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class JoinDao {
	private JdbcTemplate jtp ;
	private String sql ;
	
	public JoinDao() {
	}
	
	public JoinDao(JdbcTemplate jtp, String sql) {
		this.jtp = jtp ;
		this.sql = sql ;
	}
	
	@SuppressWarnings("unchecked")
	public User executeLogin(Object [] paramArr) {
		List<User> userList = jtp.query(sql, paramArr, new RowMapper(){
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setId(rs.getString("ID"));
				user.setPw(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setAge(rs.getInt("Age"));
				user.setJumin(rs.getInt("JUMIN"));
				user.setAddr1(rs.getString("ADDR1"));
				user.setAddr2(rs.getString("ADDR2"));
				user.setPostCode1(rs.getString("POSTCODE1"));
				user.setPostCode2(rs.getString("POSTCODE2"));
				
				return user ;
			}
		});
		
		return (userList.size()>0) ? userList.get(0) : null ;
	}
}