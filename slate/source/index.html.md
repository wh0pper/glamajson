---
title: Drag Race API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
# template also has sections for ruby, python, javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to GlamaJSON, the Drag Race API! You can use our API to access a variety of Drag Race Data endpoints to get information on various queens, seasons, episodes and challenges in our database.

The area to the right will show you how to test various calls from the command line and the resulting JSON returns.

This example API documentation page was created with [Slate](https://github.com/lord/slate). Feel free to edit it and use it as a base for your own API's documentation.

### Now sissy that call!!!

# Authentication

```shell
# to register and generate an API key
curl -H "Content-Type: application/json"
-X POST -d '{"email":"<YOUR_ADDRESS>@email.com","password":"<CHOOSE A PASSWORD"}'
http://localhost:3000/authenticate
```

> The above command returns your key formatted like this:

```shell
{"auth_token":"bGciOiJIUzI1NiJ9.eyAiOjE1MjYwNTDl9.U81PZl3mdtvlX0YaM"}

# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" -H "Authorization: <YOUR_KEY_HERE>"
```


Generate your own API key by executing the code to the right from the terminal.

<aside class="notice">
<b>"How's your header!?"</b>
<br>
Keep this key private and include it in the header of any requests you make.
</aside>

# Queens Endpoint

## Get All Queens


```shell
curl "http://example.com/queens"
  # -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 106,
    "name": "Cynthia Lee Fontaine",
    "real_name": "Carlos Hernandez",
    "city": "Austin, Texas",
    "age": 37
  },
  {
    "id": 107,
    "name": "Alexis Michelle",
    "real_name": "Alex Michaels",
    "city": "",
    "age": 33
  }
]
```

This endpoint retrieves all queens.

### HTTP Requests

`GET http://example.com/queens`

`GET http://example.com/queens?winners=true`

`GET http://example.com/queens?serial=true`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | all | Search for specific queen by name, i.e. /queens?name=Bebe%20DZahara%20DBenet
quotes | false | If set to true, the result will include five quotes for each queen.
winners | false | If set to true, the result will include the winner for each season.
serial | false | If set to true, the result will include queens who returned for multiple seasons.

<aside class="success">
Remember — if you're not limiting your API calls, you're not doing drag!
</aside>

## Get a Specific Queen

```shell
curl "http://example.com/queens/2"
  # -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Ongina",
  "real_name": "Ryan Ong Palao",
  "city": "Los Angeles, California",
  "age": 36
}
```

This endpoint retrieves a specific queen.

<!-- <aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside> -->

### HTTP Request

`GET http://example.com/queens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the queen to retrieve


# Quotes Endpoint

## Get All Quotes

This endpoint retrieves all quotes in our database.

### HTTP Request

`GET http://example.com/quotes`

### URL Parameters

Parameter | Description
--------- | -----------
random | with ?random=true, one random quote will be returned
author | with ?author=true, all returned quotes will also list the associated queen

# Seasons Endpoint

## Get All Seasons


```shell
curl "http://example.com/seasons"
  # -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
[
  {

  },
  {

  }
]
```

This endpoint retrieves all seasons.

### HTTP Requests

`GET http://example.com/seasons`
Returns all seasons.

`GET http://example.com/seasons/(id)/episodes`
Returns all episodes for a specific season id.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
allstar | false | if set to true it will return only allstar seasons.
current | false | if set to true it will return the current or most recent season.

<aside class="success">
Remember — if you're not limiting your API calls, you're not doing drag!
</aside>

# Episodes Endpoint

## Get All Episodes

### HTTP Requests

`GET http://example.com/episodes`
Returns all episodes.

`GET http://example.com/episodes/(id)/challenges`
Returns all challenges for a specific episode id.
