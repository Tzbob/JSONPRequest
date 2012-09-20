# JSONPRequest

## Usage

### Coffeescript
````
define ["JSONPRequest"], (JSONPRequest) ->
  jsonp = new JSONPRequest "https://gist.github.com/#{@article.gistid}.json"
  jsonp.send (gist) ->
    console.log gist
````

### JS
````
define(["JSONPRequest"], function(JSONPRequest) {
  var jsonp;
  jsonp = new JSONPRequest("https://gist.github.com/" + this.article.gistid + ".json");
  return jsonp.send(function(gist) {
    return console.log(gist);
  });
});
````
