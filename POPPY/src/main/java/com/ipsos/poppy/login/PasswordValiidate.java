@Documented
@Constraint(validatedBy = PasswordConstraintValidator.class)
@Target({ TYPE, FIELD, ANNOTATION_TYPE })
@Retention(RUNTIME)

package com.ipsos.poppy.login;

import javax.validation.Payload;

public @interface PasswordValiidate {
	
	String message() default "Invalid Password";
	 
    Class<?>[] groups() default {};
 
    Class<? extends Payload>[] payload() default {};

}
