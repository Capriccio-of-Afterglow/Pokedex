package spring.mvc.pokedex.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import spring.mvc.pokedex.model.entity.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<User> findAllUsers() {
		String sql = "SELECT userId, userName, password, level FROM user";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
	}

	@Override
	public int addUser(User user) {
		final String sql = "insert into user(userName, password, level) values (?,?,?) ";

		KeyHolder keyHolder = new GeneratedKeyHolder();

		int rowsAffected = jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(java.sql.Connection connection)
					throws java.sql.SQLException {
				PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				ps.setInt(3, user.getLevel());
				return ps;
			}
		}, keyHolder);

		// Retrieve the generated key
		if (rowsAffected > 0) {
			user.setUserId(keyHolder.getKey().intValue());
		}

		return rowsAffected;
	}

	@Override
	public Boolean updateUserPassword(Integer userId, String newPassword) {
		String sql = "update user set password = ? where userId = ?";
		int rowcount = jdbcTemplate.update(sql, newPassword, userId);
		return rowcount > 0;

	}

	@Override
	public Boolean updateUserLevel(Integer userId, String newLevel) {
		String sql = "update user set level = ? where userId = ?";
		int rowcount = jdbcTemplate.update(sql, newLevel, userId);
		return rowcount > 0;
	}

	@Override
	public Optional<User> findUserByUsername(String userName) {
		String sql = "select userId, userName, password, level from user where username = ?";

		try {
			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), userName);
			return Optional.ofNullable(user);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	@Override
	public Optional<User> findUserById(Integer userId) {
		String sql = "select userId, username, password, level from user where userId = ?";
		try {
			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), userId);
			return Optional.ofNullable(user);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

}
