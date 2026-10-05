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

lutnick <- readRDS("myman_2026-08-28-15-01.rds")
lutnick$indexed_at <- as.POSIXct(lutnick$indexed_at)
lutnick$created_at <- as.POSIXct(lutnick$created_at)
range(lutnick$indexed_at)
# [1] "2026-08-27 20:48:20.727999 UTC" "2026-08-28 19:02:07.825999 UTC"
lutnick$man <- "Howard Lutnick"

bessent <- readRDS("myman_2026-08-31-22-09.rds")
bessent$indexed_at <- as.POSIXct(bessent$indexed_at)
bessent$created_at <- as.POSIXct(bessent$created_at)
range(bessent$indexed_at)
# [1] "2026-08-30 21:02:13.326999 UTC" "2026-09-01 01:48:50.105999 UTC"
bessent$man <- "Scott Bessent"


mullin <- readRDS("myman_2026-09-06-07-18.rds")
mullin$indexed_at <- as.POSIXct(mullin$indexed_at)
mullin$created_at <- as.POSIXct(mullin$created_at)
range(mullin$indexed_at)
# [1] "2026-09-04 15:11:40.282000 UTC" "2026-09-05 23:33:27.180999 UTC"
mullin$man <- "Markwayne Mullin"
dim(mullin)

vance <- readRDS("myman_2026-09-13-06-55.rds")
vance$indexed_at <- as.POSIXct(vance$indexed_at)
vance$created_at <- as.POSIXct(vance$created_at)
range(vance$indexed_at)
# [1] "2026-09-12 18:11:44.983999 UTC" "2026-09-13 02:23:24.279999 UTC"
vance$man <- "JD Vance"
dim(vance)

hegseth <- readRDS("myman_2026-09-17-10-34.rds")
hegseth$indexed_at <- as.POSIXct(hegseth$indexed_at)
hegseth$created_at <- as.POSIXct(hegseth$created_at)
range(hegseth$indexed_at)
# [1] "2026-09-16 17:05:17.792 UTC" "2026-09-17 14:30:57.184 UTC"
hegseth$man <- "Pete Hegseth"
dim(hegseth)

luckey <- readRDS("myman_2026-10-03-06-24.rds")
luckey$indexed_at <- as.POSIXct(luckey$indexed_at)
luckey$created_at <- as.POSIXct(luckey$created_at)
range(luckey$indexed_at)
# [1] "2026-10-01 22:51:22.280999 UTC" "2026-10-02 16:11:18.888000 UTC"
luckey$man <- "Palmer Luckey"
dim(luckey)

musk <- readRDS("myman_2026-10-05-06-07.rds")
musk$indexed_at <- as.POSIXct(musk$indexed_at)
musk$created_at <- as.POSIXct(musk$created_at)
range(musk$indexed_at)
# [1] "2026-10-04 18:52:04.487999 UTC" "2026-10-05 01:38:08.476999 UTC"
musk$man <- "Elon Musk"
dim(musk)



all <- rbind(miller, kennedy, cheung, lutnick, bessent,
             mullin, vance, hegseth, luckey, musk)
dim(all)
res <- data.frame(post = gsub("\\n", "", all$text),
                  created = all$created_at,
                  man = as.factor(all$man))
now <- format(Sys.time(), "%F-%H-%M")
write.csv(res, file=paste0("allposts_", now, ".csv"), quote=TRUE, row.names=FALSE)
