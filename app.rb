require 'erb'
require_relative './config/routes'

class App

  def call(env)
    title = Router.instance.build_response(env['REQUEST_PATH'])
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
