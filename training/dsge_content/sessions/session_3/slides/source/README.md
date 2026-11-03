# CIA and MIU slide sources

Historical sources retained from the Stellenbosch Dynamic Economic Theory course. These are optional references; the core workshop proceeds from RBC to the New Keynesian model, which already includes money in utility.

- `CIA.tex` includes `App_CIA.tex` and uses `CIA_tech.jpg` and `CIA_money.jpg`.
- `MIU.tex` includes `App_MIU.tex` and uses `CIA-MIUtechshock.jpg` and `CIA-MIUmoneyshock.jpg`.

Compile each main file twice with pdfLaTeX, for example `pdflatex CIA.tex` and `pdflatex MIU.tex`. Keep each main source with its appendix and figures. Both passed clean temporary-directory builds on 3 November 2026. Appendix files are included by the main documents and are not standalone documents.

Content, attribution and historical figure calibrations are preserved. Compilation does not rerun the models or establish equivalence to the current workshop code. Review the slides against the code before teaching from them again.

CIA provides an example of a constraint on transactions and an associated multiplier. This can support later discussion of borrowing and collateral constraints, whose timing, economic role and binding conditions must be introduced separately.

[Session 3 guidance](../../README.md) · [CIA and MIU model code](../../code/cia_miu)
