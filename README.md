# Rails 6 Template

![](https://github.com/saturdaymp-examples/rails-templates/workflows/CI/badge.svg)
![](https://img.shields.io/gitlab/pipeline/saturdaymp/rails-templates?label=CI&logo=GitLab)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)
[![Maintainability](https://api.codeclimate.com/v1/badges/0544e77a39fa76f33255/maintainability)](https://codeclimate.com/github/saturdaymp-examples/rails-templates/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/0544e77a39fa76f33255/test_coverage)](https://codeclimate.com/github/saturdaymp-examples/rails-templates/test_coverage)

A template for starting a new Rails applications.  It includes:
 - [Rails](https://rubyonrails.org/) 6.0 application
 - [Docker](https://www.docker.com/) image for development and production
 - [RuboCop Standard](https://github.com/testdouble/standard) linter
 - [Sorbet](https://sorbet.org/) type checking
 - [GitLab](https://about.gitlab.com/) and [GitHub Actions](https://github.com/features/actions) CI build scripts

Since it uses Docker the only thing you need installed on your development machine is Docker and your favorite Rails IDE.  No need to install Ruby, Yarn, etc.  Tested in my development environments of Ubuntu [18.04 LTS](http://releases.ubuntu.com/18.04/) and Macos [Mojave (10.14)](https://www.apple.com/ca/macos).

If you tried it and have any suggestions or imporvements please let know by opening an [issue](https://github.com/saturdaymp-examples/rails-templates/issues) or [pull request](https://github.com/saturdaymp-examples/rails-templates/pulls).

## Development Environment Setup

Assuming you have [Docker](https://www.docker.com/) installed you get up and running by following the below steps:

1) Click the "Use this Template" button.  Alternativly you can just fork or download the of the repository to you local machine.

2) In the repository root directly run the below command build the Docker container:

```
docker-compose build
```

3) Run the continer.  The Docker image base is [Ruby](https://hub.docker.com/_/ruby) [Alpine](https://alpinelinux.org/) Linux so we use sh instead of bash.  Also when you first run this command it will pull down the Postgres Docker image.

```
docker-compose run web sh
```

4) Create the database

```
rails db:create
```

5) In a web brower navigate to http://localhost:3000 and you should see the home page.


I would also recommend running the following linter, typechecker, and unit tests.  All the command should be run in the Docker container and should return no errors:

1) [RuboCop Standard](https://github.com/testdouble/standard) linter:

```
rake standard
```

2) [Sorbet](https://sorbet.org/) type checking:

```
srb tc
```

3) Rails [unit tests](https://guides.rubyonrails.org/testing.html):

```
rails db:test:prepare
rails test
```

If you run into any issues or have any questions let me know by opening an [issue](https://github.com/saturdaymp-examples/rails-templates/issues).

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
