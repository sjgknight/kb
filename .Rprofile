################################################
################################################
################################################
#get tags join to tags
################################################
################################################
################################################

pacman::p_load(dplyr,magrittr, RSQLite)

#Get the exported notes (note, now I'm just accessing the sqlite I could probably just do this myself too)
# znotes <- list.files("C:/Users/125295_admin/Downloads/kgs/bntest5",".md",full.names=T)
# znotes <- znotes %>%
#   as_tibble() %>%
#   mutate(itemname = tools::file_path_sans_ext(basename(value))) %>%
#   tidyr::separate(itemname, c("itemNumber", "itemKey"), sep = "-", remove=FALSE)
#
# #get the tags from sqlite
# con = dbConnect(drv = RSQLite::SQLite(),
#                 dbname = "~/Zotero/zotero.sqlite",
#                 synchronous = NULL)
#
# alltables = dbListTables(con)
#
# itemNotes <- dbGetQuery(con, 'select * from itemNotes')
#
# itemTags <- dbGetQuery(con, 'select * from itemTags')
# tags <- dbGetQuery(con, 'select * from tags')
#
# dbDisconnect(con)
#
# itemTags <- itemTags %>% left_join(
#   tags, by = c("tagID")
# )
#
# znotes <- znotes %>% mutate(
#   itemNumber = as.numeric(itemNumber)) %>%
#   nest_join(
#     itemTags, by = c('itemNumber'='itemID'),
#     name = NULL)
#
# ################################################
# ################################################
# ################################################
# ################################################
# #use this to load a script that:
# #checks the R tags, and updates the yaml tags
# #use OpenAlexR setup to auto-scrape the copyright status of all articles within the vault, and set a tag-flag share-ccby (etc).  Use the same tag within Zotero to manually add. Only add flag where no flag exists (so, if Zotero tag, then write flag; if flag, nothing)
# ################################################
# ################################################
# ################################################
#
# pacman::p_load(openalexR, yaml, ymlthis,readr)
# pacman::p_load_gh("sjgknight/yamlupdater")
#
# mds <- list.files(".", pattern = ".md", full.names=T, recursive=T, include.dirs=T, ignore.case=T)
#
# for(mdf in mds){
#   #mdf <- mds[10]
#
#   #get matching tags from zotero
#   zot_tags <- znotes[8,"itemTags"] %>%
#     tidyr::unnest(cols = c(itemTags)) %>%
#     select(name) %>%
#     rename(tags = "name") %>%
#     ymlthis::as_yml() %>%
#     ymlthis::yml_pluck("tags")
#
#   yamlupdater::yaml_update(mdf, yaml = zot_tags)
#   #
#   # #read the file myaml
#   # md <- yaml::read_yaml(mdf)
#   # #
#   #
#   # #get its tags
#   # md_tags <- if(ymlthis::has_field(md, "tags")){
#   #   ymlthis::yml_pluck(md, "tags")
#   # }
#   #
#   #
#   #
#   # md_new <- ymlthis::as_yml(c(zot_tags,md_tags))
#   #
#   # md <- ymlthis::yml_replace(md, tags = c(md_new))
#   # md <- yaml::as.yaml(md)
#   #
#   # md_body <- stringr::str_replace_all(readr::read_file(mdf),
#   #                                     "^(-{3})(\\s|\\S|.)*(-{3})",
#   #                                     "")
#   #
#   # readr::write_lines(c("---\n",md, "\n---\n",md_body),
#   #                    mdf)
#
#   #neither of these write it as yaml it just overwrites the file.
#   #ymlthis::use_yml_file(md,mdf)
#   #mdf <- yaml::write_yaml(x = as.yaml(md), file = mdf)
# }
#
