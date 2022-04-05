package karate.microservices.cyan.onboarding;

import com.intuit.karate.junit5.Karate;

class onBoardingRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("onBoarding").relativeTo(getClass());
    }

}
