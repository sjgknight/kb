#TO DO

#I need to ensure the notes/files ACTUALLY have the doi
#it makes sense to do this on an item level, and then to join to notes

##################################
##################################
##################################
#this function checks if a md has open_access information already.
#If TRUE, nothing. If FALSE, use function below to write it to md.
check_yaml_oa <- function(md_file){
  if(!ymlthis::has_field(md_file, "oa_status")){check_oa(md_file)}
}

#optionally, also write to Zotero using api, PATCH (for 1) or PUT (for many)
# GET <userOrGroupPrefix>/items/<itemKey>
#
#   PATCH <userOrGroupPrefix>/items/<itemKey>
#   If-Unmodified-Since-Version: <last item version>
#
#   {
#     "date" : "2013"
#     "collections" : [
#       "BCDE3456", "CDEF4567"
#     ]
#   }


#this function checks an item using an identifier (probably doi) and returns some information.
#it's not efficiently written
check_oa <- function(item){
  pacman::p_load(openalexR, magrittr, dplyr,jsonlite)
  pacman::p_load_gh("libscie/retractcheck")
  pacman::p_load_gh("sjgknight/yamlupdater")

  #tediously the bbt/zot export to yaml is CSL and excludes a lot of info inc tags
  #the JSON export is fine but then functions need rewriting below
  #jdoi <- jsonlite::read_json("C:\\Users\\125295_admin\\Downloads\\bbt\\Exported Items.json")$items[[1]]$DOI

  #read item yaml
  ym <- yamlupdater::yaml_get(item)

  ym_list <- ym$yaml_list
  ym_content <- ym$yaml_content

  #if no DOI, skip (or, try and use title+ to match on)
  retractcheck::check_doi(ym_list$doi)

  #get info for work
  get_info <- openalexR::oa_fetch(
    identifier = ym_list$doi,
    entity = "works",
    output="list")

  new_ym <- list()
  new_ym$openalex_date <- Sys.Date()
  new_ym$oa_status <- get_info$open_access$oa_status
  new_ym$oa_url <- get_info$open_access$oa_url
  new_ym$oa_is <- get_info$open_access$is_oa
  new_ym$cited_count <- get_info$cited_by_count
  new_ym$abstract_index <- names(get_info$abstract_inverted_index)
  new_ym$referenced_w <- get_info$referenced_works

  yamlupdater::yaml_update(item, method = "merge")

}
