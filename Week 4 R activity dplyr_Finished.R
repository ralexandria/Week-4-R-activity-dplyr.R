#Week 4: dplyr package
get_titanic_data <- function() 
data("Titanic",package="datasets")
titanic_df<-as.data.frame(Titanic)
Sunkenship<-as.data.frame(Titanic)
#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice

head(Sunkenship)
#TASK: Write the function to see the top rows of the data

install.packages("dplyr")
library(dplyr)
#TASK: Write the functions to install and call dplyr

Sunkenship %>%
  select(Survived,Sex)
#Task: Write the function to 'select' the Survived and Sex columns

SSX<-as.data.frame(Sunkenship)%>% 
  select(Survived, Sex)
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

SSX%>%
  select(-Sex)
#Write the function that deselects the sex column

SSX<-SSX %>% 
  rename(Gender=Sex)
#TASK: Write the function that renames 'Sex' to 'Gender'

new_SSGender<-SSX
#TASK: Write the function that names a new dataset that includes the 'gender' column

male_data<-filter(new_SSGender,Gender=="Male")%>% 
select(Gender)
#TASK: Write the function that includes only rows that are 'male'

Sorted_new_gender<-new_SSGender%>% 
    group_by(Gender)%>% 
    arrange(Gender)
#TASK: Write the function to group the data by gender (hint: arrange())

Total_Freq<-sum(titanic_df$Freq)
#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:2201

female_data<-filter(new_SSGender,Gender=="Female")%>% 
  select(Gender)
#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'

joined_mf_data<-bind_rows(male_data,female_data)
#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

crew_data <- titanic_df %>% filter(Class == "Crew")
crew_Survived_summary <- crew_data %>% 
  group_by(Sex) %>% 
  summarize(total_survived = sum(as.numeric(Survived)))
#I have used the summarize function to try and find the total number of survivors who were crew members
#Optional Task: add any of the other functions 
#you learned about from the dplyr package

