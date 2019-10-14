# Rails 6 Template

A template for starting a new Rails 6 application.  The default settings are   Since it uses Docker the only thing you need installed on your machine, aside from Docker, is your IDE.

Created for for my development environment, which is outlined below.  If you tried it and have any suggestions or imporvements please let know by opening an [issue](https://github.com/saturdaymp-examples/rails-6-template/issues) or [pull request](https://github.com/saturdaymp-examples/rails-6-template/pulls).

## Development Environment Setup

Assuming you have [Docker](https://www.docker.com/) installed you need too:

1) Fork/Checkout of the repository to you local machine.

2) In the repository root directly run the below command build the Docker container:

```
docker-compose build
```

3) Once the container is built we need to initialize the database.  First run your new container:

```
docker-compose run web sh
```

The Docker image base is Alpine Linux so we use sh instead of bash.  Also when you first run this command it will pull down the Postgres Docker image.

Now that you are inside the Docker container create the test databases:

```
rails db:create
```

Now run the tests.  There are currently no tests setup but this is a good smoke test to make sure everything is setup correcty:

```
rails test
```

Assuming there are no issues with the above exist the Docker container:

```
exit
```

5) Now test that the website will actually run.  On your host machine run 

```
docker-compose up web
```

Then open up your favorite browser and navigate to `localhost:3000` and you should see the home page.
