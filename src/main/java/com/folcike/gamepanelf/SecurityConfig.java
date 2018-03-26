package com.folcike.gamepanelf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    JdbcTemplate dataSource;

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {

        auth.jdbcAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance()).dataSource(dataSource.getDataSource())
                .usersByUsernameQuery(
                        "select username,password, 1 as enabled from user where username=?")
                .authoritiesByUsernameQuery(
                        "select username, role from user where username=?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/login*","/home","/img/**").permitAll()
                .antMatchers("/**").authenticated()
                .and()
                .formLogin()//.loginPage("/login").failureUrl("/login?error")
                .usernameParameter("username").passwordParameter("password")
                .and()
                .logout().logoutSuccessUrl("/login?logout")
                .and()
                .exceptionHandling().accessDeniedPage("/403")
                .and()
                .csrf();
    }
}