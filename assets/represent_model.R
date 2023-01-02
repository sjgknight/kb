pacman::p_load(DiagrammeR)

mermaid("
graph TB
A[Import items into Zotero]-->B[Annotate items and create tagged item notes]
B-->C[Export itemnotes using BetterNotes addon with modified MDNotesExport template]
B-->D[Export itemnote tags using direct sqllite access]
D-->E[Connect tags to notes in R]
C-->E
E-->F(tag itemnote.md files with copyright status using plugin TBC)
F---G{END OF ZOTERO BIT}
H[run split_filenames.R script to add yaml to exported notes, get the tags, and append them to each note]-->I[run data query in Obsidian to collate notes-by-tag]
I-->J[run pandoc via R to export to PDF because OBsidian PDF export is broken]
J-->K[run wikithingo to make wikilinks]
Z[json import into jekyll]-->Y[make pages]
Y-->X[serve]
")



# https://groups.google.com/g/zotero-dev/c/5LJUdd8-bf8/m/yyFMYMbuzVcJ
# https://community.rstudio.com/t/export-pdf-metadata-from-zotero-into-r/97628/4
#



mermaid("
sequenceDiagram
  customer->>ticket seller: ask ticket
  ticket seller->>database: seats
  alt tickets available
    database->>ticket seller: ok
    ticket seller->>customer: confirm
    customer->>ticket seller: ok
    ticket seller->>database: book a seat
    ticket seller->>printer: print ticket
  else sold out
    database->>ticket seller: none left
    ticket seller->>customer: sorry
  end
")
