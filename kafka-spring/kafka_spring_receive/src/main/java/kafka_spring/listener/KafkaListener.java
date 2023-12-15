package kafka_spring.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KafkaListener {


    @org.springframework.kafka.annotation.KafkaListener(topics = "seafalcon-data-raw", groupId = "group_id")
    public void consume(String message) {
        System.out.println("Data Awal : " + message + "\n");
        console_data(message);
    }

    public void console_data(String data) {
        System.out.println("Mengmbil data " + data );
    }
}


