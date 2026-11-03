# Hansen RBC model reader source

`Hansen_basicrbc_FULL.tex` produces the article-style model reader, not the Beamer slides. The workshop copy of the reader is [Hansen_basicrbc_FULL.pdf](../../Hansen_basicrbc_FULL.pdf).

## Compile

From this directory, run `pdflatex Hansen_basicrbc_FULL.tex` twice, or `latexmk -pdf Hansen_basicrbc_FULL.tex`. To keep build products separate, copy the files below to a temporary build directory and compile there.

Required files:

- `Hansen_basicrbc_FULL.tex`: main document.
- `basicrbc2015_dynamic_content.tex`: model equations.
- `basicrbc2015_latex_definitions.tex`: variable and parameter definitions.
- `basicrbc_fig.pdf`: impulse-response figure.
- `basicrbc2015binder.mod`: model listing printed in the reader.

`basicrbc2015_latex_parameters.tex` is retained for the optional parameter include, which is currently commented out. Preserve the historical filenames because the TeX source refers to them directly.

This is a historical reader snapshot. Compiling it typesets the saved equations, figure and model listing; it does not run Dynare or regenerate them from the current workshop model. Use [Basic RBC](../../../../../codes/Basic_RBC/README.md) for the maintained runnable examples and [session 2](../../../README.md) for the workshop teaching sequence.

A clean temporary-directory build passed with pdfLaTeX on 3 November 2026. The required source files match the facilitator-supplied compiler copy.
