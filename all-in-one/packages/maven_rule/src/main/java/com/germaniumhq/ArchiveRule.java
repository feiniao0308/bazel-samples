package com.germaniumhq;

import org.apache.commons.compress.archivers.sevenz.SevenZArchiveEntry;
import org.apache.commons.compress.archivers.sevenz.SevenZOutputFile;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class ArchiveRule {
    public static void main(String[] args) throws IOException {
        Deque<String> parameters = new ArrayDeque<>(Arrays.asList(args));
        String outputFileName = readString(parameters);
        String commitVersion = readFileContent(parameters);
        List<String> inputFiles = new ArrayList<>(parameters);

        File outputFile = new File(outputFileName);

        try (SevenZOutputStream out = new SevenZOutputStream(
                    new SevenZOutputFile(outputFile))) {
            File commitInformation = new File("commit-info.txt");
            SevenZArchiveEntry commitInfoEntry = out.getOutputFile().createArchiveEntry(
                    commitInformation, commitInformation.getName());
            out.getOutputFile().putArchiveEntry(commitInfoEntry);

            IOUtils.write(String.format("Version: %s", commitVersion), out, "utf-8");

            out.getOutputFile().closeArchiveEntry();

            for (String fileName: inputFiles) {
                File file = new File(fileName);
                SevenZArchiveEntry entry = out.getOutputFile().createArchiveEntry(
                        file, file.getName());
                out.getOutputFile().putArchiveEntry(entry);

                try (InputStream fis = new FileInputStream(file)) {
                    IOUtils.copy(fis, out);
                }

                out.getOutputFile().closeArchiveEntry();
            }
        }
    }

    private static String readString(Deque<String> parameters) {
        return parameters.poll();
    }

    private static String readFileContent(Deque<String> parameters) throws IOException {
        if (parameters.isEmpty()) {
            throw new IllegalArgumentException("Unable to read parameters.");
        }

        try (InputStream is = new FileInputStream(parameters.poll())) {
            return IOUtils.toString(is, StandardCharsets.UTF_8);
        }
    }
}
