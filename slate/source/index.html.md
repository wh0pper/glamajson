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

Welcome to the Drag Race API! You can use our API to access Drag Race API endpoints, which can get information on various queens, seasons, episodes and challenges in our database.

The area to the right will show you how to test various calls with shell and the resulting JSON returns.

This example API documentation page was created with [Slate](https://github.com/lord/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

<!-- ```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
``` -->

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  # -H "Authorization: meowmeowmeow"
```

<!-- ```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
``` -->

<!-- > Make sure to replace `meowmeowmeow` with your API key. -->

This API currently doesn't use any authentication, so have at it!

<!-- Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow` -->

<aside class="notice">
I'll add some eventually
</aside>

# Queens Endpoint

## Get All Queens

<!-- ```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
``` -->

```shell
curl "http://example.com/queens"
  # -H "Authorization: meowmeowmeow"
```

<!-- ```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
``` -->

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

### HTTP Request

`GET http://example.com/queens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
queen | all | Search for specific queen by name, i.e. /queens?queen=Bebe%20DZahara%20DBenet
quotes | false | If set to true, the result will include five quotes for each queen.

<aside class="success">
Remember — if you're not limiting your API calls, you're not doing drag!
</aside>

## Get a Specific Queen

<!-- ```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
``` -->

```shell
curl "http://example.com/queens/2"
  # -H "Authorization: meowmeowmeow"
```

<!-- ```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
``` -->

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

<!-- ## Delete a Specific Queen

<!-- ```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
``` -->

```shell
curl "http://example.com/queens/2"
  -X DELETE
  -H "Authorization: <API key here>"
```

<!-- ```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
``` -->

> The above command returns JSON structured like this:

```json
{
  "message": "Queen successfully destroyed."
}
```

This endpoint deletes a specific queen.

### HTTP Request

`DELETE http://example.com/queens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the queen to delete -->

# Quotes Endpoint

## This endpoint retrieves all quotes in our database.

### HTTP Request
`GET http://example.com/quotes`

### URL Parameters

Parameter | Description
--------- | -----------
random | with ?random=true, one random quote will be returned
author | with ?author=true, all returned quotes will also list the associated queen

# Seasons Endpoint
## This endpoint retrieves all season of Drag Race.
### HTTP Request
`GET http://#.com/seasons`
### URL Parameters

# Episodes Endpoint
