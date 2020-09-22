
## About the project
* This repository is an API for the [Video Player](https://github.com/lucasgrocha/video-player-web) frontend.
* I used factory bot to generate fake data in rspec tests.
* To serialize the data to send as API response, I choose the jbuilder.

I wish you like the app and thank you for the opportunity! :D

Best regards.

 ---

# Video Player

## Technology

Here are the technologies used in this project.

* ruby 2.7.1
* rails 6.0.3.3
* postegresql 12.4

## Ruby gems

* rspec-rails
* pry-rails
* factory_bot_rails
* devise
* jwt
* carrierwave-video-thumbnailer
* fog-aws
* jbuilder
* ffaker


## Getting started

* Install the ```carrierwave-video-thumbnailer``` dependency

Linux
>    $ sudo apt install ffmpegthumbnailer

MacOS
>    $ brew install ffmpegthumbnailer



## Rails setup

* Download project
>    $ git clone https://github.com/lucasgrocha/video_player.git
* Install the gems:
>    $ bundle install
* Create database and migrate:
>    $ rails db:create db:migrate
* Run the project:
>    $ rails s -p 3000 -b '0.0.0.0'


Note: I used bundler version 2.1.4, if the app get some error on **bundle install**, please run this command: **gem install bundler -v 2.1.4**

### Optional

* There's a seed file, if you want fill the database:
>    $ rails db:seed
* Once you created and migrated, you can clean up all the database and fill It again with the seeds
>    $ rails db:setup

## Endpoints

### GET /api/v1/videos
Return all videos

Example of response

```json
[
   {
      "id":26,
      "name":"rerum vel est",
      "description":"Eligendi ipsam et non ut. Aut asperiores autem quia ut.",
      "file_url":"/uploads/video/file/26/14088397.mp4",
      "thumbnail_url":"/uploads/video/file/26/thumb_14088397.png",
      "user_name":"Anjanette Von",
      "views":64
   }
]
```
```
HTTP STATUS: 200
```

### GET /api/v1/videos/:id
Return the data of a video

Example of response

```json
{
   "id":25,
   "name":"laboriosam suscipit a",
   "description":"Quo tenetur voluptatem sit esse aut. Molestiae odit laborum facilis est.",
   "file_url":"/uploads/video/file/25/ExportStock_00.mp4",
   "user_name":"Anjanette Von",
   "views":36
}
```
```
HTTP STATUS: 200
```

### PUT /api/v1/videos/:id
Update a video

Request body

```json
 {
   "video":{
      "name":"Lucas",
      "description":"blagblabal"
   }
}
```

Request header
```Authorization: [JWT TOKEN]```

Example of response
```
HTTP STATUS: 200
```

### POST /api/v1/videos
Create a new video

Request body

```
 {
   "video":{
      "name":"Lucas",
      "description":"blagblabal",
      "file": File
   }
}
```

Request header
```Authorization: [JWT TOKEN]```
```Content-Type: multipart/form-data```

Example of response
```
HTTP STATUS: 201
```

### DELETE /api/v1/videos/:id
Delete a video

Request header
```Authorization: [JWT TOKEN]```

Example of response
```
HTTP STATUS: 204
```

### GET /api/v1/recommended_videos
Return a list of videos

Example of response

```json
[
   {
      "id":9,
      "name":"eveniet ut assumenda",
      "description":"Eos voluptatem voluptates nihil laboriosam qui necessitatibus aliquid nisi.",
      "file_url":"/uploads/video/file/9/video_preview_h264.mp4",
      "thumbnail_url":"/uploads/video/file/9/thumb_video_preview_h264.png",
      "user_name":"Leonardo Rippin",
      "views":27
   }
]
```
```
HTTP STATUS: 200
```

### PUT /api/v1/incrementView
Increment the video's views when the player starts

Example of response

```
HTTP STATUS: 200
```

### POST /api/v1/auth
Returns a jwt auth token for a registered user

Request body

```json
 {
  "email": "mail@mail.com",
  "password": "123456"
 }
```
Example of response
```json
{
  "token": "eyJhbGciOiJub25lIn0.Imx1Y2FzZ2VdDJ1SXJPVkl0c0JLeDl1dXpyTkQyUzJ2ZXBSdFJsaWZFOVpQSyI."
}
```

```
HTTP STATUS: 200
```

### POST /api/v1/registrations
Create a new user and return a jwt auth token

Request body

```json
 {
   "user":{
      "email":"mail@gmail.com",
      "name":"Caio",
      "password":123456,
      "password_confirmation":123456
   }
}
```
Example of response
```json
{
  "token": "eyJhbGciOiJub25lIn0.Imx1Y2FzZ2VdDJ1SXJPVkl0c0JLeDl1dXpyTkQyUzJ2ZXBSdFJsaWZFOVpQSyI."
}
```
```
HTTP STATUS: 200
```

### GET /api/v1/myVideos
Returns a list of user's videos

Request header
```Authorization: [JWT TOKEN]```

Example of response

```json
 [
   {
      "id":26,
      "name":"rerum vel est",
      "description":"Eligendi ipsam et non ut. Aut asperiores autem quia ut. Omnis consectetur et ut sunt consequatur recusandae voluptatibus. Ut quibusdam ut aut et sit qui.",
      "file_url":"/uploads/video/file/26/14088397.mp4",
      "thumbnail_url":"/uploads/video/file/26/thumb_14088397.png",
      "user_name":"Lucas George Rocha",
      "views":65
   }
]
```
```
HTTP STATUS: 200
```


### Testing

There's 19 tests that validates the successes and the failures of each endpoint

* Run the rspec tests
>    $ bundle exec rspec -fd

###   Some considerations

* My first idea was integrate both ReactJS and Rails in the same project with webpacker, although I ran into some problems because was my first time trying It. Thereafter I decided to split out the React and Rails into different repositories.

* Was not possible to deploy the API on Heroku because I would spend some time to install the ```ffmpegthumbnailer``` on the server, them I decided to leave aside this idea and focus on rpsec testing.

* In production the uploaded video should be saved in AWS S3 (there's a config file at ```ìnitializers/carrierwave.rb``` to manage the storage on each environment).

* I made my own JWT authentication based on Its concepts to prevent spending time configuring devise and jwt from scratch, Its totally conceptual.

* Was very cool to develop the application and I learned a lot of new things! :D

###   Some points that I would like to have made

* Add validations to the models
* Refactor the controllers and Its routes
* Use some JWT authentication gem
* Implement sidekiq to prevent the carrierwave upload finishes to send a response (would improve the user's experience)



### Author

* **Lucas G Rocha**: @lucasgrocha (https://github.com/lucasgrocha)
