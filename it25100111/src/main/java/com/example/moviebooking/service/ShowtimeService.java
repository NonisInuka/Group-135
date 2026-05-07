package com.example.moviebooking.service;

import com.example.moviebooking.model.Showtime;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ShowtimeService {

    private final List<Showtime> showtimes = new ArrayList<>();


    // ADD
    public String addShowtime(Showtime showtime) {

        showtimes.add(showtime);

        return "Showtime Added Successfully";
    }


    // GET ALL
    public List<Showtime> getAllShowtimes() {

        return showtimes;
    }


    // UPDATE
    public String updateShowtime(int id, Showtime updatedShowtime) {

        for (Showtime s : showtimes) {

            if (s.getId() == id) {

                s.setMovieName(updatedShowtime.getMovieName());
                s.setShowDate(updatedShowtime.getShowDate());
                s.setShowTime(updatedShowtime.getShowTime());
                s.setTheater(updatedShowtime.getTheater());
                return "Showtime Updated Successfully";
            }
        }

        return "Showtime Not Found";
    }


    // DELETE
    public String deleteShowtime(int id) {

        for (Showtime s : showtimes) {

            if (s.getId() == id) {

                showtimes.remove(s);

                return "Showtime Deleted Successfully";
            }
        }

        return "Showtime Not Found";
    }
}
