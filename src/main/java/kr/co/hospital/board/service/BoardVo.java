package kr.co.hospital.board.service;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class BoardVo {
    private Integer num;

    @NotEmpty
    @Length(min=2, max=200)
    private String subject;

    @NotEmpty
    @Length(min=2, max=50)
    private String writer;

    @NotEmpty
    private String contents;
    private String created_date;
    private String update_date;
    private String phone;
    private String phone1;
    private String phone2;
    private String phone3;
    private String email;
    private String email1;
    private String email2;
    private String email3;
    private String password;
    private String thumnail;
    private String real_thumnail;
    private String thumnail_path;
    private String attachfile_code;
    private String emailYN;
    private String smsYN;
    private String tableName;
    private String consultType;
    private String id;
    private String main_thumnail;
    private String real_main_thumnail_img;
    private int boardOrder;

    public String getReal_thumnail() {
        return real_thumnail;
    }

    public void setReal_thumnail(String real_thumnail) {
        this.real_thumnail = real_thumnail;
    }

    public String getReal_main_thumnail_img() {
        return real_main_thumnail_img;
    }

    public void setReal_main_thumnail_img(String real_main_thumnail_img) {
        this.real_main_thumnail_img = real_main_thumnail_img;
    }

    public String getMain_thumnail() {
        return main_thumnail;
    }

    public void setMain_thumnail(String main_thumnail) {
        this.main_thumnail = main_thumnail;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public int getBoardOrder() {
        return boardOrder;
    }

    public void setBoardOrder(int boardOrder) {
        this.boardOrder = boardOrder;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getConsultType() {
        return consultType;
    }

    public void setConsultType(String consultType) {
        this.consultType = consultType;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getPhone3() {
        return phone3;
    }

    public void setPhone3(String phone3) {
        this.phone3 = phone3;
    }

    public String getEmail1() {
        return email1;
    }

    public void setEmail1(String email1) {
        this.email1 = email1;
    }

    public String getEmail2() {
        return email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }

    public String getEmail3() {
        return email3;
    }

    public void setEmail3(String email3) {
        this.email3 = email3;
    }

    public String getEmailYN() {
        return emailYN;
    }

    public void setEmailYN(String emailYN) {
        this.emailYN = emailYN;
    }

    public String getSmsYN() {
        return smsYN;
    }

    public void setSmsYN(String smsYN) {
        this.smsYN = smsYN;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getThumnail() {
        return thumnail;
    }

    public void setThumnail(String thumnail) {
        this.thumnail = thumnail;
    }

    public String getThumnail_path() {
        return thumnail_path;
    }

    public void setThumnail_path(String thumnail_path) {
        this.thumnail_path = thumnail_path;
    }

    public String getAttachfile_code() {
        return attachfile_code;
    }

    public void setAttachfile_code(String attachfile_code) {
        this.attachfile_code = attachfile_code;
    }
}
