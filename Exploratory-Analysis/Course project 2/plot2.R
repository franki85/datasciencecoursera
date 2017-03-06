# Subset NEI data by Baltimore's fip.
baltimoreEmisssion <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimorebaltimoreEmisssion ,sum)

png('plot2.png')

barplot( aggTotalsBaltimore$Emissions, names.arg=aggTotalsBaltimore$year, xlab="Year", ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From Baltimore City Sources")

dev.off()
