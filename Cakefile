{exec, spawn} = require "child_process"

build = (watch) ->
  opts = ["-c", "-o", "./", "./"]
  opts.unshift "-w" if watch

  coffee = spawn "coffee", opts
  coffee.stdout.on "data", (data) -> console.log data.toString()
  coffee.stderr.on "data", (data) -> console.log data.toString()

run = (command) ->
  exec command, (err, stdout, stderr) ->
    console.log stdout if stdout?
    console.log stderr if stderr?

# Tasks
# ##############################################################################

task "build", "Build coffee", ->
  build false

task "watch", "Watch and build coffee", ->
  build true

task "package", "Build and minify", ->
  build false
  run "closure JSONPRequest.js > JSONPRequest.min.js"
