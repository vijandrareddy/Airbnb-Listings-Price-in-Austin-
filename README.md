# Airbnb-Listings-Price-in-Austin-

Data Preprocessing steps:
• Dataset Import and Summarization:
All the required datasets are imported to RStudio. One of them is Austin Listing’s dataset and
consisted of 10422 records. Datasets have been explored and summarized based on the
dimensions and data types of the variables.
• Dropped undesirable and retained desirable columns:
Few columns have been dropped off and useful columns for the analysis have been retained from
the Austin Listing’s dataset using subset function.
• Transformed Column Names:
All the column names in the datasets have been modified to be meaningful.
• Added missing values to City:
The city column did consist of many missing values, have added them manually to the sheet as
it cannot be done through RStudio.
• Merged Datasets:
Merged Austin Listing and Entertainment Datasets using inner join based on “Zipcode”.
• Handled Null Values:
The majority of the missing values were associated with the review’s columns. As imputing the
missing values for these columns did not seem feasible, have decided to remove them. The zip
code column did consist of a single record missing value and have removed it. Missing records
from the amenity’s column have been removed as they were in fewer numbers.
• Transformed Bathroom Column Values:
Bathroom values have been transformed to reflect integer type as they were the character. Have
truncated the character values. Earlier the values were 1 Bath, 2 Bath, etc. so have decided to
truncate the character part of the value to retain just the integer number.
Have modified “Half-bath” & “Private Half-bath” values to “0.5” integer value.
• Transformed Price Column Values:
The price values were ‘$’ followed by integer numbers. The datatype of the price column was
Character. Truncated the ‘$’ character from the value to retain just the number and have modified
the data type to be double.

• Imputed missing column values:
Bathrooms, Bedrooms,and Beds consisted of a fewer number of missing records, so have imputed
them with a median value of respective columns.
Bathrooms and Beds did consist of “0” value records, as this seemed to be illogical have imputed
those values also with a median of respective columns.
• Transformed Amenities column values:
Amenities column values had been divided into 3 separate columns to store values for
Dishwasher, Cable, and Hot Water. After diving, have assigned values as “Yes” or “No” to the
respective columns, if they existed in the main Amenities column values.
• Installed additional packages:
To present and portray our data effectively, we installed a few additional packages to R such as
dplyr, ggplot2, etc.
Problem Statement:
The primary interpretation of the dataset indicates that the price of the listings may be linearly related
to certain factors present in the data. In an attempt to elucidate the interrelationship, a four barbed
approach is being accompanied by formulating four distinct hypotheses.
The first hypothesis states that “The prices of the listings are directly proportional to the review
parameters.” To describe it clearly, we have considered each review parameter concerning the price of
the listings and compared them to see if they were related. This explains which all review parameters are
tied to the price of the listing’s and why they were related.
Moving ahead with the goal, we started exploring various factors available to us. A few of them helped
us to construct our second hypothesis stating, “The prices of the listings are influenced by the
neighborhood location.” The locality is considered as one of the important factors influencing the price
of the listings. If the listing is located centrally within easy reach of stores, restaurants, and tourist
attractions the listing is likely to be priced higher. Interrelated location parameters are used to know why
the prices of the listings are connected to locations.
In general, “Number of Bathrooms, Bedrooms, beds and Room Type of listing’s property is also
considered as the important factors in estimating the price of the listings”. This assumption led to the
third hypothesis of the goal. As the number of bathrooms, bedrooms, beds increase, a greater number of 

people can be accommodated and in turn, leads to an increase in the price of the listing. Likewise, Room
Type such as Entire Home/Apartment, Hotel Room, Private Room, and Shared Room also affects the
price of listings. The mentioned factors are in direct proportion to the price of the listings. So, we have
decided to explore the prices based on the above-mentioned factors to see, if they are related or not.
Conclusively, we decided to come up with the last hypothesis which dealt with the amenities of the
listings. Renting an Airbnb which is family/kid friendly is an utmost concern for the families. Amenities
of a listing play an important role to decide the price factor. A listing with beyond and above required
amenities will be priced higher than a listing with basic amenities. We wanted to explore and see if
amenities are playing an important in deciding the price factor of a listing.
Hypothesis 1:
The prices of the listings are directly proportional to different review rating parameters.
The first hypothesis helps us to decide which review rating parameters are associated with the prices of
the listings. It decides about an impact on the price when ratings fluctuate.
Rationale:
Reviews are vital for the entire Airbnb community, helping guests to wisely choose their travel plans and
encouraging hosts to open their homes with optimism and attract guests who will enjoy their stay. Each
review lets guests determine whether to book a listing or not and Airbnb data suggests that a greater
number of positive reviews are associated with a higher listing’s price.
Exploration:
To explore the hypothesis, Price has been aggregated based on each Review Ratings. As there are outliers,
the median has been used to aggregate the data. After aggregation, a bar chart was used to compare the
prices of the listings based on each review rating for different review parameters.
Median price by Accuracy Review Ratings
Code Snippet for the below visualization:

AggPriceValue <- aggregate(Price ~ AccuracyReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=AccuracyReview, y=Price)) + geom_bar(stat="identity",
fill="darkolivegreen") + scale_x_continuous(breaks=c(2, 3, 4, 5, 6, 7, 8, 9, 10), labels=c("2", "3", "4", 
"5", "6", "7", "8", "9", "10")) + xlab("Accuracy Rating") + ylab("Price") + ggtitle("Median Price of listings
based on Accuracy Ratings")


The above graph depicts that Accuracy Rating 4 has the highest median price and the Rating 5 takes the
least place. It is clear that none of the Accuracy Ratings are in proportion with the price of the listings.
Since Accuracy Rating did nothelp us to get a clear picture about the correlation, we had further explored
the remaining review rating parameters.
Median price by Cleanliness Review Ratings

Code Snippet for the below visualization:
AggPriceValue <- aggregate(Price ~ CleanlinessReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=CleanlinessReview, y=Price)) + geom_bar(stat="identity",
fill="deepskyblue4") + scale_x_continuous(breaks=c(2, 3, 4, 5, 6, 7, 8, 9, 10), labels=c("2", "3", "4", "5",
"6", "7", "8", "9", "10")) + xlab("Cleanliness Rating") + ylab("Price") + ggtitle("Median Price of listings
based on Cleanliness Ratings")


Cleanliness Rating 5 has the highest median price of the listing, whereas Rating 4 has the least median
price compared to the other ratings. The interesting fact is that none of the listings are rated as 3. There
are “0” listings with a rating of 3. The above graph also clearly gives us the information that Cleanliness
Ratings are not at all related to the listing’s prices.
Median price by Check-in Review Ratings

Code Snippet for the below visualization:
AggPriceValue <- aggregate(Price ~ CheckinReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=CheckinReview, y=Price)) + geom_bar(stat="identity", fill="cyan3") +
scale_x_continuous(breaks=c(2, 3, 4, 5, 6, 7, 8, 9, 10), labels=c("2", "3", "4", "5", "6", "7", "8", "9",
"10")) + xlab("Check-in Rating") + ylab("Price") + ggtitle("Median Price of listings based on Check-in
Ratings")


Check-in Ratings of 2 and 9 have the highest median price of the listings. Listing with Check-In rating
of 10 has a lower price than the one with a check-in rating of 2. As per the graph, we can say that there
is no correlation between the median price and the check-in ratings.
Median price by Communication Review Ratings

Code Snippet for the below visualization:
AggPriceValue <- aggregate(Price ~ CommunicationReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=CommunicationReview, y=Price)) + geom_bar(stat="identity", 
fill="deeppink4") + scale_x_continuous(breaks=c(2, 3, 4, 5, 6, 7, 8, 9, 10), labels=c("2", "3", "4", "5",
"6", "7", "8", "9", "10")) + xlab("Communication Rating") + ylab("Price") + ggtitle("Median Price of
listings based on Communication Ratings")

Per the above graph listings with rating 3 and 5 has higher prices than the ones with 9, 10 and other
ratings. So, there is no direct relationshipbetween the price of the listing and the communication ratings.
Median price by Value Review Ratings

Code Snippet for the below visualization:
AggPriceValue <- aggregate(Price ~ ValueReview, cleanedAustinListing.data, median)
ggplot(AggPriceValue, aes(x=ValueReview, y=Price)) + geom_bar(stat="identity", fill="aquamarine4") +
scale_x_continuous(breaks=c(2, 3, 4, 5, 6, 7, 8, 9, 10), labels=c("2", "3", "4", "5", "6", "7", "8", "9",
"10")) + xlab("Value Rating") + ylab("Price") + ggtitle("Median Price based of listings on Value Ratings")

Value Rating of 4 comprised of highest median price whereas rating 3 takes the least place. None of the
ratings are by the median price of the listings. As per the above graph, we can conclude that there is no
correlation between the price and the value ratings.

Key Learnings:
With the data available and from the above graphs, it is depicted that none of the review rating
parameters correlated with the median price of the listings. Not a single review parameter did help to 
support the hypothesis, with that being analyzed our first hypothesis is disproved. As review rating
parameters are now not in the scope of our project, we had decided to further explore available and other
factors, to see if the price of the listings is dependent on them.

Hypothesis 2:
The prices of the listings depend on listings’ zip code, mean review, and the number of entertainments.
Rationale:
Locality could be one of the important factors influencing the price of listings. If the listing is located
centrally, within easy reach of stores, restaurants, and tourist attractions, the listing is likely to be priced
higher.
Location review and number of entertainments around the area matter to the price of listings as well.
People will also check those before booking their places to stay.
Exploration:
In this exploration, we found an Austin hypothesis dataset with cultural assets in each zip code. We
started with aggregating median prices of listings based on each zip code. For a better understanding of
how many entertainments they have in each zip code, we used group_by and summarize functions to
calculate it. After that, we merged these two datasets using inner join. Three bar plots were made below
to compare the median price of listings, mean location review of listings, and the number of
entertainments based on each zip code.
Median Price of listings concerning Zipcodes

Code Snippet for the below visualization:
Austin.data <- select(Austin listings.data, Zipcode, Price, LocationReview)
Zipcode.median <- aggregate(x = Austin.data$Price, by = list(Austin.data$Zipcode), FUN = median)
bar1 <- ggplot(Zipcode.data, aes(x = Zipcode, y = Median.Price, fill = Median.Price)) +
geom_bar(stat="identity", color = "black") + geom_text(aes(label=Median.Price),
position=position_dodge(width=0.5), vjust=-0.25) + ggtitle("Zipcode vs. Mean.Price")


Before we created graphs for this hypothesis, we have done some research and found that listings in
Austin downtown are more expensive than in other areas. According to the Austin Business Journal, we
noticed that 78746, 78733, 78703, 78730, and 78732 are the top 5 wealthiest zip codes. To see if the
listing price does affect by zip codes. We used a bar plot, with zip codes as X-axis and median price of
listings as Y-axis.The analysis on zip code related to a median price of listings shows that zip code 78732 has the highest
median listing price, followedby 78733, 78734, 78746, and 78701. As we mentioned before, the wealthiest
zip codes have higher median listing price than others. However, we observed that our hypothesis II is
true, except for some certain zip codes (78730). We could also see that there were several zip codes have
lower prices in some areas. For instance, zip code 78725, 78748, 78729, 78753, and 78754 have the lowest
median listing price in Austin with a range from $50 to $58.50.
The number of entertainments of the listings in each Zipcodes

Code Snippet for the below visualization:
Austin.data <- select(Austin listings.data, Zipcode, Price, LocationReview)
entertain <- table(Hypothesis.data$ZIP) sum_zipcode <- Hypothesis.data %>% group_by(ZIP) %>%
summarise(Freq=n())
sum_zipcode <- rename(sum_zipcode, c(Zipcode = ZIP, Number_of_Entertainments = Freq))
Zipcode <- merge(Zipcode.median, sum_zipcode, all = FALSE)
Zipcode.data <- merge(Review.mean, Zipcode, all = FALSE)
bar2 <- ggplot(Zipcode.data, aes(x = Zipcode, y = Number_of_Entertainments, fill =
Number_of_Entertainments)) +
geom_bar(color="black", fill="purple", stat = "identity") +
geom_text(aes(label=Number_of_Entertainments), position=position_dodge(width=0.5), vjust=-0.25) +
ggtitle("Zipcode vs. Number of Entertainments")

Now we know areas have the highest median price of listings are in zip code 78732, 78733, 78734, 78746,
and 78701. Next, we wanted to see whether those areas have higher attractions or the number of
entertainments.
From the above graph, we noticed that zip code 78701, 78702, and 78704 are the top three areas that
have higher attractions/ more things to do in Austin than in another area. We also found out that zip
code 78701 is in downtown Austin, and the other two are in east Austin and central Austin. The median
prices in those areas are affordable and close to attractions. The median of listing prices of the areas with
a lower number of entertainments varies from one zip code to another. 


The mean of location review of the listings in each Zipcode


Code Snippet for the below visualization:
Austin.data <- select(austinListing.data, Zipcode, Price, LocationReview)
Zipcode <- merge(Zipcode.median, sum_zipcode, all = FALSE)
Zipcode.data <- merge(Review.mean, Zipcode, all = FALSE)
bar3 <- ggplot(Zipcode.data, aes(x = Mean.Review, y = Median.Price)) +
geom_line(stat = "identity", color="red", size =1.25)

The mean location review of the listings could also be one of the factors that affect the price of listings.
Looking at the above graph, these listings have a stable and decent mean of location reviews in Austin.
The mean review is ranked on a scale of 1 to 10. By sorting reviews from the highest to lowest, we
observed that zip code 78712 is ranked the highest mean location review and has 19 entertainments with
a $141.50 median price of listings. The other two zip codes 78704 and 78701 have a great review and top
2 things to do in Austin.
Key Learnings:
Through the above graphs, we may conclude that zip codes, location reviews, and the number of
entertainments located in each zip code are affecting listings’ prices. The top 5 wealthiest zip codes have
higher prices than other areas, and the downtown area has the highest number of entertainments and 
decent prices compare to other wealthiest zip codes. However, the most expensive listings area has fewer
places to entertain. The meanlocation reviews are stable and high in Austin. People prefer to stay in the
downtown area where is close to other attractions and has affordable listings price.


Hypothesis 3:
As the count of the number of beds, bedrooms and bathrooms increase the prices increase. Room Type
could also be one of the affecting factors of price.
Rationale :
The number of people staying together during a trip will choose the type of room that can accommodate
them and the comfort they need during their stay. Based on the room type, the number of bedrooms,
beds, and bathrooms, the listings are likely to be priced higher.
Exploration:
As there were huge amounts of data, we started with aggregating median prices of listings based on the
number of beds,bedrooms,bathrooms, and room type. Four bar plots were made to compare the median
price of the listings concerning the above-mentioned variables.
Price vs Room Type

Code Snippet for the below visualization:
ggplot(AccRatemedian.data.room, aes(x=Group.1, y=x)) + geom_bar(stat="identity",
fill="steelblue")+labs(x="RoomType",y="Price",title = "enter")+ylim(0, 250)


From the graph we can see that hotel room has the highest price with a median of $225 as it is not
controlled by Airbnb and the rate of the hotel room is decided by the hotel and if a customer books a
hotel room through Airbnb the hotel gets the price and a commission will be sent to the Airbnb. While
registering a hotel with Airbnb the owner provides the Airbnb with all the details and provide them with
the base rate and all the details and based on the market trends and the season Airbnb decides the price
of the hotel room. As the hotel room has all the services when requested the prices of the hotel room
may be higher. The next highest median pricing which is closer to the hotel is the Entire home/apt which
means the guests will have the whole place to themselves with the highest median pricing of $150. The
price may also vary on the number of bedrooms, bathrooms, and amenities during the stay. Private room
and the shared room has the least median prices compared to a hotel and entire home/apt as private
room means the guests could have their own one private room for sleeping and all the other area in the
entire home/apt can be shared among other guest’s staying in that home/apt and it has median avg
pricing of $55. A shared room is the least expensive with an avg median pricing of only $25 which means
Guests sleep in a bedroom or a common area that could be shared with others. Based on the type of
place the guest chooses to stay and the number of people staying with them the pricing of the listings
may vary. 


Price vs No. of Beds

Code Snippet for the below visualization:
ggplot(AccRatemedian.data.beds, aes(x=Group.1, y=x)) + geom_bar(stat="identity",
fill="steelblue")+labs(x="Beds",y="Price",title = "enter")+ylim(0, 4000)

The above bar graph represents the median price for the number of beds in each Airbnb listing. We can
observe that the 39 number of beds has the highest median price of $3,200 per night. According to the
dataset, 22,26,19 beds have a relatively same price of $1,700-$1900. Apart from this as the number of
beds increases in an Airbnb the price also increases relatively. For example, if there is an event taking
place nearby the listing, people from a particular group/family consisting of 10 members want to stay
together in a room they will be paying nearly $500 for the room which consists of 10 beds, and if they
are only people of 2 they will be just paying around $150 for the room which consists of 2 beds.

Price vs No of Bedrooms

Code Snippet for the below visualization:
ggplot(AccRatemedian.data.bed, aes(x=Group.1, y=x)) + geom_bar(stat="identity",
fill="steelblue")+labs(x="Bedroom",y="Price",title = "enter")+ylim(0, 4000)

The graph represents the median price concerning the number of bedrooms in an Airbnb. We can
observe that a listing with 15 bedrooms has the highest median price of $3200 and followed by 13
bedrooms which have the second-highest listing median price of $2,200. The listings with 7, 8, and 12
bedrooms have almost the same median price ranging from 1000$-1500$. Overall, we can observe from
the graph that the price is steadily increasing. As the number of bedrooms increases the prices also
increase.

Price vs No of Bathroom’s

Code Snippet for the below visualization: 
ggplot(AccRatemedian.data.bathroom, aes(x=Group.1, y=x)) + geom_bar(stat="identity",
fill="steelblue")+labs(x="Bathroom",y="Price",title = "")+ylim(0, 4000)

The above bar graph represents the median price concerning the number of bathrooms in each listing.
We can observe that the listing with 10 bathrooms has the highest median price of $3200 followed by
listings with 8 and 9 bathrooms.The listings with 5, 6, and 7 bathrooms almost have the same amount of median price which ranges
between $1000-$1500. Overall, we can observe from the graph that as the number of bathrooms in a
listing increases the price also increase.Key learning’s From the above graphs, we can conclude that the price increases as the number of bedrooms, bedrooms,
and bathrooms increases. The hotel room has the highest price compared to other room types as it has
all the services. The entire home/apt has the second-highest price as the guests will have the entire place
for themselves.

Hypothesis 4: 
Amenities can also be one of the reasons affecting the prices of the listings. If the number of amenities
increases, the price of listings could also be increased. The fourth hypothesis helps us to decide which
amenities are related to the increase in the price of listings. It decides the impact of price on amenities.
Rationale:
Amenities include items such as dishwashers, cooking, heating, cooling, television, and so on. Generally,
all the products can help a guest stay more relaxed. By providing various amenities in an Airbnb listing,
there could be an increase in the number of bookings which might be associated with an increase in the
price of listings.
Exploration:
To explore the hypothesis, amenities column values are divided into three different columns such as
“Dishwasher”, “Cable” and “Hot Water”. The median price has been aggregated based on each of these
amenities. As there are outliers, the medianhas been used to aggregate the data. After aggregation, a bar
chart was used to compare the prices of the listings based on amenities.
Price by Dishwasher

Code Snippet for the below visualization:
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

There is a positive relationship between the availability of Dishwasher and the Price charged for a
Property. The properties with Dishwashers have higher prices compared to those that do not have a
dishwasher.

Price by Hot water

Code Snippet for the below visualization:
#Plot a bargraph of Hot water against price
ggplot(data, aes(Hotwater,Price))+
geom_bar(stat = "summary", fun.y=mean, fill="green", col="black")+
ggtitle("Bar Graph(Hot Water against Price)")+
xlab("Hot water")+
ylab("Price")+
theme_bw()


There is a slight negative relationship between the availability of Hot water and the median price
charged for a listing. The listings with hot water are generally cheaper as compared to those that do
not have Hot water.
Price by cable TV

Code Snippet for the below visualization:
#Plot a bargraph of Cable against price
ggplot(data, aes(Cable,Price))+
geom_bar(stat = "summary", fun.y=mean, fill="blue", col="black")+
ggtitle("Bar Graph(Cable against Price)")+
xlab("Cable")+
ylab("Price")+
theme_bw()

Outcomes/Insights

All the analysis which we performed led us to understand that there is no specific strategy that can be
used to interpret the prices of listings. Few factors helped us to interpret that price of listings are
dependent on them whereas few were not. Including the amenities which would be useful to the Airbnb
customers will definitely lead to price increment of the listings. We expected customer review ratings
would have an impact on the prices but to our surprise, they did not show any impact. We assumed that
location of the listings, and number of people who can be accommodated in the property type will have
an impact on the prices of the listings and it turned out to be the same.

Conclusion

With these being analyzed, we decided to make use of our project data available to the guests or tourists
who would travel to Austin Texas. This may help them to decide where to book the Airbnb listing or
not. All the information associated with factors affecting the prices of the listings would be available to
them. We hope all our analysis would be helpful in some or other way, but we cannot guarantee that
this is the best way to decide whether to book a listing or not.



 
