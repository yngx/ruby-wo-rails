
require_relative '../router'

Router.draw do
  get('/') { "Ruby on Rails" }

  get('/articles') { 'All Articles' }

  get('/articles/1') { "First Article" }
end
