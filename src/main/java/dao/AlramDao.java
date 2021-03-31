package dao;

import bean.Alram;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("adao")
public class AlramDao {
    private final String namespace = "NsAlram.";

    @Autowired
    SqlSessionTemplate abcd;

    public void InsertJoinAlram(String mid, String subject, String content) {
        System.out.println(getClass() + " InsertJoinAlram");
        Alram alram = new Alram();
        alram.setMid(mid);
        alram.setStudyname(subject);
        alram.setContent(content);
        abcd.insert(namespace + "InsertJoinAlram", alram);
    }

    public List<Alram> SelectAlramById(String mid) {
        System.out.println(getClass() + " SelectAlramById");
        return this.abcd.selectList(namespace + "SelectAlramById", mid);
    }
}
