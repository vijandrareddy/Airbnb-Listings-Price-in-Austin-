# Airbnb-Listings-Price-in-Austin-

Overview:

Airbnb is evolved as an online marketplace due to its popularity of network growth and sharedeconomies. The online company expanded to have more than 160,000,000 guests in 191 countries since
its establishment in 2008. It is letting people rent out their properties and rooms by providing affordable
accommodations. Airbnb provides millions of places to stay and tens of thousands of handcrafted events,
all fueled by local hosts, in the business of connections. Airbnb has helped millions of hosts entertain
visitors by offering innovative travel experiences as an economic empowerment driver. Austin, Texas is
a southern city that keeps making headlines. The city to visit in America was recently voted No. 1 and
was picked to remain among the top 15 cities in the US.

Dataset Source:

Airbnb Listings
We collected the Austin Listings dataset from InsideAirbnb.com. It is a CSV file that includes 74
variables and 10433 listings. We cleaned and created a new dataset with 27 variables for our hypothesis.
The target variables are Accuracy Rating, Cleanliness Review, Check-In Rating, Communication Rating,
Value Rating, Zip code, Location Review, Price, Beds, Bedrooms, Bathrooms, Room Type, and Amenities
(Dishwasher, Hot water, Cable TV, and so on).

Source: http://insideairbnb.com/get-the-data.html

Austin Arts & Cultural Facilities- CAMP

The Austin Arts & Cultural Facilities- CAMP was retrieved from data.austintexas.gov (Rempe 2020). It
is a list of how many cultural assets in the Austin area. The dataset consists of 16 variables and 1072
rows. We only used zip code for this dataset and counted the number of entertainments in each zip code.

Source: https://data.austintexas.gov/Recreation-and-Culture/Arts-Cultural-Facilities-CAMP-CulturalAsset-Mappi/8kxv-xaqc
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
approach is being accompanied by formulating four distinct hypotheses.The first hypothesis states that “The prices of the listings are directly proportional to the review
parameters.” To describe it clearly, we have considered each review parameter concerning the price ofthe listings and compared them to see if they were related. This explains which all review parameters aretied to the price of the listing’s and why they were related .Moving ahead with the goal, we started exploring various factors available to us. A few of them helped us to construct our second hypothesis stating, “The prices of the listings are influenced by the
neighborhood location.” The locality is considered as one of the important factors influencing the price
of the listings. If the listing is located centrally within easy reach of stores, restaurants, and tourist
attractions the listing is likely to be priced higher. Interrelated location parameters are used to know why
the prices of the listings are connected to locations.In general, “Number of Bathrooms, Bedrooms, beds and Room Type of listing’s property is also
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


Hypothesis 2:

The prices of the listings depend on listings’ zip code, mean review, and the number of entertainments.

Rationale:

Locality could be one of the important factors influencing the price of listings. If the listing is located
centrally, within easy reach of stores, restaurants, and tourist attractions, the listing is likely to be priced
higher.Location review and number of entertainments around the area matter to the price of listings as well.
People will also check those before booking their places to stay.


Hypothesis 3:

As the count of the number of beds, bedrooms and bathrooms increase the prices increase. Room Type
could also be one of the affecting factors of price.

Rationale :

The number of people staying together during a trip will choose the type of room that can accommodate
them and the comfort they need during their stay. Based on the room type, the number of bedrooms,
beds, and bathrooms, the listings are likely to be priced higher.

Hypothesis 4: 

Amenities can also be one of the reasons affecting the prices of the listings. If the number of amenities
increases, the price of listings could also be increased. The fourth hypothesis helps us to decide which
amenities are related to the increase in the price of listings. It decides the impact of price on amenities.

Rationale:

Amenities include items such as dishwashers, cooking, heating, cooling, television, and so on. Generally,
all the products can help a guest stay more relaxed. By providing various amenities in an Airbnb listing,
there could be an increase in the number of bookings which might be associated with an increase in the
price of listings.


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



 
