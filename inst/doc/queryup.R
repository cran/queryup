## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(queryup)

## ----message=FALSE, warnings=FALSE--------------------------------------------
query <- list("gene_exact" = "Pik3r1")
df <- query_uniprot(query, show_progress = FALSE)
head(df)

## -----------------------------------------------------------------------------
query_fields$field

## ----message=FALSE, warnings=FALSE--------------------------------------------
df <- query_uniprot(query, 
                    columns = c("id", "sequence", "keyword", "gene_primary"),
                    show_progress = FALSE)

## -----------------------------------------------------------------------------
head(return_fields)

## -----------------------------------------------------------------------------
names(df)

## -----------------------------------------------------------------------------
as.character(df$Sequence[1])
as.character(df$Keywords[1])

## ----message=FALSE, warnings=FALSE--------------------------------------------
query <- list("gene_exact" = "Pik3r1", 
              "reviewed" = "true", 
              "organism_id" = "9606")
df <- query_uniprot(query, show_progress = FALSE)
print(df)

## ----message=FALSE, warnings=FALSE--------------------------------------------
query <- list("gene_exact" = c("Pik3r1", "Pik3r2"), 
              "reviewed" = "true", 
              "organism_id" = c("9606", "10090"))
df <- query_uniprot(query, show_progress = FALSE)
print(df)

## -----------------------------------------------------------------------------
invalid_ids <- c("P226", "CON_P22682", "REV_P47941")
valid_ids <- c("A0A0U1ZFN5", "P22682")
ids <- c(invalid_ids, valid_ids)
query <- list("accession_id" = ids)
query_uniprot(query)

## ----message=FALSE, warning=FALSE---------------------------------------------
ids <- uniprot_entries$Entry
query <- list("accession_id" = ids)
columns <- c("gene_names", "xref_ensembl")
df <- query_uniprot(query, columns = columns, show_progress = FALSE)
head(df)

## ----message=FALSE, warning=FALSE---------------------------------------------
ids <- sample(uniprot_entries$Entry, 400)
query <- list("accession_id" = ids, 
              "interactor" = ids)
columns <- "cc_interaction"
df <- query_uniprot(query = query, columns = columns, show_progress = FALSE)
head(df)

