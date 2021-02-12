
# read table Austing Listings Raw Data 
austinListing.data <- read.csv(choose.files(), sep = ",", header = TRUE)
austinListing.data

#subset raw data to retain only necessary columns
newAustinListing.data <- subset(austinListing.data, select = c(id, neighbourhood, neighbourhood_cleansed, latitude, longitude, property_type, room_type,
                                                              accommodates, bathrooms_text, bedrooms, beds, amenities, price, minimum_nights, maximum_nights,
                                                              availability_90, availability_365, number_of_reviews, review_scores_rating,
                                                              review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication,
                                                              review_scores_location, review_scores_value, instant_bookable, reviews_per_month))
newAustinListing.data

#change the column names present in the new data frame to be understandable
names(newAustinListing.data)[1] <- "ID"
names(newAustinListing.data)[2] <- "City"
names(newAustinListing.data)[3] <- "Zipcode"
names(newAustinListing.data)[4] <- "Latitude"
names(newAustinListing.data)[5] <- "Longitude"
names(newAustinListing.data)[6] <- "PropertyType"
names(newAustinListing.data)[7] <- "RoomType"
names(newAustinListing.data)[8] <- "Accomodates"
names(newAustinListing.data)[9] <- "Bathrooms"
names(newAustinListing.data)[10] <- "Bedrooms"
names(newAustinListing.data)[11] <- "Beds"
names(newAustinListing.data)[12] <- "Amenities"
names(newAustinListing.data)[13] <- "Price"
names(newAustinListing.data)[14] <- "MinimumNights"
names(newAustinListing.data)[15] <- "MaximumNights"
names(newAustinListing.data)[16] <- "Availability90Days"
names(newAustinListing.data)[17] <- "Availability365Days"
names(newAustinListing.data)[18] <- "NoOfReviews"
names(newAustinListing.data)[19] <- "RatingReview"
names(newAustinListing.data)[20] <- "AccuracyReview"
names(newAustinListing.data)[21] <- "CleanlinessReview"
names(newAustinListing.data)[22] <- "CheckinReview"
names(newAustinListing.data)[23] <- "CommunicationReview"
names(newAustinListing.data)[24] <- "LocationReview"
names(newAustinListing.data)[25] <- "ValueReview"
names(newAustinListing.data)[26] <- "InstantBookable"
names(newAustinListing.data)[27] <- "ReviewsPerMonth"

#change the private half bath and half bath values to numeric ie 0.5 of Bathroom column
newAustinListing.data$Bathrooms[newAustinListing.data$Bathrooms == "Half-bath"]  <- 0.5
newAustinListing.data$Bathrooms[newAustinListing.data$Bathrooms == "Private half-bath"]  <- 0.5

# remove characters from bathroom values and change the type of the column from 'charater' to 'integer'
newAustinListing.data$Bathrooms <- as.integer(gsub('[a-zA-Z ]', '', newAustinListing.data$Bathrooms))

str(newAustinListing.data)

#remove dollar $ sign from the Price column values and change the type of the column from character to numeric(double)
newAustinListing.data$Price <- as.numeric(gsub("[\\$,]", "", newAustinListing.data$Price))
newAustinListing.data

#check for NA values in all the columns
colSums(is.na(newAustinListing.data))

#create a new data frame with eliminating the missing value records for reviews columns
cleanedAustinListing.data <- newAustinListing.data[complete.cases(newAustinListing.data[,c(19:27)]),]
cleanedAustinListing.data <- cleanedAustinListing.data[!is.na(cleanedAustinListing.data$Zipcode), ]
colSums(is.na(cleanedAustinListing.data))
View(cleanedAustinListing.data)
nrow(cleanedAustinListing.data)

#Median of columns which have NA values
bathrooms.median <- median(cleanedAustinListing.data$Bathrooms, na.rm = TRUE)
bathrooms.median

bedrooms.median <- median(cleanedAustinListing.data$Bedrooms, na.rm = TRUE)
bedrooms.median

beds.median <- median(cleanedAustinListing.data$Beds, na.rm = TRUE)
beds.median

#Imputing NA values with median value of the columns Bathrooms, Bedrooms & Beds.
cleanedAustinListing.data$Bathrooms[is.na(cleanedAustinListing.data$Bathrooms)] <- bathrooms.median

cleanedAustinListing.data$Bedrooms[is.na(cleanedAustinListing.data$Bedrooms)] <- bedrooms.median

cleanedAustinListing.data$Beds[is.na(cleanedAustinListing.data$Beds)] <- beds.median

#delete rows of amenities column which have the values as "[]".
cleanedAustinListing.data <- cleanedAustinListing.data[!(cleanedAustinListing.data$Amenities == "[]"),]
cleanedAustinListing.data

#changed the 0 value records of Bathrooms & Beds columns to respective medians of those columns.
cleanedAustinListing.data$Bathrooms[cleanedAustinListing.data$Bathrooms == "0"]  <- bathrooms.median
cleanedAustinListing.data$Beds[cleanedAustinListing.data$Beds == "0"]  <- beds.median

cleanedAustinListing.data

out.value <- boxplot(cleanedAustinListing.data$Price)$out

################################################### Hypothesis 1 #############################################################
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
# Hypothesis 1: The prices of the listings are directly proportional to different review rating parameters.
#Bar plot for comparing price of listings with AccuracyReview Ratings
AggPriceValue <- aggregate(Price ~ AccuracyReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=AccuracyReview, y=Price)) + geom_bar(stat="identity", fill="darkolivegreen") +
        scale_x_continuous(breaks=c(2, 3, 4, 5, 6, 7, 8, 9, 10), 
                           labels=c("2", "3", "4", "5", "6", "7", "8", "9", "10")) +
        xlab("Accuracy Rating") + ylab("Price") + ggtitle("Median Price of listings based on Accuracy Ratings")

#Bar plot for comparing price of listings with CleanlinessReview Ratings
AggPriceValue <- aggregate(Price ~ CleanlinessReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=CleanlinessReview, y=Price)) + geom_bar(stat="identity", fill="deepskyblue4") +
        scale_x_continuous(breaks=c(2, 3,  4, 5, 6, 7, 8, 9, 10), 
                           labels=c("2", "3", "4", "5", "6", "7", "8", "9", "10")) +
        xlab("Cleanliness Rating") + ylab("Price") + ggtitle("Median Price of listings based on Cleanliness Ratings")

#Bar plot for comparing price of listings with CheckinReview Ratings
AggPriceValue <- aggregate(Price ~ CheckinReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=CheckinReview, y=Price)) + geom_bar(stat="identity", fill="cyan3") +
        scale_x_continuous(breaks=c(2, 3,  4, 5, 6, 7, 8, 9, 10), 
                           labels=c("2", "3", "4", "5", "6", "7", "8", "9", "10")) +
        xlab("Check-in Rating") + ylab("Price") + ggtitle("Median Price of listings based on Check-in Ratings")

#Bar plot for comparing price of listings with CommunicationReview Ratings
AggPriceValue <- aggregate(Price ~ CommunicationReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=CommunicationReview, y=Price)) + geom_bar(stat="identity", fill="deeppink4") +
        scale_x_continuous(breaks=c(2, 3,  4, 5, 6, 7, 8, 9, 10), 
                           labels=c("2", "3", "4", "5", "6", "7", "8", "9", "10")) +
        xlab("Communication Rating") + ylab("Price") + ggtitle("Median Price of listings based on Communication Ratings")

#Bar plot for comparing price of listings with ValueReview Ratings
AggPriceValue <- aggregate(Price ~ ValueReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=ValueReview, y=Price)) + geom_bar(stat="identity", fill="aquamarine4") +
        scale_x_continuous(breaks=c(2, 3,  4, 5, 6, 7, 8, 9, 10), 
                           labels=c("2", "3", "4", "5", "6", "7", "8", "9", "10")) +
        xlab("Value Rating") + ylab("Price") + ggtitle("Median Price based of listings on Value Ratings")

##################################################### Hypothesis 2 #########################################################
# Hypothesis 2: The prices of the listings depend on listings' zip code, mean review, and the number of entertainments.

# read table Austing Listings Raw Data 
austinListing.data <- read.csv(file = "CleanedAustin.csv", sep = ",", header = TRUE)

austinListing.data
Hypothesis.data <- read.csv(file = "Hypothesis2.csv", sep = ",", header = TRUE)
sum(Hypothesis.data, var(zipcode))

#install dplyr
install.packages("dplyr")
library("dplyr")  

#select Austin target variables
Austin.data <- select(austinListing.data, Zipcode, Price, LocationReview)
Zipcode.median <- aggregate(x = Austin.data$Price,                # Specify data column
                            by = list(Austin.data$Zipcode),              # Specify group indicator
                            FUN = median)
Zipcode.median <- Zipcode.median %>%
        rename(
                Zipcode = Group.1,
                Median.Price = x
        )
Review.mean <- aggregate(x = Austin.data$LocationReview,                # Specify data column
                         by = list(Austin.data$Zipcode),              # Specify group indicator
                         FUN = mean)
Review.mean <- Review.mean %>%
        rename(
                Zipcode = Group.1,
                Mean.Review = x
        )


#count hypothesis zipcode and rename column name
entertain <- table(Hypothesis.data$ZIP)
sum_zipcode <- Hypothesis.data %>%
        group_by(ZIP) %>% summarise(Freq=n())
sum_zipcode <- rename(sum_zipcode, c(Zipcode = ZIP, Number_of_Entertainments = Freq))

#merge sum_zipcode and Zipcode.mean into one dataset
Zipcode <- merge(Zipcode.median, sum_zipcode, all = FALSE)
Zipcode.data <- merge(Review.mean, Zipcode, all = FALSE)

#install dbplot package
install.packages("dbplot")
library(ggplot2)

#bar plot for zipcode and median price
bar1 <- ggplot(Zipcode.data, aes(x = Zipcode, y = Median.Price, fill = Median.Price)) +                            
        geom_bar(stat="identity", color = "black") +
        geom_text(aes(label=Median.Price), position=position_dodge(width=0.5), vjust=-0.25) +
        ggtitle("Zipcode vs. Mean.Price")
bar1

#bar plot for zipcode and number of entertainments.
bar2 <- ggplot(Zipcode.data, aes(x = Zipcode, y = Number_of_Entertainments, fill = Number_of_Entertainments)) +                            # line plot
        geom_bar(color="black", fill="purple", stat = "identity") +
        geom_text(aes(label=Number_of_Entertainments), position=position_dodge(width=0.5), vjust=-0.25)+
        ggtitle("Zipcode vs. Number of Entertainments")
bar2

#bar plot for zipcode and mean review location
bar3 <- ggplot(Zipcode.data, aes(x = Zipcode, y =  Mean.Review)) +                           
        geom_line(stat = "identity", color="red", size =1.25)
bar3

##################################################### Hypothesis 3 #########################################################
# Hypothesis 3: As the count of the number of beds, bedrooms and bathrooms increase the prices increase. Room Type could also be one of the affecting factors of price.

#subset the data with variables ("PropertyType","RoomType","Bathrooms","Bedrooms","Price")
data<-cleanedAustinListing.data[,c("PropertyType","RoomType","Bathrooms","Bedrooms","Price")]
data$Bedrooms<-as.factor(data$Bedrooms)
data$Bathrooms<-as.factor(data$Bathrooms)
data$RoomType<-as.factor(data$RoomType)

View(data)

#Aggregation with median

#Aggregation with median for roomtype

AccRatemedian.data.room <- aggregate(cleanedAustinListing.data$Price, by=list(cleanedAustinListing.data$RoomType), FUN = median)
AccRatemedian.data.room

#Aggregation with median for bathroom

AccRatemedian.data.bathroom <- aggregate(cleanedAustinListing.data$Price, by=list(cleanedAustinListing.data$Bathrooms), FUN = median)
AccRatemedian.data.bathroom

#Aggregation with median for bedroom

AccRatemedian.data.bed <- aggregate(cleanedAustinListing.data$Price, by=list(cleanedAustinListing.data$Bedrooms), FUN = median)
AccRatemedian.data.bed


#Aggregation with median for beds
AccRatemedian.data.beds <- aggregate(cleanedAustinListing.data$Price, by=list(cleanedAustinListing.data$Beds), FUN = median)
AccRatemedian.data.beds

str(AccRatemedian.data.bathroom)
AccRatemedian.data.bathroom$Group.1<-as.factor(AccRatemedian.data.bathroom$Group.1)
AccRatemedian.data.bed$Group.1<-as.factor(AccRatemedian.data.bed$Group.1)
AccRatemedian.data.beds$Group.1<-as.factor(AccRatemedian.data.beds$Group.1)

#data plot


#bathroom vs median price plot

ggplot(AccRatemedian.data.bathroom, aes(x=Group.1, y=x)) + geom_bar(stat="identity", fill="steelblue")+labs(x="Bathroom",y="Price",title = "")+ylim(0, 4000)

#bedroom vs median price plot
ggplot(AccRatemedian.data.bed, aes(x=Group.1, y=x)) + geom_bar(stat="identity", fill="steelblue")+labs(x="Bedroom",y="Price",title = "enter")+ylim(0, 4000)

#roomtype vs median price plot

ggplot(AccRatemedian.data.room, aes(x=Group.1, y=x)) + geom_bar(stat="identity", fill="steelblue")+labs(x="RoomType",y="Price",title = "enter")+ylim(0, 250)

#beds vs median price plot
ggplot(AccRatemedian.data.beds, aes(x=Group.1, y=x)) + geom_bar(stat="identity", fill="steelblue")+labs(x="Beds",y="Price",title = "enter")+ylim(0, 4000)



##################################################### Hypothesis 4 #########################################################
# Hypothesis 4: Amenities can also be one of the reasons affecting the prices of the listings. If the number of amenities increases, the price of listings could also be increased. 

#subset the data 
data <- cleanedAustinListing.data[,c("City","PropertyType","Amenities","Price")]
colnames(data)

#create columns indicating "Dishwasher", "Hotwater","Cable"
data$Dishwasher <- ifelse(grepl("Dishwasher",data$Amenities),"Yes","No")
data$Hotwater <- ifelse(grepl("Hot water", data$Amenities),"Yes","No")
data$Cable <- ifelse(grepl("Cable TV", data$Amenities),"Yes","No")


#Plot a bargraph of Dishwasher against price
ggplot(data, aes(Dishwasher,Price))+
        geom_bar(stat = "summary", fun.y=mean, fill="red", col="black")+
        ggtitle("Bar Graph(Dishwasher against Price)")+
        xlab("Dishwasher")+
        ylab("Price")+
        theme_bw()

#Plot a bargraph of Hot water against price
ggplot(data, aes(Hotwater,Price))+
        geom_bar(stat = "summary", fun.y=mean, fill="green", col="black")+
        ggtitle("Bar Graph(Hot Water against Price)")+
        xlab("Hot water")+
        ylab("Price")+
        theme_bw()

#Plot a bargraph of Cable against price
ggplot(data, aes(Cable,Price))+
        geom_bar(stat = "summary", fun.y=mean, fill="blue", col="black")+
        ggtitle("Bar Graph(Cable against Price)")+
        xlab("Cable")+
        ylab("Price")+
        theme_bw()
