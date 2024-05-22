@ECHO OFF

REM Install dependencies
bundle install

REM Precompile assets
bundle exec rake assets:precompile

REM Migrate the database
bundle exec rake db:migrate
