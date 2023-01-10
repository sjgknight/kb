#script to split filenames and add key and identifer to yaml
#and join to tags
pacman::p_load(dplyr,magrittr, RSQLite)

#Get the exported notes (note, now I'm just accessing the sqlite I could probably just do this myself too)
znotes <- list.files("C:/Users/125295_admin/Downloads/kgs/bntest5",".md",full.names=T)
znotes <- znotes %>%
  as_tibble() %>%
  mutate(itemname = tools::file_path_sans_ext(basename(value))) %>%
  tidyr::separate(itemname, c("itemNumber", "itemKey"), sep = "-", remove=FALSE)

#get the tags from sqlite
con = dbConnect(drv = RSQLite::SQLite(),
                                 dbname = "~/Zotero/zotero.sqlite",
                                 synchronous = NULL)

alltables = dbListTables(con)

itemNotes <- dbGetQuery(con, 'select * from itemNotes')

itemTags <- dbGetQuery(con, 'select * from itemTags')
tags <- dbGetQuery(con, 'select * from tags')

dbDisconnect(con)

itemTags <- itemTags %>% left_join(
  tags, by = c("tagID")
)

znotes <- znotes %>% mutate(
  itemNumber = as.numeric(itemNumber)) %>%
  nest_join(
    itemTags, by = c('itemNumber'='itemID'),
    name = NULL)

#can either make long, and rewrite the apply (because rowwise won't work then), OR fix the above

#edit all files
apply(znotes,1, function(note){
#note <- znotes[5,]

if(note$itemTags %>% as.data.frame() %>% nrow() > 0){
    tags <- note$itemTags %>%
      as.data.frame() %>%
      select(name) %>%
      unlist() %>%
      paste(collapse=",")

    tags <- paste0("tags: [", tags, "]\n")} else{
    tags <- paste0("tags: []\n")
    }


  # if(nrow(tidyr::unnest(note, cols = c(itemTags)))>0){
  # tidyr::unnest(note, cols = c(itemTags)) %>%
  # select(name) %>%
  # paste0("tags: [",.,"]\n")} else {paste0("tags: []\n")}

  #yam <- ymlthis::yml() %>% yml_toplevel(yam)
  yam <- paste0("---\n",
                "itemNumber: \'",
                note['itemNumber'],
                "\'\nitemKey: ",
                note['itemKey'],
                "\n",tags,
                "\n---\n")

  note_txt <- readr::read_lines(note['value'])

  readr::write_lines(c(yam, note_txt), paste0(note['value']))

})


###############################################################
###############################################################
###############################################################
##################### And tags ################################
###############################################################



#tgs <- readr::read_csv("C:/Users/125295_admin/Downloads/kgs/bntest5/tags_include_2022110411_25.csv",
#                       col_types = "cccc")

#remember, you've only got the NOTES here, so you can't match tags to parentitems
#apply(tgs,1,function(x){
  #x <- tgs[6,]
#
#   #get the tag and items it's applied to
#   tag_name <- x[[1]]
#   note_ids <- x[[4]]
#
#   #turn ids into a list
#   note_ids <- stringr::str_split_1(note_ids,",")
#   )
