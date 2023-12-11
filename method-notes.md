
# Data sources

## Insecticide resistance bioassay data

## Vgsc allele frequency data

## Potential Predictor variables

# Modelling

## Gaussian process stacked generalization ensemble modelling approach

The idea is to provide level 0 and level 1 approaches

## Machine-learning models


# Proposed alternative implementation

I propose that this work is first refactored into a targets pipeline.
This provides numerous benefits:

- Clearly define the process for the model fitting:
  - data cleaning
  - model formula preparation
  - separating data into test/training sets
  - Fitting model on training data
  - Predicting model out to testing data
  - Combining testing data
- Model outputs are only run once
- Identifying pleasingly parallel components

Additionally, I think that there is some scope to use `tidymodels` instead of the separate approaches for `bgam`, `xgboost`, and `randomForest`. The benefit of this is that we can unify/simplify the following tasks:

- handling test/training data
- handling training/out of sample prediction
- building formulas for esoteric components of each model
