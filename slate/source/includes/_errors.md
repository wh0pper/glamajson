# Errors

The Drag Race API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Your API key is wrong.
403 | Forbidden -- The data requested is hidden for administrators only.
404 | Not Found -- The specified data could not be found.
405 | Method Not Allowed -- You tried to access data with an invalid method.
406 | Not Acceptable -- You requested a format that isn't json.
410 | Gone -- The data requested has been removed from our servers.
418 | I'm a teapot.
429 | Too Many Requests -- You're requesting too much drag data! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
