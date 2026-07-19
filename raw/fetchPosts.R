#!/usr/bin/env Rscript

suppressMessages({
    library(atrrr)  # it is assumed a local auth token is present
    library(dplyr)
})

## limit of 1500 is shooting over the top, we filter later
sk <- atrrr::get_skeets_authored_by(actor = "kevinmkruse.bsky.social", parse = TRUE, limit=1500L)
mm <- sk |> filter(startsWith(author_handle, "kevinmkruse")) |> filter(startsWith(text, "My man "))
now <- format(Sys.time(), "%F-%R")
saveRDS(mm, file=paste0("myman_", now, ".rds"))
txt <- mm[, "text"]
colnames(txt) <- "post"
write.csv(txt, file=paste0("myman_", now, ".csv"), quote=TRUE, row.names=FALSE)
