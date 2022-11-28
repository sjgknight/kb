source "https://rubygems.org"

# gem "github-pages"
#
# Issue: github-pages Gem doesn't work with Ruby 3!
# This Gemfile should include the line commented out above.
# The lines below are added as a work around for Ruby 3.
# If you are doing serious customization and need to keep in sync with github-pages versions,
# Please use Ruby 2.7x,
# uncomment gem "github-pages"
# and delete the lines below.

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "jekyll"

gem "webrick", "~> 1.7"

gem "jekyll-feed"

gem "nokogiri"

gem "jekyll-last-modified-at", git: "https://github.com/maximevaillancourt/jekyll-last-modified-at", branch: "add-support-for-files-in-git-submodules"
