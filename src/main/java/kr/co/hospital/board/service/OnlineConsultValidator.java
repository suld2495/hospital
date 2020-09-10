package kr.co.hospital.board.service;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class OnlineConsultValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object target, Errors errors) {
        BoardVo boardVo = (BoardVo) target;
        String password = boardVo.getPassword();

        if (password.isEmpty()) {
            errors.reject("emptyPassword", "emptyPassword");
        }
    }
}
