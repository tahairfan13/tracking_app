# Ziply Tracking
The purpose of this app is to provide the Ziply driver app a way to share and boradcast drivers' GPS location to the
customers (Ziply website and Ziply user app) in real time.

## Dependencies ##
```
ruby 2.5.7
rails 5.2.3
bundler 2.0.1
redis ~> 4.0
mongoid 7.0.5
sidekiq ~> 5.2
```
## Database ##
```
mongodb
```

## Authentication ##
**Secret keys for the clients are supposed to be generated and distributed manually.**

```
POST    auth/verification
```
body
```
{
"secret_key": ENTER_THE_SECRET_KEY_YOU_ARE_PROVIDED_WITH
}
```

The above endpoint will return you a token which you will use to access the websocket

## ActionCable Connection ##
To connect to the ActionCable you would use the following consumer url

```
ws://${url}/cable?token=${token}
``` 

The above is the URL we will provide to the consumer, ```${url}``` is the URL of ziply tracking app remeber that ws for web socket which will be wss in case of SSL encryption. 
You would be required to provide auth token in ```${token}```

In order to subscribe to a channel you will provide the following attributes to your ActionCable create method

```
ActionCable.create({
  "RoutingChannel",
  job_code: "${job_code}"
})
```

## Sending Location Data ##
After establishing the connection, location data can be sent using ```send_location``` callback in the following format

```
{
  data: {
    job_code: will be the job code of the job
    lat: will be the current latitute of the driver
    long: will be the current longitude of the driver,
    driver_id: will be the id of the driver
  }
}
```

