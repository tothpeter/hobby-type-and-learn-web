# Type and Learn Web

[The main project page](https://github.com/tothpeter/type_and_learn)

This is a lightweight Sinatra APP, which connects the API and the frontend of my home project called Type and Learn.

It basically fetches the activated release index HTML from Redis, serialize the logged in user (if there's any) and put it into a meta tag and sends the whole HTML back to the client.

A broader description is on its way...

## To test out a different version in production before introducing it to the public

### Last release (Canary)
http://type-and-learn.kalina.tech/?version=canary

### Specific release
http://type-and-learn.kalina.tech/?version=release&release=RELEASE