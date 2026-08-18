#!/usr/bin/env Rscript

miller <- readRDS("myman_2026-07-25-13-56.rds")
miller$indexed_at <- as.POSIXct(miller$indexed_at)
miller$created_at <- as.POSIXct(miller$created_at)
range(miller$indexed_at)
# [1] "2026-07-16 21:50:18.428999 UTC" "2026-07-24 20:37:20.128000 UTC"

kennedy <- readRDS("myman_2026-08-13-05-16.rds")
kennedy$indexed_at <- as.POSIXct(kennedy$indexed_at)
kennedy$created_at <- as.POSIXct(kennedy$created_at)
setDT(kennedy)
range(kennedy$indexed_at)
# [1] "2026-07-30 15:45:42.334000 UTC" "2026-08-13 01:59:24.530999 UTC"
range(kennedy[-c(1,2), indexed_at])
# [1] "2026-08-12 00:38:40.023999 UTC" "2026-08-13 01:59:24.530999 UTC"
