package bean;

public class StudyFile {
    private int seq_file;
    private int seq_post;
    private String file;

    public int getSeq_file() {
        return seq_file;
    }
    public void setSeq_file(int seq_file) {
        this.seq_file = seq_file;
    }
    public int getSeq_post() {
        return seq_post;
    }
    public void setSeq_post(int seq_post) {
        this.seq_post = seq_post;
    }
    public String getFile() {
        return file;
    }
    public void setFile(String file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "StudyFile{" +
                "seq_file=" + seq_file +
                ", seq_post=" + seq_post +
                ", file='" + file + '\'' +
                '}';
    }
}
