package elastic_spring.repository;

import elastic_spring.Document.Person;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface PersonRepository extends ElasticsearchRepository<Person, String> {
}
