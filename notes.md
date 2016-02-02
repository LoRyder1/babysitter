Cucumber is a tool used to implement a *Behavior Driven Design* workflow. BDD practioners like to use the terms *behaviour* and *expectation* rather than testing and test.

Where are tests located?
Cucumber divides test into two parts, the outward facing feature *'scenario'* steps and the inward facing *step 'definitions'*. Features are descriptions of *desired outcomes* (Then) following upon specific event (When) under predefined conditions (Given). Feature files are given the extension .feature. 
Step definitions, or stepdefs, are keyed by their snippets of text from the feature scenario statements adn invoke blocks of Ruby an Rails code.

Writing Tests?
Constructing tests or features begins with the question Where do I begin? It is important to write each test/feature scenario one stepdef at a time. Use plain language in the feature file. In the long run, the best results are achieved when you write feature statements adn step definitions incrementally, using the absolute minimum code to express the requirement. 

XP or *Extreme programming* methodology - intended to improve software quality and responsiveness to changing customer requirements. *YAGNI* or ("You aren't gonna need it") is a principle of XP that states a programmer should not add functionality until deemed necessary. YAGNI goes along with "do the simplest thing that could possibly work" *(DTSTTCPW)*. It is intended to be used along with other practices like: continuous refactoring, continuos refactoring, continuos automated unit testing, and continuous integration. Using it without continuous refactoring, it could lead to disorganized code adn massive rework. *Continuous integration* is the practice of merging all developer workign copies to a shared mainline several times a day. 

Avoiding diversion into coding adventures that technically interesting but financially pointless concentrates your limited resources on the tasks that count and measureably reduces teh overall complexity of the project. *Avoid featuritis:* If the user did not ask for it then exactly why are we writing it? Also, because you are continuously running your tests any forthcoming changes that break anything will be caught right away. 

As is the case with most professions, the real value that a skilled programmer provides lies not so much in knowing how to do something as in *knowing when and where it must be done.* The real challenge with maintaining code is simply discovering whih piece of code to change. Finding the exact spots in a application that needs attention is the biggest maintenance problem. 

When faced with two or more alternatives that deliver roughly the same value, take the path that *makes future change easier.* 

Cucumber is an *integration* test harness. It is designed to exercise teh entire applicaiton stack from the view down to the database

Cucumber tests are meant to test the system as the *user sees it*. Tests written in *RSpec* are generally meant to address the *system directly*, via its API, the way the developer sees it. The main weakness of Cucumber tests is that sometimes you are encouraged to write the acceptance tests at the same level of granularity that an analyst might write their acceptance criteria on a story card. You don't want very slow acceptance tests that don't necessarily match the functinality you've built

Cucumber tests can be extremely readable, they focus on high-level functionality and use domain-specific terms, it is a quick way to answere the "WHat does this app do again?"

Most folks think of testing as something you do after development is complete. But *TDD* is really more of a *design activity*; you are specifying how your APIs should work before you actually start coding.

*Testing pyramid: Acceptance Tests at the top, then Integration tests, and then Unit tests.*

The test pyramid is a concept in a book Succeeding with Agile. Its essential point is that you *should have many more low-level unit tests than high level end-to-end tests* running through a GUI. The Eye of Providence is at the top. 

Often organizaiton get trapped into creating 'inverted' pyramids of software testing - this resembles an *ice-cream cone.* So this would be the software testing *ice-cream cone(anti-pattern).* An anti-pattern is defined as a common response to a recurring problem that is usualy ineffective and risks being *highly counterproductive.* 

Ice-cream cone anti-pattern - Manual Tests at the top, automated GUI Tests, integration tests, and then Unit Tests at the bottom. 

Testing through the UI can be slow, increase build times, most importantly such tests are very *brittle.* An enhancement to the system can easily end up breaking lots of such tests, which then have to be re-recorded. *End to end* tests are more prone to *non-determinism problems.* Sometimes there is the problem of non-deterministic test - tests that sometimes fail and sometimes pass. 

A common problem is that sometimes programmers conflate end-to-end test, UI tests, and customer facing tests. These are all orthogonal characteristics. High level tests are there as a second line of test defense. If you get a failure there, you've got a bug in your functional code, you also have a missing unit test. Whenever yo fix a failing end-to-end test, you should be adding unit tests too.

*Acceptance Testing* - RSpec and Cucumber are both used. These tests are usually business-case driven Integration Tests, which mean they simulate the way a user uses the application and uses the full Rails stack so problems with the way the different parts of your application work together can be found in a way that unit testing will not find. 

Step Argument *transforms* help your step definitions be more *DRY* by allowing you to refactor common operations that you perform on step definition arguments.

*Mocking* is a technique in test-drive development (TDD) that involves using fake dependent objects or methods in order to write a test. 1) use as a replacement for objects that don't exist yet. 2) Working with objects which return a non-deterministic values 3) avoid setting up complex scheme of data or dependency  objects in order to write a test. 4) avoid invoking code which would degrade the performance of the test, while at the same time being unrelated to the test you are writing. So this would allow for testing what you mean to test and get rid of the dependencies. 

The dependent object needs to exist, but you are not currently working on it. By mocking objects you can focus on hte thing that you're working on at the moment. Instead of writing tests for an object with dependencies and then writing all code to get that test to pass. This can be distracting and may lead to poor code design decisions. Mocking helps you reduce the number of things we need to keep in our head at a given moment. 

*Code smell*, also known as bad smell refers to any symptom in the source code of a program that possibly indicates a deeper problem. Another way to look at the code smell or surface indication is with respect to principles and quality. Code smells are certain structures in the code that indicate violation of fundamental design principles and negatively impact design quality. 