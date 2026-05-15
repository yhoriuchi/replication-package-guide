read_Qualtrics <- function(file, folder = "data"){
  
  colnames <- paste0(folder, "/", file) |> 
    read_csv() |> 
    names()
  
  qualtrics <- read_csv(paste0(folder, "/", file), 
                        skip = 2,
                        show_col_types = FALSE)
  colnames(qualtrics) <- colnames
  
  return(qualtrics)
  
}
