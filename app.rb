require 'erb'
require_relative './router'

class App
  attr_reader :router

  def initialize
    @router = Router.new

    router.get('/') { "Ruby on Rails" }
    router.get('/articles') { 'All Articles' }
    router.get('/articles/1') { "First Article" }
  end

  def call(env)
    title = router.build_response(env['REQUEST_PATH'])
    erb = ERB.new(html_template)
    response_html = erb.result(binding)

    [200, headers, [response_html]]
  end

  def headers
    { 'Content-Type' => 'text/html'}
  end

  def html_template
    File.read 'views/index.html.erb'
  end
end
