package com.ipsos.poppy.filter;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.ipsos.poppy.login.PasswordValiidate;

public class PasswordConstraintValidator  ConstraintValidator<ValidPassword, String> {
 
    @Override
    public void initialize(PasswordValiidate arg0) {
    }
 
    @Override
    public boolean isValid(String password, ConstraintValidatorContext context) {
        PasswordValidator validator = new PasswordValidator(Arrays.asList(
           new LengthRule(8, 30), 
           new UppercaseCharacterRule(1), 
           new DigitCharacterRule(1), 
           new SpecialCharacterRule(1), 
           new NumericalSequenceRule(3,false), 
           new AlphabeticalSequenceRule(3,false), 
           new QwertySequenceRule(3,false),
           new WhitespaceRule()));
 
        RuleResult result = validator.validate(new PasswordData(password));
        if (result.isValid()) {
            return true;
        }
        context.disableDefaultConstraintViolation();
        context.buildConstraintViolationWithTemplate(
          Joiner.on(",").join(validator.getMessages(result)))
          .addConstraintViolation();
        return false;
    }
}