#this doesn't work because the notes don't include tags via api
#knitr::knit2pandoc("C:/Users/125295_admin/Downloads/kgs/TextExpand-tag-content.md",output_file = "tag_comp.pdf")

pacman::p_load(zoterro)

qa_include <- collection_items(
  key="WWKT8ER8",
  user = zotero_group_id(4789270),
  query = list(type="itemNote")
  )

pacman::p_load(RefManageR)

zotero_key()
zotero_key("zotero.key")

qa_include <- collection_items(
  key="WWKT8ER8",
  user = zotero_group_id(4789270),
  query = list(type="itemNote")
  )

View(qa_include)
#my userID is 2449

qa_include1 <- ReadZotero(user = "1648676",
                          .params=list(key = Sys.getenv("zotero"),
                                       tag = "INCLUDE",
                                       type = "itemNote"))


qa_rqsaims <- collection_items(
  key="WWKT8ER8",
  user = zotero_group_id(4789270),
  query = list(type="note",
               tag = "RQs+aims")
  )

View(qa_rqsaims)
qa_rqsaims[[1]][["key"]]
qa_rqsaims[[1]][["data"]][["note"]]
qa_rqsaims[[131]][["data"]][["note"]]
