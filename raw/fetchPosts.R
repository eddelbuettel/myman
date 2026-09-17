#!/usr/bin/env Rscript

suppressMessages({
    library(atrrr)  # it is assumed a local auth token is present
    library(dplyr)
})

setwd("~/git/myman/raw/")

## we need the date of the last vance post.
vance <- readRDS("myman_2026-09-13-06-55.rds")
vance$indexed_at <- as.POSIXct(vance$indexed_at)
vance$created_at <- as.POSIXct(vance$created_at)
max_vance <- max(vance$created_at)
cutoff <- max_vance
cutoff

## limit of 1500 is shooting over the top, we filter later; now set to 500 which is 'good enough'
sk <- atrrr::get_skeets_authored_by(actor = "kevinmkruse.bsky.social", parse = TRUE, limit=500L)
mm <- sk |>
    filter(startsWith(author_handle, "kevinmkruse")) |>
    filter(startsWith(text, "My man ")) |>
    arrange(created_at) |>
    filter(created_at > cutoff)
mm |> select(created_at, text) |> head()
mm |> select(created_at, text) |> tail()
dim(mm)

now <- format(Sys.time(), "%F-%H-%M")
saveRDS(mm, file=paste0("myman_", now, ".rds"))
txt <- mm[, "text"]
colnames(txt) <- "post"
filtered <- data.frame(post = gsub("\\n", "", txt[,"post",drop=TRUE]))
write.csv(filtered, file=paste0("myman_", now, ".csv"), quote=TRUE, row.names=FALSE)
