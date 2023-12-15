import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Main {
    public static void main(String[] args) {
        // Contoh penggunaan stream dari koleksi
        List<String> myList = Arrays.asList("a", "b", "c");

        System.out.println("Filter dan print elemen yang memiliki panjang lebih dari 1:");
        myList.stream()
              .filter(s -> s.length() > 1)
              .forEach(System.out::println);

        // Contoh penggunaan stream dari array
        int[] myArray = {1, 2, 3, 4, 5};

        System.out.println("Menghitung jumlah elemen dalam array:");
        int sum = Arrays.stream(myArray).sum();
        System.out.println(sum);

        // Contoh penggunaan stream dari nilai
        Stream<String> myStream = Stream.of("a", "b", "c");

        System.out.println("Filter dan print elemen yang memiliki panjang lebih dari 1:");
        myStream.filter(s -> s.length() > 1)
                .forEach(System.out::println);

        // Contoh penggunaan stream dari file
        Path path = Paths.get("path/to/file.txt");

        System.out.println("Membaca baris-baris dari file dan print:");
        try (Stream<String> lines = Files.lines(path)) {
            lines.forEach(System.out::println);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Contoh operasi-operasi pada stream
        System.out.println("Menggunakan operasi stream - misalnya, filtering, mapping, dan collecting:");
        List<String> resultList = myList.stream()
                                       .filter(s -> s.length() > 1)
                                       .map(String::toUpperCase)
                                       .collect(Collectors.toList());

        System.out.println(resultList);

        // Contoh operasi grouping pada stream
        System.out.println("Mengelompokkan berdasarkan panjang string:");
        Map<Integer, List<String>> groupedByLength = myList.stream()
                                                            .collect(Collectors.groupingBy(String::length));

        System.out.println(groupedByLength);
    }
}

