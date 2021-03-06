package com.folcike.gamepanelf;

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
            "/login/", "/registration/", "/webjars*", "/css*", "/img*", "/error", "/", "/adminservers/setupDone"
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
                response.sendRedirect("/panel");
                return false;
            }
            return true;
        }
        System.out.println(path);
        for (String excludedUrl : excludedUrls) {
            if ((excludedUrl.charAt(excludedUrl.length()-1) == '*' && path.startsWith(excludedUrl.substring(0, excludedUrl.length()-2))) || path.equals(excludedUrl))
                return true;
        }
        response.sendRedirect("/login/");
        return false;
    }
}
