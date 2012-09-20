# JSONPRequest

A simple object without dependencies to deal with JSONP.

## Usage

### Coffeescript
````
define ["JSONPRequest"], (JSONPRequest) ->
  jsonp = new JSONPRequest "https://gist.github.com/#{gistid}.json"
  jsonp.send (gist) ->
    console.log gist
````

### JS
````
define(["JSONPRequest"], function(JSONPRequest) {
  var jsonp;
  jsonp = new JSONPRequest("https://gist.github.com/" + gistid + ".json");
  return jsonp.send(function(gist) {
    return console.log(gist);
  });
});
````
