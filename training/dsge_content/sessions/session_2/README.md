# RBC models and practical

Start with the [RBC slides](slides/Hansen_basicrbc_slides.pdf) and [model notes](notes/Hansen_basicrbc_FULL.pdf). The [Hansen reader source and build instructions](notes/source/hansen_reader) are also available. Run `dynare basicrbc` from `code/basic_rbc`. The [manual examples](../../codes/Basic_RBC) provide additional run instructions and a fresh posterior-mode estimation example. The session's `basicrbc_est.mod` instead performs a longer posterior-sampling exercise.

## Slides and teaching sequence

Use the [macro course RBC slides](../../../macro_course_material/topic%201%20-%20rbc/macro-session-rbc.pdf) as a complementary introduction:

1. Trend versus cycle, linear detrending and HP filtering, including limitations and one-sided versus two-sided filtering.
2. Business-cycle stylised facts and the moments a model should explain.
3. The baseline RBC model and technology-shock mechanisms, followed by the Hansen slides and workshop code.

The course deck develops a related model with log consumption/log leisure utility, growth and government purchases. Its notation, assumptions and special cases should be distinguished from the workshop's `basicrbc.mod`; it is a conceptual companion rather than an exact derivation of that code. Use selected sections for the workshop, with the longer analytical derivations available for further study.

The [editable course slide source and figures](slides/source/macro_course_rbc) are included for future updates. The PDF remains in the standalone macro course material. The older [RBC source](notes/source/RBC.tex) is a separate deck to review and refresh.

## Group practical

For the 60–90-minute group practical, choose one route:

- **[Fiscal applications](tutorials/fiscal_applications):** choose a fiscal growth-model extension or a focused experiment with the [fixed-calibration real fiscal DSGE model](code/real_fiscal/README.md). The fuller model is an optional advanced route; study one mechanism at a time.
- **[Model–data comparison](tutorials/model_data_comparison):** compare RBC moments with empirical moments, then investigate one calibration change.

For either route: understand the baseline; state one question and predict its mechanism; run a focused experiment; interpret the result and limitations; present the main finding. Use the [workshop guidance](../../../admin/README.md) for presentation requirements.

Other resources include the [Mutschler RBC example](code/mutschler_rbc), an [optional homework model](tutorials/RBCmodel_homework.mod), and [supporting notes](notes). The core sequence proceeds directly to [New Keynesian models](../session_4); [session 3](../session_3) is optional reference.
