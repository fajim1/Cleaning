library(dplyr)
library(tidyr)
s_train <- read.delim("train/subject_train.txt",header = F)
y_train <- read.delim("train/y_train.txt",header = F)
X_train <- read.delim("train/X_train.txt",sep="",header = F)

s_test <- read.delim("test/subject_test.txt",header = F)
y_test <- read.delim("test/y_test.txt",header = F)
X_test <- read.delim("test/X_test.txt",sep="",header = F)

features <- read.delim("features.txt",sep="",header = F)
features <- features$V2
features <- as.character(features)
features <- c("Subjects","Activities",features)
factor(features)

train <- cbind(s_train,y_train,X_train)

test <- cbind(s_test,y_test,X_test)

all <- rbind(test,train)

colnames(all)<- c(features)

all$Activities <- factor(all$Activities)

levels(all$Activities) <- c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS',
                            'SITTING','STANDING','LAYING')

all$Subjects <- factor(all$Subjects)
levels(all$Subjects) <- c("person1","person2","person3",
                          "person4","person5","person6",
                          "person7","person8","person9",
                          "person10","person11","person12",
                          "person13","person14","person15",
                          "person16","person17","person18",
                          "person19","person20","person21",
                          "person22","person23","person24",
                          "person25","person26","person27",
                          "person28","person29","person30")

cols <- grep("Subjects|Activities|mean()|std()", names(all), value=T)
all<- all[, cols]

m<-all %>%   group_by(Subjects,Activities) %>%
summarise_all(funs(mean))
 
