package com.sp.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.ExceptionTranslationFilter;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;

import com.sp.app.security.AjaxSessionTimeoutFilter;
import com.sp.app.security.LoginFailureHandler;
import com.sp.app.security.LoginSuccessHandler;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig {
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    	// configure HTTP security
    	
    	// ?continue 제거를 위해
    	HttpSessionRequestCache requestCache = new HttpSessionRequestCache();
    	requestCache.setMatchingRequestParameterName(null);
    	
    	String[] excludeUri = {
    			"/", "/login", "/logout",
    			"/dist/**",
    			"/favicon.ico",
    			"/WEB-INF/views/**"
    			};
    	
    	// Spring Security 6.1.0부터는 메서드 체이닝의 사용을 지양하고 
    	//     람다식을 통해 함수형으로 설정하게 지향하고 있다.
    	http.cors(Customizer.withDefaults())  // CORS 설정: 기본값 사용
    		.csrf(AbstractHttpConfigurer::disable) // CSRF 비활성화
    		.requestCache(request -> request.requestCache(requestCache))  // 요청 캐시 설정, ?continue 제거
    		.headers(headers -> headers
    			.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable)); 
    					// X-Frame-Options 비활성화(<iframe>으로 로드할 수 있도록 설정). 스마트에디터
    	 	
        http
        	.authorizeHttpRequests( authorize ->  authorize
        		.requestMatchers(excludeUri).permitAll()
        		.requestMatchers("/project/**").hasAnyRole("PROJECT", "ADMIN")
        		.requestMatchers("/emp/**").hasAnyRole("HRM", "ADMIN")
    			.requestMatchers("/**").hasAnyRole("EMP", "HRM", "PROJECT", "ADMIN")   // 모든 메뉴
                .anyRequest().authenticated() // 설정 외 모든 요청은 권한과 무관하고 로그인 유저만 사용
        	)
        	.formLogin(login -> login
                .loginPage("/")
                .loginProcessingUrl("/login")
                .usernameParameter("empCode")
                .passwordParameter("empPwd")
                .successHandler(loginSuccessHandler())
                .failureHandler(loginFailureHandler())
                .permitAll()
        	)
        	.logout(logout -> logout
        		.logoutUrl("/logout")
        		.invalidateHttpSession(true)
        		.deleteCookies("JSESSIONID")
        		.logoutSuccessUrl("/")
        	)
        	.addFilterAfter(ajaxSessionTimeoutFilter(), ExceptionTranslationFilter.class)
        	.sessionManagement(management -> management
        		.maximumSessions(1)
        		.expiredUrl("/expired"));

        // 인증 거부 관련 처리
        http.exceptionHandling((exceptionConfig)-> exceptionConfig.accessDeniedPage("/noAuthorized"));

        return http.build();
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    LoginSuccessHandler loginSuccessHandler() {
    	LoginSuccessHandler handler = new LoginSuccessHandler();
    	handler.setDefaultUrl("/main");
    	return handler;
    }

    @Bean
    LoginFailureHandler loginFailureHandler() {
    	LoginFailureHandler handler = new LoginFailureHandler();
    	handler.setDefaultFailureUrl("?login_error");
    	return handler;
    }

    @Bean
    AjaxSessionTimeoutFilter ajaxSessionTimeoutFilter() {
    	AjaxSessionTimeoutFilter filter = new AjaxSessionTimeoutFilter();
    	filter.setAjaxHeader("AJAX");
    	return filter;
    }
}
