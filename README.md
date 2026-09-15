# Usage
Create `config.yml` from `config.yml.sample` and fill in the Jira and Poker
credentials, URLs, and issue filter.

## Docker Compose

Build and run from the project directory (Ruby 4.0.6 and gems are installed
inside the image):

```sh
docker compose run --build --rm create-battle
```

For subsequent runs:

```sh
docker compose run --rm create-battle
```

## Local Ruby

Use Ruby 4.0.6

Install bundler and get required gems
```
  gem install bundler && bundle
```

Run main script
```
  bundle exec ruby ./create_battle.rb
```

Script should return a link to the battle

# Coming soon...
* set sp option - set storypoints to jira tickets and translate them to state from config
* add diff - add missing tickets to created battle
