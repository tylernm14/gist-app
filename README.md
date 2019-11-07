Gist project

Uses Ruby on Rails 5.2, Devise, and stimulusJS for dynamic DOM manipulation

To run locally for development

- `bundle install` install gems
- `yarn install` download javascript packages
- `bundle exec rake db:create db:migrate db:test:prepare` to do migrations
- `rail s` to start the development server


1. Go to "Sign Up" and create an account
2. Make a gist

Six character short URLs are made automatically for new gists, but a custom uri path can be choosen.
Gist index and gist show actions are public, while gist creation requires user account signup.

Rspecs are minimal but forthcoming

### Potential Addons

- Oauth
- JSON API
- Sorting filtering gists
- Gist permissions
