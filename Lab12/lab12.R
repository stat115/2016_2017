library(readr)
srt <- read_csv("~/Documents/OneDrive/CBQG/TA/BIO512/lab_hw6/srt.csv")


#Part 1: Log-Rank Tests
#Summarize by treatment group
summary(srt[srt$sorb==0,])
summary(srt[srt$sorb==1,])

#Set up survival analysis
library(survival)
survobj = Surv(srt$fup,srt$status)
model1 = survfit(survobj~sorb,data=srt)

#Plot Kaplan-Meier estimate and test using Log-Rank test
plot(model1,col=c(2,3)) #I would suggest you add a legend, title, axes etc.

survdiff(survobj~sorb,data=srt)

#Part 2: Cox Proportional Hazards Models

#Full Cox Model
model2 = coxph(survobj~sorb+tgh+dur+sex,data=srt)

#Full model minus sex
model3 = coxph(survobj~sorb+tgh+dur,data=srt)

#Likelihood Ratio Test to see if Sex is independent predictor
library(lmtest)
lrtest(model3,model2)

#Interaction model
model4 = coxph(survobj~tgh+dur+sex*sorb,data=srt)

lrtest(model4,model2)

#Testing proportionality assumption
cox.zph(model2)
