package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("sfdao")
public class ShareFileDao {
	private final String namespace = "MapperShare.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	
}
