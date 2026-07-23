#!/usr/bin/env Rscript

suppressMessages({
    library(atrrr)  # it is assumed a local auth token is present
    library(dplyr)
})

## limit of 1500 is shooting over the top, we filter later
sk <- atrrr::get_skeets_authored_by(actor = "kevinmkruse.bsky.social", parse = TRUE, limit=1500L)
mm <- sk |>
    filter(startsWith(author_handle, "kevinmkruse")) |>
    filter(startsWith(text, "My man ")) |>
    arrange(created_at)
now <- format(Sys.time(), "%F-%H-%M")
saveRDS(mm, file=paste0("myman_", now, ".rds"))
txt <- mm[, "text"]
colnames(txt) <- "post"
filtered <- data.frame(post = gsub("\\n", "", txt[,"post",drop=TRUE]))
write.csv(filtered, file=paste0("myman_", now, ".csv"), quote=TRUE, row.names=FALSE)
