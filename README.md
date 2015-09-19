# Type and Learn
This is a light way Sinatra APP, which connects the backend API and the frontend of my home project called Type and Learn.

It basically fetches the activated release index HTML from Redis, serialize the logged in user (if there's any) and put it into a meta tag and sends the whole HTML back to the client.

I'm running this project on my private Ubuntu server in my living room.

The frontend is an Ember CLI application: https://github.com/tothpeter/type_and_learn_client

The backend is a rails API: https://github.com/tothpeter/type_and_learn_api

The final app is live here: http://type-and-learn.kalina.tech

A broader description is on its way...

## To test out a different version in production before introducing it to the public

### Last release (Canary)
http://type-and-learn.kalina.tech/?version=canary

### Specific release
http://type-and-learn.kalina.tech/?version=release&release=RELEASE