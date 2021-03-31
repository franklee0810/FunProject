package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Study;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.WishStudy;

@Component("wdao")
public class WishDao {
	private final String namespace = "MapperWish.";
	
	@Autowired
	SqlSessionTemplate abcd;

	public void InsertWishList(WishStudy wishStudy) {
		System.out.println(getClass() + " InsertWishList");
		this.abcd.insert(namespace + "InsertWishList", wishStudy);
	}

	public List<Study> SelectList(String mid) {
		System.out.println(getClass() + " SelectList");
		return this.abcd.selectList(namespace+"SelectList",mid);
	}

	public int DeleteWishList(String mid, int seq_study) {
		System.out.println(getClass() + " DeleteWishList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_study", seq_study);
		return this.abcd.delete(namespace+"DeleteWishList",map);
	}

	public WishStudy SelectListCheck(String mid, int seq_study) {
		System.out.println(getClass() + " SelectListCheck");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("seq_study", seq_study);
		return this.abcd.selectOne(namespace+"SelectListCheck",map);
	}
}
