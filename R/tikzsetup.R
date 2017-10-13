#' Setup tikz device for russian Rmd/Rnw files 
#'
#' Setup tikz device for russian Rmd/Rnw files 
#'
#' Setup tikz device for russian Rmd/Rnw files 
#'
#' @param lang language
#' @param compiler currently xelatex is supported
#' @param font_size font size
#' @param cyrillic_font Arial by default
#' @export
#' @return invisible preamble 
#' @examples
#' tikzsetup()
#' tikzsetup(lang = "russian")
tikzsetup  <- function(compiler = "xetex", lang = "russian",
                       cyrillic_font = "Arial",
                       font_size = 12) {
  match.arg(compiler)
  
  tex_preamble <- c(
    "\\usepackage{tikz}\n",
    "\\usepackage[active, tightpage, xetex]{preview}\n",
    "%\\usepackage[top=2cm, left=1.5cm, right=1.5cm, bottom=2cm]{geometry}\n",
    "\\PreviewEnvironment{pgfpicture}\n",
    "\\setlength\\PreviewBorder{0pt}\n",
    "\\usepackage{fontspec}\n",
    "\\usepackage{polyglossia}\n",
    paste0("\\setmainlanguage{", lang, "}\n"),
    "\\setotherlanguages{english}\n",
    paste0("\\setmainfont{", cyrillic_font, "}\n"), 
    paste0("\\newfontfamily{\\cyrillicfonttt}{", cyrillic_font, "}\n"),
    paste0("\\newfontfamily{\\cyrillicfont}{", cyrillic_font, "}\n"),
    paste0("\\newfontfamily{\\cyrillicfontsf}{", cyrillic_font, "}\n")
  )
  
  doc_declaration <- paste0("\\documentclass[tikz, ", font_size, "pt]{standalone}\n")
  
  
  base::options(tikzDocumentDeclaration = doc_declaration)
  base::options(tikzDefaultEngine = compiler, tikzLatexPackages = tex_preamble)
  return(invisible(tex_preamble))
}
  