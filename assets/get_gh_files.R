pgs <- c("bidirectional_links_generator.rb",
         "embed_tweets.rb",
         "empty_front_matter_note_injector.rb",
         "markdown-highlighter.rb",
         "open_external_links_in_new_tab.rb"
        )

baselink <- "_plugins/"

sapply(pgs, function(x){
   usethis::use_github_file(
   repo_spec = "maximevaillancourt/digital-garden-jekyll-template",
   path = paste0(baselink,x))
})

