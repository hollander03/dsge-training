# ERSA DSGE 2026: paired pre/post surveys

This package creates two Google Forms feeding into one Google Sheets workbook, with automatic summaries and matching. It runs entirely in your Google account using Google's built-in Apps Script services. No paid add-on, third-party form service or external API key is required.

## Set up once

1. Sign into the Google account that should own the surveys and results. Open [Google Apps Script](https://script.google.com/) and choose **New project**. Name it **ERSA DSGE 2026 surveys**.
2. Open **Code.gs**, replace its contents with the entire supplied `Code.gs`, and save.
3. Select **setupSurveys** in the function selector, then click **Run**. Review and authorise Google's requested access to create/manage Forms, Sheets and submission triggers. This authorises your own script; the package does not send emails or invitations.
4. Open the **Execution log** and follow **PRIVATE RESULTS WORKBOOK**. Its **Start here** tab contains both participant links and both editor links. Keep editor/workbook links private.
5. Check the settings below, submit test responses, inspect the summaries, and remove the test responses from both Google Forms and their raw response sheets. Run **refreshSurveyResults** again before launch. Share the PRE link before the workshop and the POST link afterwards.

The script itself has been syntax-checked and its analysis/form-construction logic tested offline. Live Google authorisation, account-specific sharing policies, publishing and trigger execution must be verified in your account. No live forms or workbook have been created by this package yet.

## Review before distribution

- Read **QUESTIONNAIRES.md** for the exact question wording. Seven repeated capabilities include estimation. If estimation is outside this workshop's scope, edit `SURVEY.skills` before first setup.
- Confirm the workbook's **Share → General access** is **Restricted**, and that only intended organisers have editor access. New-file account policies may differ. Do not share the workbook with participants.
- In each form's **Publish / Manage responder access**, allow **anyone with the link**, if your account policy permits. Test in a signed-out/incognito window; do not assume an organisational account allows external respondents.
- Email collection, one-response sign-in requirement, respondent summary sharing and response editing are disabled by the script. Do not add file-upload questions, names, email fields or personal identifiers.
- Set and communicate your retention period and an organiser contact through the form editor. Keep written responses private and avoid reporting identifiable small-group breakdowns.

Responses are anonymous to organisers only insofar as the questionnaire and participants do not identify people. Google still processes technical information under its own privacy policy. The script does not create a code-to-person lookup. Repeated background combinations, writing, or a code shared with an organiser could nevertheless identify someone.

## What participants do

Each participant privately invents and retains an **eight-character random code**, using A–Z and 0–9, and uses it in both surveys. Do not distribute one common example code or derive codes from birthdays, initials or student numbers. A lost or mistyped code may prevent matching. Anonymous collection cannot reliably prevent repeat submissions without identifying participants, so duplicates are flagged rather than silently resolved.

Only the code is required. All ratings, background information and feedback are optional. Participation is voluntary. Knowledge and confidence questions use identical wording and 1–5 scales before and after.

## Workbook tabs

| Tab | Purpose |
| --- | --- |
| Start here | Participant/editor links, privacy checklist, interpretation notes |
| Google-generated response tabs | Separate raw pre/post responses within the same workbook |
| Summary | Submission counts, matched codes, duplicates and unmatched codes |
| Cohort ratings | Pre/post item means and answering counts; all submissions, not unique people |
| Matched changes | Itemwise paired means, mean/median change, increase/same/decrease counts |
| Match audit | Random codes with pre/post counts and matching status |
| Matched responses | Each unambiguous pair's ratings and changes |
| Answer distributions | Counts for multiple-choice and checkbox answers, with question denominators |

Charts appear below the ratings tables. Written feedback remains in the restricted raw response tabs rather than being duplicated into the dashboard. For checkbox questions, counts can sum to more than the number answering.

The summaries refresh on each form submission. After deleting or editing existing responses, run **refreshSurveyResults** manually. Do not change question wording, grid rows or scales after launch; the analysis uses the stored item IDs and the original scale definitions.

## Matching and interpretation

A code is matched only when it has exactly one pre response and one post response. If duplicated within either survey, **all** responses for that code are excluded from paired analysis. Duplicate submissions remain in the all-response cohort summaries. No first/last-response selection is made automatically.

Each metric excludes missing answers separately. Paired pre means, paired post means and changes use the **same pairs answering that metric**. Empty results remain blank, not zero. Changes range from −4 to +4; positive means higher self-assessment after training. No percentage improvement is calculated from these ordinal scales.

These are self-reported knowledge and confidence measures, not objective learning tests or causal estimates of the workshop's effect. Report the paired sample size and missingness with results. Participants can reassess their abilities differently after learning more about the topic.

## Reruns and recovery

Run setup again in the **same Apps Script project** to reuse the saved form and workbook IDs; duplicate submission triggers are not created. Configured questionnaires are not rebuilt, and a form you later close is not reopened on routine setup reruns. Do not clear Script Properties or copy the script into a second project unless you intend to create another survey set.

If setup fails partway through, resolve the error and rerun it in the same project. An unanswered, partially configured form can be rebuilt; an answered form is never automatically cleared. The setup uses only new survey resources, not an existing participant register.

For small workshop cohorts, refreshing from all form responses is straightforward. A much larger survey would need a more incremental design to stay within Apps Script quotas.

## Local verification

From the repository root:

```sh
node --check < training/admin/surveys/Code.gs
node training/admin/surveys/test-analysis.cjs
```

Google references: [Form service](https://developers.google.com/apps-script/reference/forms/form), [grid questions](https://developers.google.com/apps-script/reference/forms/grid-item), [form-submit triggers](https://developers.google.com/apps-script/reference/script/form-trigger-builder).
