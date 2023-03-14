/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ninhpd.registration;

import java.io.Serializable;

/**
 *
 * @author ACER
 */
public class RegistrationCreateError implements Serializable {

    private String usernameLengthError;
    private String passswordLengthError;
    private String fullnameLengthError;
    private String comfirmNotMatched;
    private String usernameIsExisted;

    public RegistrationCreateError() {
    }

    public RegistrationCreateError(String usernameLengthError, String passswordLengthError, String fullnameLengthError, String comfirmNotMatched, String usernameIsExisted) {
        this.usernameLengthError = usernameLengthError;
        this.passswordLengthError = passswordLengthError;
        this.fullnameLengthError = fullnameLengthError;
        this.comfirmNotMatched = comfirmNotMatched;
        this.usernameIsExisted = usernameIsExisted;
    }
    
    
    
    

    public String getUsernameLengthError() {
        return usernameLengthError;
    }

    public void setUsernameLengthError(String usernameLengthError) {
        this.usernameLengthError = usernameLengthError;
    }

    public String getPassswordLengthError() {
        return passswordLengthError;
    }

    public void setPassswordLengthError(String passswordLengthError) {
        this.passswordLengthError = passswordLengthError;
    }

    public String getFullnameLengthError() {
        return fullnameLengthError;
    }

    public void setFullnameLengthError(String fullnameLengthError) {
        this.fullnameLengthError = fullnameLengthError;
    }

    public String getComfirmNotMatched() {
        return comfirmNotMatched;
    }

    public void setComfirmNotMatched(String comfirmNotMatched) {
        this.comfirmNotMatched = comfirmNotMatched;
    }

    public String getUsernameIsExisted() {
        return usernameIsExisted;
    }

    public void setUsernameIsExisted(String usernameIsExisted) {
        this.usernameIsExisted = usernameIsExisted;
    }
    
    

}
