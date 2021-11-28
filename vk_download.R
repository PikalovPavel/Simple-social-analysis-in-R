token <- "YOUR_TOKEN"
group_id <- 141931080
group_members_raw <- vkGetGroupMembers(
    group_id = group_id, 
    access_token = token
)
group_members <- select(group_members_raw, id)
group_members$from = group_id

saveFriends <- function(x){
    tryCatch(
        expr = {
		  friends <- vkGetUserFriends(user_id = x, access_token = token)
		  friends_ids <- select(friends, id)
		  friends_ids["from"] <- user_id
		  write.table(friends_ids, "result", append = TRUE, row.names = F)
        },
        error = function(e){
            print(e)
        }
    )    
}

for(i in 1:nrow(group_members)) {
        friend <- group_members[i,]
        user_id <- friend$id
        Sys.sleep(0.8)
       	saveFriends(user_id)
}



