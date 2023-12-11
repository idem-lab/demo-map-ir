source("packages.R")
## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

tar_plan(

  data_all = read_rds(here("data/data_all_wa.rds")),
  covariate_names = read_rds(here("data/covariate_names_all_wa.rds")),
  factor_cov_nms = "ins_ind",
  inner_test_index_list = read_rds(here("data/inner_test_index_list.rds")),
  outer_test_index_list = read_rds(here("data/outer_test_index_list.rds")),
  data_pct_mortality = add_pct_mortality(data_all),

  test_train = prepare_test_train(data = data_pct_mortality,
                                  outer_test_index_list = outer_test_index_list,
                                  inner_test_index_list = inner_test_index_list,
                                  inner_validation = 1,
                                  outer_validation = 1,
                                  covariate_names = covariate_names),

  test_data = test_train$test_data,
  train_data = test_train$train_data,
  test_inds = test_train$test_inds,

  model_formula = build_bgam_formula(factor_cov_nms = factor_cov_nms,
                                     covariate_names = covariate_names),

  bgam_fit_train = model_fit_bgam(
    model_formula = model_formula,
    data = train_data,
    tune_run = 1,
    mstop = 50
  ),

  gbam_predict_test = predict(bgam_fit_train, newdata = test_data),

  gbam_test_rmse = gbam_rmse(gbam_predict_test, test_data),

  gbam_model_output = list(
    rmse = gbam_test_rmse,
    gambFitJ = bgam_fit_train,
    gambPredJ = gbam_predict_test,
    test_inds = test_inds,
    data_all = data_pct_mortality
  )




)
