

ll <- c("index.qmd"
,"why_statistics.qmd"
,"uncertainty.qmd"
, "sample_population.qmd"
, "probability.qmd"
, "what_is_model.qmd"
, "what_is_data.qmd"
 , "clever.qmd"
,"inference.qmd"
,"describe.qmd"
,"visualise.qmd"
, "categorical.qmd"
, "numeric.qmd"
, "where_data.qmd"

 ,"study_design.qmd"
 ,"measurement.qmd"
 ,"bias.qmd"
 ,"working_with_data.qmd"
 
, "goals.qmd"
, "file_types.qmd"
, "software.qmd"
, "plot_types.qmd"
, "central_spread.qmd"
, "tables.qmd"
, "sampling_distro.qmd"
, "diff_tests.qmd"
, "corr_lm.qmd"
, "classify.qmd"
, "quant_uncertainty.qmd"
, "resampling.qmd"
, "learning.qmd")


ll
for(i in ll){

if(!file.exists(i)){
  file.create(i)
}
}

