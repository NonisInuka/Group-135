package com.example.moviebooking.controller;

import com.example.moviebooking.model.Showtime;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/showtime")
public class ShowtimeController {

    private final String FILE_NAME = "showtimes.txt";

    @PostMapping
    public String addShowtime(@RequestBody Showtime showtime) {

        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME, true));

            writer.write(showtime.toString());
            writer.newLine();

             writer.close();

            return "Showtime Added Successfully";

        } catch (IOException e) {
            return "Error Saving Showtime";
        }
    }

    @GetMapping
    public List<String> getAllShowtimes() {

        List<String> showtimes = new ArrayList<>();

        try {
            BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME));

            String line;

            while ((line = reader.readLine()) != null) {
                showtimes.add(line);
            }

             reader.close();

        } catch (IOException e) {
            showtimes.add("Error Reading File");
        }

        return showtimes;
    }


    @PutMapping("/{id}")
    public String updateShowtime(@PathVariable int id,
                                 @RequestBody Showtime updatedShowtime) {

        List<String> updatedList = new ArrayList<>();
        boolean found = false;

        try {
            BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME));

            String line;

            while ((line = reader.readLine()) != null) {

                String[] data = line.split(",");

                int showId = Integer.parseInt(data[0]);

                if (showId == id) {

                    updatedList.add(
                            updatedShowtime.getId() + "," +
                                    updatedShowtime.getMovieName() + "," +
                                    updatedShowtime.getShowDate() + "," +
                                    updatedShowtime.getShowTime() + "," +
                                    updatedShowtime.getTheater()
                    );

                    found = true;

                } else {
                    updatedList.add(line);
                }
            }

             reader.close();

            BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME));

            for (String s : updatedList) {
                writer.write(s);
                writer.newLine();
            }

             writer.close();


        } catch (IOException e) {
            return "Error Updating Showtime";
        }

        if (found) {
            return "Showtime Updated Successfully";
        } else {
            return "Showtime Not Found";
        }
    }

    @DeleteMapping("/{id}")
    public String deleteShowtime(@PathVariable int id) {

        List<String> updatedList = new ArrayList<>();
        boolean found = false;

        try {
            BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME));

            String line;

            while ((line = reader.readLine()) != null) {

                String[] data = line.split(",");

                int showId = Integer.parseInt(data[0]);

                if (showId == id) {
                    found = true;
                } else {
                    updatedList.add(line);
                }
            }

            reader.close();

            BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME));

            for (String s : updatedList) {
                writer.write(s);
                writer.newLine();
            }

            writer.close();      

        } catch (IOException e) {
            return "Error Deleting Showtime";
        }

        if (found) {
            return "Showtime Deleted Successfully";
        } else {
            return "Showtime Not Found";
        }
    }



}

