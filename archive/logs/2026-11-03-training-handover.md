# Training repository notes — 3 November 2026

- Preferred name: **Practical Training Manual**, formerly referred to as the user guide. Full title: **Applied DSGE Modelling with Dynare: A Practical Training Manual**.
- Maintained Overleaf project: https://www.overleaf.com/project/6ad72ce5d978a419cd107ac1 . The facilitator reports that a PDF has also been saved in that Overleaf project. The facilitator subsequently added `Applied_DSGE_Modelling_with_Dynare_A_Practical_Training_Manual.pdf` to `training/dsge_content/sessions/dynare_help`; both reference READMEs now link to it.
- Retain the existing `dsge/0.user_guide` path so existing links continue to work; use the preferred name in participant-facing text.
- Folder tidying and README integration were committed and pushed as `30b5e02`. Local training Markdown links passed verification. The current `basics.m` contains a Live Script package, not a plain-text Octave script; the help README records this.
- Next workshop preparation priorities remain those in the 2 November handover, starting with the RBC slide source and review.

## RBC slide-source review

- Facilitator supplied the external `dsge-training-nt/.../Basic_RBC/compile reader` folder. Its `Hansen_basicrbc_FULL.tex` uses the article class and produces the model reader, not a Beamer slide deck.
- Added the advanced macro course RBC TeX source and its 24 referenced figures under `session_2/slides/source/macro_course_rbc`; compilation passed with pdfLaTeX (58 pages after the second pass). Existing course participant PDF is retained and linked from the session README.
- Recommended workshop sequence: trend/cycle and filtering; business-cycle facts and moments; conceptual RBC model; Hansen model and workshop code. Keep course and workshop model assumptions distinct. Slide content has not yet been refreshed.
- Extracted slide text is identical between the existing Hansen slides and the facilitator-compiled `notes/source/RBC.pdf`. The copied course source also produces the same extracted text as the existing course PDF; these are content checks, not pixel-level visual comparisons.
- Hansen reader compiler sources were already tracked in `training/dsge_content/codes/Basic_RBC/compile reader` and match the external copy. Added build/dependency documentation and a session 2 link; clean temporary-directory pdfLaTeX compilation passed twice. This typesets historical saved material, rather than regenerating it from current Dynare code.
- At the facilitator’s request, moved the complete Hansen reader compiler folder to `training/dsge_content/sessions/session_2/notes/source/hansen_reader` and updated navigation links. Existing tracked build products were preserved with the move.
- Added historical CIA/MIU slide sources under `session_3/slides/source`, with both appendix files and four referenced JPG figures. Both main documents compile with pdfLaTeX in clean temporary folders. Content is retained for later use; session 3 remains optional.
