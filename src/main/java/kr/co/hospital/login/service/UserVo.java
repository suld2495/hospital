package kr.co.hospital.login.service;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;

public class UserVo {
    @NotEmpty
    @Pattern(regexp="^[a-zA-Z]+[a-zA-Z0-9]{5,19}$")
    private String id;

    @NotEmpty
    @Pattern(regexp="^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{6,20}$")
    private String password;
    private String name;
    private String phone;
    private String email;
    private String role;
    private String serviceYN;
    private String privacyYN;
    private String emailYN;
    private String smsYN;
    private String createdDate;
    private String accessDate;
    private String provider;
    private String uniqueId;

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getAccessDate() {
        return accessDate;
    }

    public void setAccessDate(String accessDate) {
        this.accessDate = accessDate;
    }

    public String getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getServiceYN() {
        return serviceYN;
    }

    public void setServiceYN(String serviceYN) {
        this.serviceYN = serviceYN;
    }

    public String getPrivacyYN() {
        return privacyYN;
    }

    public void setPrivacyYN(String privacyYN) {
        this.privacyYN = privacyYN;
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

    @Override
    public String toString() {
        return "UserVo{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                ", serviceYN='" + serviceYN + '\'' +
                ", privateYN='" + privacyYN + '\'' +
                ", emailYN='" + emailYN + '\'' +
                ", smsYN='" + smsYN + '\'' +
                '}';
    }
}
