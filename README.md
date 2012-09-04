bootstrap-mongodb-demo
======================
 - This demo rails application implements the functionality specified in the following programming exercise:

        We'd like you to create a simple Rails 3 application.

        Create models that allow a user to follow another user.

        The user model's only attribute is "name". You may scaffold the create action.

        Create an interface that accepts post requests that allows users to
        "follow" other users.

        The user's "index" action should list all of the users.

        The user's "show" action should show:

        1) The user's name

        2) The users the user is currently following (with a button to remove
        that following)

        3) The users the user is not following (with a button to add that following)

        4)  The users currently following this user

        Do not create a login system for this exercise.

 - it uses
    - ruby 1.9.3p194
    - Rails 3.2.8

    - twitter bootstrap
    - mongodb and mongoid

 - run 'bundle exec rake db:seed' to pre-populate the database with test users

 - to run this application you need to
    - have a mongodb server running
    - have a mongodb database with name 'chirp_development'
