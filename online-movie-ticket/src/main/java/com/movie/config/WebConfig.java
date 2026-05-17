package com.movie.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig
        implements WebMvcConfigurer {

    @Override
    public void addInterceptors(

            InterceptorRegistry registry) {

        registry.addInterceptor(
                        new AdminInterceptor())

                .addPathPatterns(

                        // ADMIN ONLY

                        "/admin",

                        "/users/**",

                        "/showtimes/add",

                        "/showtimes/save",

                        "/showtimes/edit/**",

                        "/showtimes/update",

                        "/showtimes/delete/**",

                        "/bookings",

                        "/bookings/delete/**");
    }
}