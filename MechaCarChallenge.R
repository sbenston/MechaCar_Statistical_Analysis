library(dplyr)

# Import MPG data
mechacar_data = read.csv('MechaCar_mpg.csv', stringsAsFactors = F)
head(mechacar_data)

# Import Suspension data
suspension_data = read.csv('Suspension_Coil.csv', stringsAsFactors = F)
head(suspension_data)

# Multiple linear regression with all columns to predict MPG
linear_model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar_data)
summary(linear_model)

# Summarize suspension coil PSI data
total_summary <- suspension_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))