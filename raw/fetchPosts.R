#!/usr/bin/env Rscript

suppressMessages({
    library(atrrr)  # it is assumed a local auth token is present
    library(dplyr)
})

setwd("~/git/myman/raw/")

## we need the date of the last mullin post.
mullin <- readRDS("myman_2026-09-06-07-18.rds")
mullin$indexed_at <- as.POSIXct(mullin$indexed_at)
mullin$created_at <- as.POSIXct(mullin$created_at)
max_mullin <- max(mullin$created_at)


## limit of 1500 is shooting over the top, we filter later
sk <- atrrr::get_skeets_authored_by(actor = "kevinmkruse.bsky.social", parse = TRUE, limit=500L)
mm <- sk |>
    filter(startsWith(author_handle, "kevinmkruse")) |>
    filter(startsWith(text, "My man ")) |>
    arrange(created_at) |>
    filter(created_at > max_mullin)
mm |> select(created_at, text) |> head()
mm |> select(created_at, text) |> tail()
dim(mm)

now <- format(Sys.time(), "%F-%H-%M")
saveRDS(mm, file=paste0("myman_", now, ".rds"))
txt <- mm[, "text"]
colnames(txt) <- "post"
filtered <- data.frame(post = gsub("\\n", "", txt[,"post",drop=TRUE]))
write.csv(filtered, file=paste0("myman_", now, ".csv"), quote=TRUE, row.names=FALSE)
