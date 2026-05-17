package com.movie.util;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {

    // WRITE DATA

    public static void writeFile(
            String filePath,
            String data) {

        try {

            File file =
                    new File(filePath);

            // CREATE FILE IF NOT EXISTS

            if(!file.exists()) {

                file.getParentFile().mkdirs();

                file.createNewFile();
            }

            FileWriter writer =
                    new FileWriter(
                            file,
                            true);

            writer.write(
                    data + "\n");

            writer.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    // READ DATA

    public static List<String> readFile(
            String filePath) {

        List<String> lines =
                new ArrayList<>();

        try {

            File file =
                    new File(filePath);

            if(!file.exists()) {

                file.getParentFile().mkdirs();

                file.createNewFile();
            }

            BufferedReader reader =
                    new BufferedReader(
                            new FileReader(file));

            String line;

            while((line =
                    reader.readLine()) != null) {

                lines.add(line);
            }

            reader.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return lines;
    }

    // OVERWRITE FILE

    public static void overwriteFile(
            String filePath,
            List<String> dataList) {

        try {

            FileWriter writer =
                    new FileWriter(
                            filePath);

            for(String data :
                    dataList) {

                writer.write(
                        data + "\n");
            }

            writer.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}