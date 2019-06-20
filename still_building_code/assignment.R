placement <- cooker
new <- NULL


for(h in 1:max(placement$i)){
  if(sum(placement$i == h) == 0) next
  holding   <- subset(placement, placement[,1] == h)
  interest  <- holding[,2]
  for(g in interest){
    cluck   <- subset(placement, placement[,1] == g)
    if(dim(cluck)[1] == 0) break
    cluck$group <- h
    new <- rbind(new, cluck)
    placement <- subset(placement, placement[,1] != g)
    }
}

placement$group <- placement$i
groupings <- rbind(placement, new)



s <- smalls_calc(groupings)

gg <- t(apply(groupings, 1, group_little, smalls = s))


short <- unique(gg[,c(1,4)])
length(unique(gg[,1]))
dim(unique(gg[,c(1,4)]))


fil$Group <- NULL
tf <- fil$X %in% gg[,1]
head(tf)
fil[tf, 'Group'] <- short[,2]


head(gg)
unique(gg[,2]) %in% unique(gg[,1])




