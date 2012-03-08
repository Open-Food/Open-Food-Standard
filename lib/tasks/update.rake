namespace :update do
  desc "Update the API documentation from the Readme"
  task :api_docs do
    system("bundle exec github-markup README.md > app/views/home/api_docs.html.erb")
  end
end
