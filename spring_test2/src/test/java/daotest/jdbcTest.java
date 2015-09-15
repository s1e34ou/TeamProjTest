package daotest;

import java.sql.Connection;
import java.sql.SQLException;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertThat;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.UsersDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class jdbcTest {
	private static Logger logger = LoggerFactory.getLogger(jdbcTest.class);

	@Autowired
	DataSource ds;
	
	@Autowired
	JdbcTemplate jdbcTemp;
	
	@Autowired
	NamedParameterJdbcTemplate npJdbcTemp;
//	
	@Autowired
	UsersDao dao;
//	
	@Test
	public void testDataSourceInit() throws SQLException {
		logger.trace("dataSource : {}",ds);
		assertThat(ds, is(not(nullValue())));
		Connection con= ds.getConnection();
		logger.trace("connection : {}",con);
		assertThat(con, is(not(nullValue())));
	}
	
	@Test
	public void testJdbcTemplateBean(){
		logger.trace("jdbc template : {}", jdbcTemp);
		assertThat(jdbcTemp, is(not(nullValue())));
		
		logger.trace("NamedParameterJdbctemplate : {}", npJdbcTemp);
		assertThat(npJdbcTemp, is(not(nullValue())));
	}
	
	@Test
	public void testUsersBean(){
		
		logger.trace("Usersdao: {}", dao);
		assertThat(dao, is(not(nullValue())));
	}

}
