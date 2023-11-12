require 'erb'

class App
  def call(env)
    title = get_query_string(env) || 'Ruby on Rails'
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

  def get_query_string(env)
    query = env['QUERY_STRING']
    values = query.split('=')
    values[1]
  end
end