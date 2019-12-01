# Rails 6 Template

![](https://github.com/saturdaymp-examples/rails-templates/workflows/CI/badge.svg)
![](https://img.shields.io/gitlab/pipeline/saturdaymp/rails-templates?label=CI&logo=GitLab)

A template for starting a new Rails applications.  It includes a empty [Rails](https://rubyonrails.org/) 6.0 application, [Docker](https://www.docker.com/) image for development and production, [Sorbet](https://sorbet.org/) type checker, and a [GitLab](https://about.gitlab.com/) CI build.

Since it uses Docker the only thing you need installed on your development machine is Docker and your favorite Rails IDE.  No need to install Ruby, Yarn, etc.  Tested in my development environments of Ubuntu [18.04 LTS](http://releases.ubuntu.com/18.04/) and Macos [Mojave (10.14)](https://www.apple.com/ca/macos).

If you tried it and have any suggestions or imporvements please let know by opening an [issue](https://github.com/saturdaymp-examples/rails-templates/issues) or [pull request](https://github.com/saturdaymp-examples/rails-templates/pulls).

## Development Environment Setup

Assuming you have [Docker](https://www.docker.com/) installed you need too:

1) Click the "Use this Template" button.  Alternativly you can just fork or download the of the repository to you local machine.

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

4) Now run the tests.  There are currently no tests setup but this is a good smoke test to make sure everything is setup correcty:

```
rails test
```

5) Run the Sorbet type checker:

```
srb tc
```

6) Assuming there are no issues with the above exist the Docker container:

```
exit
```

7) Now test that the website will actually run.  On your host machine run 

```
docker-compose up web
```

Then open up your favorite browser and navigate to `localhost:3000` and you should see the home page.

### RubyMine IDE Setup
Open up the project in RubyMine then navigate to the Settings->Languages & Frameworks->[Ruby SDK and Gems](https://www.jetbrains.com/help/ruby/ruby-sdk-and-gems.html).  Then click the plus sign and add a new Remote Interperter.  Choose Docker Compose with the following settings:

```
Server: Docker (create a new one if emtpy)
Configuration file(s): ./docker-compose.yml
Service: web
Environment variables: <leave blank>
Ruby of version manager path: ruby
```

Now you should be able to run/debug the application.  If something is not working let me know by opening and [issue](https://github.com/saturdaymp-examples/rails-6-template/issues).

## CI

There is a base GitLab automated build [script](.gitlab-ci.yml) and GitHub Actions [script](https://github.com/saturdaymp-examples/rails-templates/blob/master/.github/workflows/ci.yml) included in this template.  It will build the docker image, run the [Sorbet](https://sorbet.org/) type checker, then run the tests.  You can see the GitLab build in action [here](https://gitlab.com/saturdaymp/rails-templates/pipelines).

Why GitLab and GitHub?  I use GitLab to store some of my private repos.
