package com.folcike.gamepanelf;

import com.folcike.gamepanelf.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Configuration
public class AuthInterceptor implements HandlerInterceptor {

    private static String[] excludedUrls = new String[]{
            "login", "registration", "webjars", "css", "img", "error"
    };
    private final HttpSession session;

    @Bean
    @Autowired
    public static AuthInterceptor create(HttpSession session){
        return new AuthInterceptor(session);
    }

    public AuthInterceptor(HttpSession session){
        this.session = session;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        String path = request.getRequestURI();
        Object user = session.getAttribute("user");
        if (user != null){
            if (path.contains("login") || path.contains("registration")){
                response.sendRedirect("/");
                return false;
            }
            return true;
        }
        for (String excludedUrl : excludedUrls) {
            if (path.contains(excludedUrl))
                return true;
        }
        response.sendRedirect("/login/");
        return false;
    }
}
