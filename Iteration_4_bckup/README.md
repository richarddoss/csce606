# Ruby on Rails Tutorial sample application

# Polling-Management-system
CSCE 606 Project_by chaincoders!
In this project we are creating an online Polling system.
The contributers are classified into Adminstrators(aka Admin) and Audience.
The admin is the one hosting the survey. He/she will have the provision to login and add a question pertinent to the survey topic and will also have the privilege to provide the possible responses to that question.The details of the features privy to the admin are mentioned in the User story attached(as Xls document).
Once the Admin is done with the question the audience can then see that question and also the possible responses posted by the Admin and has the privilege to mark their choice.
A visualization feature is also provided for both the Admin and Audience for viweing the statistics of the survey.



## License
MIT OPENWARE

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).
