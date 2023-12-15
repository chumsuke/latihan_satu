package kafka_spring.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Helloworld {

    @Autowired
    public void console_data() {
        System.out.println("print data dari service lain" );
    }
}
