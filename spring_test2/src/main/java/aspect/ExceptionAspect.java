package aspect;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class ExceptionAspect {
private static Logger logger = LoggerFactory.getLogger(ExceptionAspect.class);

	@AfterThrowing(value="execution(* *..*ServiceImpl.*(..))",throwing="exception")
	public void exceptionThrow(JoinPoint jp,Exception exception){
		logger.trace("예외발생 : ",exception);
	}
	
}
