package karate.microservices.cyan.onboarding.onboarding;

import com.intuit.karate.junit5.Karate;

class whiteListRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("whiteList").relativeTo(getClass());
    }

}