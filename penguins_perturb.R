
# permute penguins data into fake infectious disease data

penguins



data_1 <- expand_grid(species = unique(penguins$species),
            island = unique(penguins$island)) |> 
  mutate(strain = case_when(species == "Adelie" ~ "A52",
                            species == "Gentoo" ~ "G879",
                            species == "Chinstrap" ~ "CC3"),
         town = case_when(island  == "Torgersen" ~ "Tenwa",
                          island == "Biscoe" ~ "Brenbo",
                          island == "Dream" ~ "Drogen")) |> 
  inner_join(penguins) |> 
  select(-species, -island) |> 
  mutate(across(body_mass_g, ~.x*2/100 + 
                  rnorm(n = nrow(penguins), mean = 0, sd = 0.5)),
         across(bill_length_mm, ~.x + 
                  rnorm(n = nrow(penguins), mean = 0, sd = 1)),
         across(bill_depth_mm, ~log(.x + 
                  rnorm(n = nrow(penguins), mean = 0, sd = 6))),
         across(flipper_length_mm, ~.x - 20 +
                  rnorm(n = nrow(penguins), mean = 5, sd = 5)),
         immune_prot_A = bill_length_mm + 
           rnorm(n = nrow(penguins), mean = 0, sd = 20),
         immune_prot_B = rnorm(n = nrow(penguins), mean = 400, sd = 100),
         age = sample(18:65, nrow(penguins), replace = TRUE),
         across(year, ~.x + 12)) |>
  rownames_to_column(var = "study_id") |> 
  mutate(across(study_id, ~paste0("ID", .x))) |> 
  rename(immune_prot_C = bill_length_mm, 
         immune_prot_D = bill_depth_mm,
         height = flipper_length_mm,
         weight = body_mass_g) |> 
  select(study_id, year, town, strain, age, sex, height, weight, 
         immune_prot_A, immune_prot_B, immune_prot_C, immune_prot_D)

if(!dir.exists("rds")){
  dir.create("rds")
}

write_rds(data_1, "rds/data_1.rds")
