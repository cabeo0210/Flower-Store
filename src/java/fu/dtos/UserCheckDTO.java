/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.dtos;

import java.io.Serializable;

public class UserCheckDTO implements Serializable{
    private String usernameErr,nameErr,passwordErr, confirmErr, duplicateUsername, upErr;

    public UserCheckDTO() {
    }

    public UserCheckDTO(String usernameErr, String nameErr, String passwordErr, String confirmErr, String duplicateUsername) {
        this.usernameErr = usernameErr;
        this.nameErr = nameErr;
        this.passwordErr = passwordErr;
        this.confirmErr = confirmErr;
        this.duplicateUsername = duplicateUsername;
    }

    public String getUsernameErr() {
        return usernameErr;
    }

    public void setUsernameErr(String usernameErr) {
        this.usernameErr = usernameErr;
    }

    public String getNameErr() {
        return nameErr;
    }

    public void setNameErr(String nameErr) {
        this.nameErr = nameErr;
    }

    public String getPasswordErr() {
        return passwordErr;
    }

    public void setPasswordErr(String passwordErr) {
        this.passwordErr = passwordErr;
    }

    public String getConfirmErr() {
        return confirmErr;
    }

    public void setConfirmErr(String confirmErr) {
        this.confirmErr = confirmErr;
    }

    public String getDuplicateUsername() {
        return duplicateUsername;
    }

    public void setDuplicateUsername(String duplicateUsername) {
        this.duplicateUsername = duplicateUsername;
    }

    public String getUpErr() {
        return upErr;
    }

    public void setUpErr(String upErr) {
        this.upErr = upErr;
    }
    
    
    
}
