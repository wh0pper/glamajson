---
title: GlamaJSON

language_tabs: # must be one of https://git.io/vQNgJ

# template also has sections for ruby, python, javascript

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

```
Silence!!! Bring back my cURLs...

Below you will find example code and returns.

  {
    "id": 1,
    "pun": "Now sissy that call!"
  }
```

Welcome to GlamaJSON, the Drag Race API! You can use our API to access a variety of Rupaul's Drag Race datapoints to get information on various queens, seasons, episodes and challenges in our database.

The area to the right will show you how to test various calls from the command line and the resulting JSON returns.

Coming soon:
Soon this API will include queries that will allow you to search for quotes given a word or phrase as well as endpoints for data on challenges.

<aside class="notice">
This API is open for business, no API key required!
</aside>


# Queens Endpoint

## Get All Queens


```shell
curl "http://www.glamajson.com/queens"
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

`GET http://www.glamajson.com/queens`

`GET http://www.glamajson.com/queens?winners=true`

`GET http://www.glamajson.com/queens?serial=true`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | all | Search for specific queen by name, i.e. /queens?name=Bebe%20DZahara%20DBenet
quotes | false | If set to true, the result will include five quotes for each queen.
winners | false | If set to true, the result will include the winner for each season.
serial | false | If set to true, the result will include queens who returned for multiple seasons.


## Get a Specific Queen

```shell
curl "http://www.glamajson.com/queens/2"
```



This endpoint retrieves a specific queen.

<!-- <aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside> -->

### HTTP Request

`GET http://www.glamajson.com/queens/<ID>`


# Quotes Endpoint

## Get All Quotes

```shell
curl "http://www.glamajson.com/quotes?rupaul=true"
```

> The above command returns JSON structured like this:

```json
[
  {
      "id": 545,
      "content": "Bring Back My Girls",
      "queen_id": 1
  },
  {
      "id": 546,
      "content": "Put The Bass In Your Walk",
      "queen_id": 1
  },
  {
      "id": 547,
      "content": "Shante, You Stay",
      "queen_id": 1
  },
  {
      "id": 548,
      "content": "You Betta Work",
      "queen_id": 1
  }
]
```

This endpoint retrieves all quotes in our database.


### HTTP Request

`GET http://www.glamajson.com/quotes`

### URL Parameters

Parameter | Description
--------- | -----------
random | with ?random=true, one random quote will be returned
author | with ?author=true, all returned quotes will also list the associated queen
rupaul | with ?rupaul=true, only quotes from RuPaul will be returned


## Get a Specific Quote
This endpoint allows you to get a specific quote with the associated queen.

### HTTP Request
`GET http://glamajson.com/quotes/<ID>`

```shell
curl "http://www.glamajson.com/quotes/2"
```
> The above command returns JSON structured like this:

```json
{
    "id": 2,
    "content": "I want a snickers!",
    "queen_id": 1,
    "queen": {
        "id": 1,
        "name": "Victoria Parker",
        "real_name": "Victor Bowling",
        "city": "Los Angeles, California",
        "age": 48
    }
}
```

# Seasons Endpoint

## Get All Seasons


```shell
curl "http://www.glamajson.com/season/1"
```

> The above command returns JSON structured like this:

```json
{
    "id": 1,
    "name": "Season 1",
    "winner_id": 2,
    "episodes": [
      {
        "id": 515,
        "number_in_series": 2,
        "number_in_season": 2,
        "title": "Girl Groups",
        "airdate": "February 9, 2009 (2009-02-09)",
        "season_id": 1,
        "bottom_two": "Akashia & Tammie Brown",
        "eliminated": "Tammie Brown",
        "winner": "Ongina",
        "lip_synch": "We Break the Dawn by Michelle Williams"
    }
  ]
}

```

This endpoint retrieves all seasons.

### HTTP Requests

`GET http://www.glamajson.com/seasons`
Returns all seasons.

`GET http://www.glamajson.com/seasons/<ID>`
Returns a specific season and all of its episodes.

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
This endpoint returns all episodes in the series and information on the challenges, bottom two queens, lip synch songs and main-challenge winners.

### HTTP Requests

`GET http://www.glamajson.com/episodes`
Returns all episodes.

`GET http://www.glamajson.com/episodes/<ID`
Returns a specific episode.


<aside class="success">
Your endpoints are officially snatched!
</aside>
