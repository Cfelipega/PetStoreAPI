package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testPetStore() {
        return Karate.run("classpath:features/petstore.feature");
    }

}