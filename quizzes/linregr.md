

1. A scatter plot shows points closely clustered around an upward-sloping 
fitted line, obtained by correlation analysis. What does this pattern 
most likely indicate?
  
A. A strong positive relationship between variables   X
B. A strong negative relationship between variables
C. No relationship between variables
D. The model is nonlinear

2. In a scatter plot, the fitted line slopes downward and the points are 
widely scattered around the line. What can be concluded?
  
A. A strong positive relationship exists
B. A strong negative relationship exists
C. A weak positive relationship exists
D. A weak negative relationship exists  X

Interpret correlation coefficients
3. A correlation coefficient of r = −0.85 indicates:
  
A. A strong positive relationship
B. A weak positive relationship
C. A strong negative relationship   X
D. No relationship

4. Which correlation value is most likely for a scatterplot where the value on 
the x-axis is always close to double the value on the y-axis for every observation?
  
A. r = −2
B. r = -0.5
C. r = -0.95  X
D. r = -0.45

Interpret the components of the formula for a straight line

5. In the regression equation ŷ = 3.5 + 2.1x, what does 3.5 represent?
  
A. The error term
B. The slope of the line
C. The predicted value of y when x = 0   X
D. The correlation between x and y

6. In the equation ŷ = β₀ + β₁x, what does β₁ describe?
  
A. The average error of prediction
B. The change in y for a one-unit change in x    X
C. The value of y when x = 0
D. The correlation between x and y

7. A residual is defined as:

A. The difference between the observed y and the predicted y   X
B. The fitted line on a scatter plot
C. The slope of the regression line
D. The error in measuring x

8. If a point lies far above the fitted line, its residual will be:
  
A. Close to zero
B. Large and positive   X
C. Large and negative
D. Undefined

8. If a point lies far above the fitted line, the model:
  
A. Overestimates that observation
B. Underestimates that observation   X
C. Excludes that observation as an outlier
D. Overestimates all observations


9. A simple linear regression finds that β₁ = 4.2 with p < 0.01. What does this indicate?
  
A. The slope is not significantly different from zero
B. For every 1-unit increase in x, y increases by about 4.2 units  X
C. The relationship between variables is weak
D. x does not predict y

10. In a simple regression, R² = 0.62. How should this be interpreted?
  
A. 62% of the variability in y is explained by x   X
B. x perfectly predicts y
C. 62% of the variability in x is explained by y
D. The model is not significant

11–12. Interpret a multiple linear regression result
11. In a multiple regression model, the coefficient for 
coefficient for x1 is β1 = 4.2 (p = 0.01) and for x2 is β2 = −1.7 (p = 0.03).
What does this mean?
  
A. x1 and x2 has an effect of 2.5 on y
B. After controlling for other variables, x2 is associated with a decrease in y   X
C. x2 decreases y by 1.7 units, independent of other variables
D. x2 decreases x1 by 1.7

12. A multiple regression model reports R² = 0.80 and adjusted R² = 0.76. 
What is the best interpretation?
  
A. The model likely overfits badly
B. The predictors explain 80% of the variance, and the adjusted R² accounts 
for the number of predictors   X
C. The model explains only 4% of the variance, as the adjusted R² accounts for 
overfitting
D. The predictors are significant as the difference in R² and adjusted R² is 
less than 5%



Differential gene expression questions

Read the Methods and Results section 3.1 (including figure 2) from Clancy 2023, 
and the paragraph below, which explains how the edgeR R package performs 
differential gene expression.  

edgeR analyzes RNA-seq data by modeling the number of reads (counts) for each 
gene and comparing them between two groups, such as treatment vs control, 
or ill vs healthy.

It uses three main ideas:

-  A theoretical distribution to model count data  
-  One linear model per gene to determine association between gene expression 
and experimental condition (ill vs healthy)   
-  Multiple-testing correction to control the absolute number of false 
positives obtained when analysing thousands of genes (testing thousands of hypothesis)    

Statistical Model: The Negative Binomial Distribution

RNA-seq data are counts, and these counts vary by random chance, but also because
of thousands of biological processes in a variety of cells, as well as for 
technical reasons, based on how we isolate and measure the number of transcripts.
This means that gene expression is not well represented by the normal distribution,
which we will often use as a proxy of the sampling distribution, to do statistics. 
Instead of the normal distribution, edgeR uses a distribution called the 
negative binomial, which can handle this extra variability. The assumption 
therefore is that the sampling distributions we could construct if we did thousands
of gene expression experiments and plotted each gene's mean expression in its own
sampling distribution, would follow a negative binomial distribution and we base
calculations for the probability of observing the model coefficients we get, by 
random chance alone, on that distribution.  

What is dispersion?

Dispersion is a measure of how much the counts vary from sample to sample 
beyond what you would expect from random noise. This is similar to what we know 
as variance, but in differential gene expression, it is called dispersion, for
the reasons explained above - the variation is not only because of random chance. 

Linear Models in edgeR

edgeR uses generalized linear models (GLMs) to describe the experimental design. 
It is called generalised, because instead of using the normal distribution, as 
simple linear regression does, it can use a different underlying distribution, 
in this case, the negative binomial. The concept is however the same, as a simple
linear regression.  

Each gene gets its own model, and edgeR tests whether the model shows evidence 
of conditions being associated with the gene expression of that gene, i.e. the 
mean gene expression for the ill group is higher than the mean expression for
the healthy group, for the particular gene. 

Hypothesis Testing

For each gene, edgeR tests whether group differences are bigger than what 
would be expected from the estimated dispersion. The tests generate a p-value 
for each gene.  

Multiple-Testing Correction

Because tens of thousands of genes are tested at once, some will appear 
significant by random chance alone. edgeR corrects this using the 
Benjamini–Hochberg False Discovery Rate (FDR). Genes with FDR < 0.05 
are commonly considered significant. This ensures that the list of “significant”
genes is reliable.


Now answer these questions about the paper.

For each of the statement below, state whether it is TRUE or FALSE.  

a) The experimental groups in this analysis were people receiving treatment
for Covid-19 vs people not receiving treatment.  F
b) The experimental groups in this analysis were people with severe 
Covid-19 vs people with milder disease.  T
c) The researchers state that they found 7941 significantly differentially ex-
pressed genes (DEGs) after multiple testing correction. This means that they 
performed many thousands more linear models, 1 for each gene, and of those, 7941 
had an adjusted p-value (FDR) below 0.05.  T
d) In figure 2, the y-axis is a transformation of the FDR: the negative of 
the log base 10 of the FDR was calculated and plotted. This is done as correction
for multiple testing.   F
e) d) In figure 2, the y-axis is a transformation of the FDR: the negative of 
the log base 10 of the FDR was calculated and plotted. This is done to make the 
p-values smaller to filter out false positives.  F
f) d) In figure 2, the y-axis is a transformation of the FDR: the negative of 
the log base 10 of the FDR was calculated and plotted. This is done to put the
p-values on a scale that makes plotting easier.  T
g) In figure 2, each dot that is coloured red, represents one gene, for which
the mean expression in the severe cases, were higher than the mean expression 
in the mild cases, and the difference was statistically significant.  T
h) In figure 2, only the dots coloured green represent genes that had 
statistically significant differences in gene expression between severe and 
mild disease.  F
i) In figure 2, every red dot represents one gene that had higher expression than
the blue dots, and the difference was statistically significant.  F  
j) In figure 2, the p-values represent the results of comparisons of every gene
with every other gene, within the severe disease group.  F
k) in the method section of this paper, the authors give enough information 
about the edgeR analysis, so that someone else with the same data, could 
reproduce their analysis.   F








