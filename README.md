# The Creem

A recruitment application for the hospitality industry, better connecting staff to employers.


#### Running the app

note: Postgres will need to be running.

```
bower install

npm install

rake db:create # first time only

rake db:migrate

foreman start -f Procfile.dev
```

#### Development

Follow conventions demonstrated in this [Angular Styleguide](https://github.com/johnpapa/angular-styleguide/blob/master/a1/README.md)

Follow conventions demonstrated in this [Ruby Styleguide](https://github.com/bbatsov/ruby-style-guide)

#### Deployment to Heroku
Heroku-cli must be configured:
```
heroku login
git remote add heroku git@heroku.com:<repository>.git
```
The [NodeJs buildpack](https://github.com/heroku/heroku-buildpack-nodejs) is required.

`heroku buildpacks:add --index 1 https://github.com/heroku/heroku-buildpack-nodejs`

In the dynos the gulp one should be on ON

The environment vars required are the ones for the database

The postgres add-on is needed

To push:

`git push heroku <branch-name>:master`
