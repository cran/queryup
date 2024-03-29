% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/query_uniprot.R
\name{query_uniprot}
\alias{query_uniprot}
\title{Retrieve data from UniProt using UniProt's REST API.}
\usage{
query_uniprot(
  query = NULL,
  base_url = "https://rest.uniprot.org/uniprotkb/",
  columns = c("accession", "id", "gene_names", "organism_id", "reviewed"),
  max_keys = 200,
  updateProgress = NULL,
  show_progress = TRUE
)
}
\arguments{
\item{query}{list of keys corresponding to UniProt's query fields.
For example :
query = list("gene_exact" = c("Pik3r1", "Pik3r2"),
"organism_id" = c("10090", "9606"), "reviewed" = "true").
See `query_fields` for available query fields.}

\item{base_url}{The base url for the UniProt REST API}

\item{columns}{names of UniProt data columns to retrieve.
Examples include "accession", "id", "genes", "keywords", "sequence".
See `return_fields` for available return fields.}

\item{max_keys}{maximum number of field items submitted}

\item{updateProgress}{used to display progress in shiny apps}

\item{show_progress}{Show progress bar}
}
\value{
a data.frame
}
\description{
Retrieve data from UniProt using UniProt's REST API.
To avoid non-responsive queries, they are split into
smaller queries with at most \code{max_keys} items per query field.
Not that it works only with queries where items within query fields are
collapsed with '+OR+' and different
query fields are collapsed with '+AND+' (see \code{query_uniprot()})
}
\examples{
# Get the UniProt entries of all proteins encoded by gene Pik3r1
ids <- c("P22682", "P47941")
query = list("accession_id" = ids)
df <-  query_uniprot(query = query)
head(df)
}
