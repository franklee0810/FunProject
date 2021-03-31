package bean;

import java.util.Date;

public class Alram {
    private long seq_alram;
    private String mid;
    private String studyname;
    private String content;
    private Date created_at;
    private Date read_at;

    public Alram() {
    }

    public Alram(long seq_alram, String mid, String studyname, String content, Date created_at, Date read_at) {
        this.seq_alram = seq_alram;
        this.mid = mid;
        this.studyname = studyname;
        this.content = content;
        this.created_at = created_at;
        this.read_at = read_at;
    }

    public long getSeq_alram() {
        return seq_alram;
    }

    public void setSeq_alram(long seq_alram) {
        this.seq_alram = seq_alram;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getStudyname() {
        return studyname;
    }

    public void setStudyname(String studyname) {
        this.studyname = studyname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getRead_at() {
        return read_at;
    }

    public void setRead_at(Date read_at) {
        this.read_at = read_at;
    }
}
