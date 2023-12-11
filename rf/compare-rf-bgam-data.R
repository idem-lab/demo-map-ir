# ==== data load
load(here::here("rf/inputs_data_all_wa_tree5d.r"))

tibble::as_tibble(inputs$data_all_wa)
inputs$covariate.names.all.wa
inputs$factor_cov_nms

data_all_wa <- readr::read_rds("data/data_all_wa.rds")
covariate.names.all.wa <- readr::read_rds("data/covariate_names_all_wa.rds")
factor_cov_nms <- readr::read_rds("data/factor_cov_nms.rds")

all.equal(data_all_wa, inputs$data_all_wa)
all.equal(factor_cov_nms, inputs$factor_cov_nms)
all.equal(covariate.names.all.wa, inputs$covariate.names.all.wa)


load("stk_val_inds5.r")
load("non_spatial_val_sets6.r")


load("gp-meta-model/inputs_data_all_wa_l06.r")

make_inputs$covariate.names1
make_inputs$covariate.names2
make_inputs$covariate.names3
make_inputs$covariate.names4

str(make_inputs$)
