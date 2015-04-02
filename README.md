### How to run

```
$ git checkout setup
$ bundle
$ bin/rake db:create
$ bin/rake db:migrate
```

To make sure everything worked you can run the tests:

```
$ bin/rake
```

To apply the foreign key migration:

```
$ git checkout fk_migration
$ bin/rake db:migrate
```

To bring the test database up-to-date you can run the tests:

```
$ bin/rake
```


### Observed Behavior

With a simple test printing the foreign-key definitions:

```ruby
require 'test_helper'

class ForeignKeyTest < ActiveSupport::TestCase
  test "foreign key" do
    p ActiveRecord::Base.connection.foreign_keys("articles")
  end
end
```

This is my output when generating the migration:

```
$ bin/rails g migration add_foreign_key_to_articles
      invoke  active_record
      create    db/migrate/20150402074709_add_foreign_key_to_articles.rb
$ bin/rake
rake aborted!
ActiveRecord::PendingMigrationError:

Migrations are pending. To resolve this issue, run:

	bin/rake db:migrate RAILS_ENV=test

/Users/senny/Projects/playground/ruby/rails/fk_migrations/test/test_helper.rb:3:in `<top (required)>'
/Users/senny/Projects/playground/ruby/rails/fk_migrations/test/controllers/articles_controller_test.rb:1:in `require'
/Users/senny/Projects/playground/ruby/rails/fk_migrations/test/controllers/articles_controller_test.rb:1:in `<top (required)>'
Tasks: TOP => test:run
(See full trace by running task with --trace)
$ bin/rake db:migrate
== 20150402074709 AddForeignKeyToArticles: migrating ==========================
-- add_foreign_key("articles", "authors", {:name=>"articles_author_id_fk", :on_delete=>:cascade})
   -> 0.0092s
== 20150402074709 AddForeignKeyToArticles: migrated (0.0093s) =================

$ bin/rake
Run options: --seed 5548

# Running:

.......[#<struct ActiveRecord::ConnectionAdapters::ForeignKeyDefinition from_table="articles", to_table="authors", options={:column=>"author_id", :name=>"articles_author_id_fk", :primary_key=>"id", :on_delete=>:cascade, :on_update=>nil}>]
........

Finished in 0.333494s, 44.9783 runs/s, 77.9624 assertions/s.

15 runs, 26 assertions, 0 failures, 0 errors, 0 skips
```