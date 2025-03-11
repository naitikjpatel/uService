package com.grownited.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(RuntimeException.class)
    public ModelAndView handleRuntimeException(RuntimeException ex, Model model) {
        ModelAndView mav = new ModelAndView("ErrorPage"); // Redirect to errorPage.jsp
        mav.addObject("errorMessage", ex.getMessage());  // Pass error message to view
        return mav;
    }
}
