#!/usr/bin/env Rscript

miller <- readRDS("myman_2026-07-25-13-56.rds")
miller$indexed_at <- as.POSIXct(miller$indexed_at)
miller$created_at <- as.POSIXct(miller$created_at)
range(miller$indexed_at)
# [1] "2026-07-16 21:50:18.428999 UTC" "2026-07-24 20:37:20.128000 UTC"
miller$man <- "Stephen Miller"

kennedy <- readRDS("myman_2026-08-13-05-16.rds")
kennedy$indexed_at <- as.POSIXct(kennedy$indexed_at)
kennedy$created_at <- as.POSIXct(kennedy$created_at)
range(kennedy$indexed_at)
# [1] "2026-07-30 15:45:42.334000 UTC" "2026-08-13 01:59:24.530999 UTC"
range(kennedy$indexed_at[-c(1,2)])   ## as first two are still miller tweets
# [1] "2026-08-12 00:38:40.023999 UTC" "2026-08-13 01:59:24.530999 UTC"
kennedy$man <- "Robert F. Kennedy, Jr."
kennedy$man[1:2] <- "Stephen Miller"

cheung <- readRDS("myman_2026-08-18-08-42.rds")
cheung$indexed_at <- as.POSIXct(cheung$indexed_at)
cheung$created_at <- as.POSIXct(cheung$created_at)
range(cheung$indexed_at)
# [1] "2026-08-17 22:05:22.226999 UTC" "2026-08-18 02:17:52.630000 UTC"
cheung$man <- "Steven Cheung"

all <- rbind(miller, kennedy, cheung)

res <- data.frame(post = gsub("\\n", "", all$text),
                  created = all$created_at,
                  man = as.factor(all$man))
now <- format(Sys.time(), "%F-%H-%M")
write.csv(res, file=paste0("allposts_", now, ".csv"), quote=TRUE, row.names=FALSE)
