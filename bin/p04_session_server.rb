require 'rack'
require_relative '../controllers/controller_base'

class MyController < ControllerBase
  def go
    session["count"] ||= 0
    session["count"] += 1
    render :counting_show
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  MyController.new(req, res).go
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
