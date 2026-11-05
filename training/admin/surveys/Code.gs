/** ERSA DSGE 2026 pre/post surveys. Paste this entire file into Google Apps Script.
 * Run setupSurveys once, authorise, then open the workbook URL in Execution log.
 * No emails, names, invitations or code-to-person lookup are collected/created.
 */
const SURVEY = {
  title: '2026 ERSA DSGE training',
  timezone: 'Africa/Johannesburg',
  skills: [
    'Explain the main mechanisms of a basic DSGE model',
    'Derive its equilibrium conditions',
    'Find its steady state',
    'Implement and solve it in Dynare',
    'Interpret impulse response functions',
    'Modify an existing model for a research question',
    'Estimate a model using data'
  ],
  confidence: ['1 - Not at all confident', '2 - Slightly confident',
    '3 - Moderately confident', '4 - Very confident', '5 - Extremely confident'],
  knowledge: ['1 - None', '2 - Basic', '3 - Intermediate', '4 - Good', '5 - Advanced']
};

function setupSurveys() {
  const lock = LockService.getScriptLock();
  lock.waitLock(30000);
  let workbookUrl;
  try {
    const props = PropertiesService.getScriptProperties();
    let id = props.getProperty('workbook');
    if (!id) {
      const ss = SpreadsheetApp.create(SURVEY.title + ' - survey results');
      id = ss.getId();
      props.setProperty('workbook', id);
      ss.setSpreadsheetTimeZone(SURVEY.timezone);
      ss.getSheets()[0].setName('Start here');
    }
    const ss = SpreadsheetApp.openById(id);
    ['pre', 'post'].forEach(stage => {
      let formId = props.getProperty(stage + 'Form');
      if (!formId) {
        const form = FormApp.create(SURVEY.title + (stage === 'pre' ? ' - before training' : ' - after training'), false);
        formId = form.getId();
        props.setProperty(stage + 'Form', formId);
      }
      const form = FormApp.openById(formId);
      if (!props.getProperty(stage + 'Items')) {
        // Recover an interrupted first setup, never overwrite an answered form.
        if (form.getResponses().length) throw new Error('Unconfigured form has responses; inspect it before proceeding.');
        for (let i = form.getItems().length - 1; i >= 0; i--) form.deleteItem(i);
        props.setProperty(stage + 'Items', JSON.stringify(buildSurvey_(form, stage)));
      }
      form.setCollectEmail(false).setLimitOneResponsePerUser(false)
        .setPublishingSummary(false).setAllowResponseEdits(false)
        .setShuffleQuestions(false).setProgressBar(true);
      let destinationId = null;
      try {
        destinationId = form.getDestinationId();
      } catch (error) {
        if (!String(error).includes('no response destination')) throw error;
      }
      if (destinationId !== id) {
        form.setDestination(FormApp.DestinationType.SPREADSHEET, id);
      }
      if (!props.getProperty(stage + 'Ready')) {
        form.setPublished(true);
        form.setAcceptingResponses(true);
        props.setProperty(stage + 'Ready', 'true');
      }
      const exists = ScriptApp.getProjectTriggers().some(t =>
        t.getHandlerFunction() === 'refreshSurveyResults' && t.getTriggerSourceId() === formId);
      if (!exists) ScriptApp.newTrigger('refreshSurveyResults').forForm(form).onFormSubmit().create();
    });
    writeStart_(ss, props);
    workbookUrl = ss.getUrl();
  } finally { lock.releaseLock(); }
  refreshSurveyResults();
  console.log('PRIVATE RESULTS WORKBOOK: ' + workbookUrl);
  console.log('Review the Start here tab and test both participant links in a signed-out/incognito window before distributing them.');
}

function buildSurvey_(form, stage) {
  const ids = {};
  form.setDescription(
    (stage === 'pre' ? 'Please complete before the workshop.' : 'Please complete after the workshop.') +
    '\nParticipation is voluntary. Results will be used to improve the training and report aggregate changes in self-assessed knowledge and confidence. ' +
    'We do not ask for names or email addresses. Avoid identifying yourself or others in written answers. ' +
    'Background questions are optional; small groups can sometimes be identifiable from combinations of answers. ' +
    'Google processes technical information under its own privacy policy. Organisers can access responses in a private workbook. ' +
    '\nCreate an eight-character RANDOM code using capital letters and numbers (for example, make up your own code; do not copy an example). ' +
    'Keep it privately and use the SAME code in both surveys. Do not use initials, birthdays, student numbers or other personal details. ' +
    'There is no code-to-name list. You may leave optional questions blank.');
  form.setConfirmationMessage(stage === 'pre' ?
    'Thank you. Keep your random participant code privately and use it again in the post-training survey.' :
    'Thank you for your feedback.');
  const code = form.addTextItem().setTitle('Your random participant code')
    .setHelpText('Exactly 8 capital letters/numbers. Save it privately for both surveys; do not use personal information.')
    .setRequired(true).setValidation(FormApp.createTextValidation()
      .requireTextMatchesPattern('^[A-Z0-9]{8}$').setHelpText('Enter exactly 8 capital letters or digits.').build());
  ids.code = code.getId();
  ids.knowledge = multiple_(form, 'How would you rate your current knowledge of DSGE models?', SURVEY.knowledge).getId();
  ids.skills = form.addGridItem().setTitle('How confident are you in your ability to do each task?')
    .setHelpText('Rate your current ability. You may leave a row blank; before and after use the same scale.')
    .setRows(SURVEY.skills).setColumns(SURVEY.confidence).setRequired(false).getId();
  if (stage === 'pre') {
    multiple_(form, 'Which best describes your current position?', [
      "Master's student", 'PhD student', 'Postdoctoral researcher', 'Early career faculty',
      'Other academic faculty', 'Economist / researcher / policy practitioner']).showOtherOption(true);
    multiple_(form, 'What is your primary research area?', [
      'Macroeconomics', 'International macroeconomics / finance', 'Development economics',
      'Public economics / fiscal policy', 'Monetary economics']).showOtherOption(true);
    checks_(form, 'Which relevant formal coursework have you completed? Select all that apply.', [
      'Advanced macroeconomic theory', 'Computational economics', 'Econometrics',
      'Mathematics for economists']).showOtherOption(true)
      .setHelpText('Leave blank if none. Include completed courses only.');
    multiple_(form, 'Which best describes your highest level of practical DSGE experience?', [
      'No practical experience yet', 'Run and interpret an existing model',
      'Modify an existing model', 'Build and solve a model from scratch',
      'Estimate or use models for research / policy analysis']);
    checks_(form, 'What do you most hope to gain? Select up to three priorities.', [
      'Theoretical understanding', 'Hands-on Dynare skills', 'Estimation techniques',
      'Policy analysis / forecasting', 'Research collaboration']).showOtherOption(true)
      .setValidation(FormApp.createCheckboxValidation().requireSelectAtMost(3).build());
    form.addParagraphTextItem().setTitle('What is your main learning goal for this workshop?');
  } else {
    ids.satisfaction = multiple_(form, 'How satisfied are you with the workshop?', [
      'Very dissatisfied', 'Dissatisfied', 'Neither satisfied nor dissatisfied', 'Satisfied', 'Very satisfied']).getId();
    checks_(form, 'Which aspects were most useful? Select all that apply.', [
      'Theoretical explanations', 'Hands-on Dynare exercises', 'Estimation exercises',
      'Policy applications / forecasting', 'Interaction with instructors', 'Interaction with peers']).showOtherOption(true);
    multiple_(form, 'How was the pace?', [
      'Much too slow', 'Slightly too slow', 'About right', 'Slightly too fast', 'Much too fast']);
    multiple_(form, 'How were the opportunities for hands-on practice?', [
      'Far too little', 'Slightly too little', 'About right', 'Slightly too much', 'Far too much']);
    multiple_(form, 'To what extent was your main learning goal met?', [
      'Exceeded', 'Fully met', 'Partially met', 'Not met', 'I did not have a specific goal']);
    form.addParagraphTextItem().setTitle('Which topics or skills, if any, needed more time?');
    form.addParagraphTextItem().setTitle('What is the single most useful change for the next workshop?');
    multiple_(form, 'Would you recommend this training to others in your field?', ['Yes', 'Maybe', 'No']);
  }
  ids.intention = multiple_(form, 'Do you plan to use DSGE modelling skills within the next year?', [
    'Yes - I have a specific project', 'Yes - I am exploring possible applications', 'Not at this time']).getId();
  checks_(form, 'Where do you intend to apply these skills? Select all that apply.', [
    'Thesis / dissertation', 'Other academic research', 'Policy research / forecasting',
    'Collaborative projects', 'Teaching / mentoring']).showOtherOption(true);
  return ids;
}

function multiple_(form, title, choices) {
  return form.addMultipleChoiceItem().setTitle(title).setChoiceValues(choices).setRequired(false);
}
function checks_(form, title, choices) {
  return form.addCheckboxItem().setTitle(title).setChoiceValues(choices).setRequired(false);
}

function writeStart_(ss, props) {
  const pre = FormApp.openById(props.getProperty('preForm'));
  const post = FormApp.openById(props.getProperty('postForm'));
  writeSheet_(ss, 'Start here', ['Item', 'Details'], [
    ['Study', SURVEY.title],
    ['PRE participant link - share before training', pre.getPublishedUrl()],
    ['POST participant link - share after training', post.getPublishedUrl()],
    ['PRE editor - organisers only', pre.getEditUrl()],
    ['POST editor - organisers only', post.getEditUrl()],
    ['Results - organisers only', ss.getUrl()],
    ['Privacy settings', 'Email collection OFF; one-response sign-in requirement OFF; respondent results summary OFF. No names requested.'],
    ['Before sharing', 'In each form: Publish / Manage responder access: anyone with the link. Test signed out. Organisation policy may restrict this.'],
    ['Workbook access', 'New workbook uses account defaults. Check Share: General access Restricted; remove unintended editors. Do not distribute this workbook.'],
    ['Participant code', 'Respondents create and retain an 8-character random code. No identity lookup. Use the same code in both surveys.'],
    ['Analysis', 'Cohort means include all submissions with an answer, not unique participants. Matched summaries use one pre and one post per valid code.'],
    ['Duplicates', 'All codes duplicated within either survey are excluded from matching; inspect Match audit. No automatic first/last selection.'],
    ['Missing answers', 'Excluded separately for each item. Matched pre and post means use the same answering pairs for that item.'],
    ['Interpretation', 'These are self-assessments, not objective learning tests or causal estimates of workshop impact.'],
    ['Automatic refresh', 'Runs on each form submission. To refresh after deleting/editing responses, run refreshSurveyResults manually.'],
    ['Raw responses', 'Google Forms creates separate response tabs in this same workbook. Do not delete or rename questions after launch.'],
    ['Optional questions', 'Only participant code is required; all background, rating and feedback questions may be skipped.'],
    ['Content', 'Seven repeated capabilities include estimation. Remove before launch if not covered, and update SURVEY.skills before first setup.'],
    ['Retention', 'Organisers should choose and communicate a retention period before distribution.'],
    ['Setup reruns', 'Reuse this same Apps Script project: setupSurveys reuses existing forms/workbook and avoids duplicate triggers. It does not rebuild configured questionnaires.']
  ]);
}

/** Installable form-submit trigger; may also be run manually. */
function refreshSurveyResults() {
  const lock = LockService.getScriptLock();
  lock.waitLock(30000);
  try {
    const props = PropertiesService.getScriptProperties();
    const ss = SpreadsheetApp.openById(props.getProperty('workbook'));
    const read = stage => readStage_(FormApp.openById(props.getProperty(stage + 'Form')),
      JSON.parse(props.getProperty(stage + 'Items')));
    const pre = read('pre'), post = read('post');
    const result = analyse_(pre, post);
    const cohort = result.metrics.map(m => [m.label, m.preN, blank_(m.preMean), m.postN, blank_(m.postMean)]);
    const paired = result.metrics.map(m => [m.label, m.pairN, blank_(m.pairedPre), blank_(m.pairedPost),
      blank_(m.change), blank_(m.medianChange), m.increased, m.same, m.decreased]);
    writeSheet_(ss, 'Summary', ['Measure', 'Value'], [
      ['Last refreshed (South Africa)', Utilities.formatDate(new Date(), SURVEY.timezone, 'yyyy-MM-dd HH:mm:ss')],
      ['Pre submissions', pre.length], ['Post submissions', post.length],
      ['Unique valid codes, pre', new Set(pre.filter(r => validCode_(r.code)).map(r => r.code)).size],
      ['Unique valid codes, post', new Set(post.filter(r => validCode_(r.code)).map(r => r.code)).size],
      ['Unambiguous matched codes', result.matches.length],
      ['Codes excluded because duplicated', result.audit.filter(r => r[3] === 'Duplicate - excluded').length],
      ['Pre-only codes', result.audit.filter(r => r[3] === 'Pre only').length],
      ['Post-only codes', result.audit.filter(r => r[3] === 'Post only').length],
      ['Invalid / missing code submissions', [...pre, ...post].filter(r => !validCode_(r.code)).length],
      ['Caution', 'Response counts are not necessarily people counts. Compare matched changes; cohort composition may differ.']
    ]);
    writeSheet_(ss, 'Cohort ratings', ['Self-assessment (1-5)', 'Pre answers n', 'Pre mean', 'Post answers n', 'Post mean'], cohort);
    writeSheet_(ss, 'Matched changes', ['Self-assessment (1-5)', 'Matched item pairs n', 'Paired pre mean', 'Paired post mean',
      'Mean change (post-pre)', 'Median change', 'Increased n', 'Unchanged n', 'Decreased n'], paired);
    writeSheet_(ss, 'Match audit', ['Random code', 'Pre submissions', 'Post submissions', 'Match status'], result.audit);
    const metricLabels = ['Knowledge', ...SURVEY.skills];
    const pairHeaders = ['Random code'];
    metricLabels.forEach(label => pairHeaders.push(label + ' PRE', label + ' POST', label + ' CHANGE'));
    writeSheet_(ss, 'Matched responses', pairHeaders, result.matches.map(pair => {
      const row = [pair[0].code];
      pair[0].scores.forEach((v, i) => {
        const w = pair[1].scores[i];
        row.push(blank_(v), blank_(w), v === null || w === null ? '' : w - v);
      });
      return row;
    }));
    writeSheet_(ss, 'Answer distributions', ['Survey', 'Question', 'Answer', 'Responses selecting answer n', 'Question respondents n'],
      [...answerCounts_(pre, 'PRE'), ...answerCounts_(post, 'POST')]);
    charts_(ss);
    SpreadsheetApp.flush();
  } finally { lock.releaseLock(); }
}

function readStage_(form, ids) {
  return form.getResponses().map(response => {
    const values = {}, answers = [];
    response.getItemResponses().forEach(item => {
      values[String(item.getItem().getId())] = item.getResponse();
      const type = item.getItem().getType();
      // Written feedback is kept in the restricted raw response tabs, not duplicated into summaries.
      if (type === FormApp.ItemType.MULTIPLE_CHOICE || type === FormApp.ItemType.CHECKBOX)
        answers.push({question: item.getItem().getTitle(), value: item.getResponse()});
    });
    const grid = values[String(ids.skills)] || [];
    return {code: normalizeCode_(values[String(ids.code)]),
      scores: [score_(values[String(ids.knowledge)]), ...SURVEY.skills.map((_, i) => score_(grid[i]))], answers: answers};
  });
}
function normalizeCode_(value) { return String(value || '').trim().toUpperCase(); }
function validCode_(value) { return /^[A-Z0-9]{8}$/.test(value); }
function score_(value) {
  const match = /^([1-5])(?:\s|$)/.exec(String(value || ''));
  return match ? Number(match[1]) : null;
}
function mean_(values) { return values.length ? values.reduce((a,b) => a+b, 0)/values.length : null; }
function median_(values) {
  if (!values.length) return null;
  const a = values.slice().sort((x,y) => x-y), mid = Math.floor(a.length/2);
  return a.length%2 ? a[mid] : (a[mid-1]+a[mid])/2;
}
function blank_(value) { return value === null ? '' : value; }
function analyse_(pre, post) {
  const index = rows => {
    const map = new Map();
    rows.filter(r => validCode_(r.code)).forEach(r => {
      if (!map.has(r.code)) map.set(r.code, []);
      map.get(r.code).push(r);
    });
    return map;
  };
  const a = index(pre), b = index(post), matches = [], audit = [];
  [...new Set([...a.keys(), ...b.keys()])].sort().forEach(code => {
    const x = a.get(code) || [], y = b.get(code) || [];
    const status = x.length > 1 || y.length > 1 ? 'Duplicate - excluded' :
      x.length && y.length ? 'Matched' : x.length ? 'Pre only' : 'Post only';
    audit.push([code, x.length, y.length, status]);
    if (status === 'Matched') matches.push([x[0], y[0]]);
  });
  const metrics = ['Knowledge', ...SURVEY.skills].map((label, i) => {
    const x = pre.map(r => r.scores[i]).filter(v => v !== null);
    const y = post.map(r => r.scores[i]).filter(v => v !== null);
    const pairs = matches.filter(p => p[0].scores[i] !== null && p[1].scores[i] !== null);
    const changes = pairs.map(p => p[1].scores[i] - p[0].scores[i]);
    return {label, preN:x.length, preMean:mean_(x), postN:y.length, postMean:mean_(y), pairN:pairs.length,
      pairedPre:mean_(pairs.map(p => p[0].scores[i])), pairedPost:mean_(pairs.map(p => p[1].scores[i])),
      change:mean_(changes), medianChange:median_(changes), increased:changes.filter(v => v>0).length,
      same:changes.filter(v => v===0).length, decreased:changes.filter(v => v<0).length};
  });
  return {metrics, matches, audit};
}
function answerCounts_(rows, stage) {
  const questions = new Map();
  rows.forEach(row => row.answers.forEach(answer => {
    let vals = Array.isArray(answer.value) ? answer.value : [answer.value];
    vals = [...new Set(vals.filter(v => v !== '' && v !== null))];
    if (!vals.length) return;
    if (!questions.has(answer.question)) questions.set(answer.question, {n:0, counts:new Map()});
    const q = questions.get(answer.question); q.n++;
    vals.forEach(v => q.counts.set(String(v), (q.counts.get(String(v)) || 0)+1));
  }));
  const output = [];
  questions.forEach((q, title) => q.counts.forEach((n, value) => output.push([stage, title, value, n, q.n])));
  return output;
}
function writeSheet_(ss, name, headers, rows) {
  const sheet = ss.getSheetByName(name) || ss.insertSheet(name);
  sheet.clearContents();
  const all = [headers, ...rows].map(row => row.map(safeCell_));
  if (sheet.getMaxRows() < all.length) sheet.insertRowsAfter(sheet.getMaxRows(), all.length-sheet.getMaxRows());
  if (sheet.getMaxColumns() < headers.length) sheet.insertColumnsAfter(sheet.getMaxColumns(), headers.length-sheet.getMaxColumns());
  sheet.getRange(1,1,all.length,headers.length).setValues(all).setWrap(true).setVerticalAlignment('top');
  sheet.getRange(1,1,1,headers.length).setBackground('#16324f').setFontColor('white').setFontWeight('bold');
  sheet.setFrozenRows(1);
  sheet.setColumnWidths(1,headers.length,160);
  sheet.setColumnWidth(1, name === 'Matched responses' ? 150 : 380);
  if (name === 'Start here') sheet.setColumnWidth(2,780);
  if (name === 'Summary') sheet.setColumnWidth(2,620);
  if (name === 'Cohort ratings' || name === 'Matched changes')
    sheet.getRange(2,2,Math.max(1,rows.length),headers.length-1).setNumberFormat('0.00');
  if (name === 'Cohort ratings') {
    sheet.getRange(2,2,8,1).setNumberFormat('0');
    sheet.getRange(2,4,8,1).setNumberFormat('0');
  }
  if (name === 'Matched changes') {
    sheet.getRange(2,2,8,1).setNumberFormat('0');
    sheet.getRange(2,7,8,3).setNumberFormat('0');
  }
  if (name === 'Matched responses')
    sheet.getRange(2,1,Math.max(1,rows.length),1).setNumberFormat('@');
  if (name === 'Match audit')
    sheet.getRange(2,1,Math.max(1,rows.length),1).setNumberFormat('@');
}
function safeCell_(v) {
  // Treat untrusted respondent text as text, never as a spreadsheet formula.
  return typeof v === 'string' && (/^[=+\-@]/.test(v) || /^\d{8}$/.test(v)) ? "'" + v : v;
}
function charts_(ss) {
  const sheet = ss.getSheetByName('Cohort ratings');
  sheet.getCharts().forEach(chart => sheet.removeChart(chart));
  sheet.insertChart(sheet.newChart().setChartType(Charts.ChartType.BAR)
    .addRange(sheet.getRange(1,1,9,1)).addRange(sheet.getRange(1,3,9,1)).addRange(sheet.getRange(1,5,9,1))
    .setNumHeaders(1).setPosition(12,1,0,0).setOption('title','Self-assessed knowledge and confidence: all responses')
    .setOption('hAxis',{viewWindow:{min:0,max:5}}).setOption('width',1050).setOption('height',500).build());
  const matched = ss.getSheetByName('Matched changes');
  matched.getCharts().forEach(chart => matched.removeChart(chart));
  matched.insertChart(matched.newChart().setChartType(Charts.ChartType.BAR)
    .addRange(matched.getRange(1,1,9,1)).addRange(matched.getRange(1,3,9,2))
    .setNumHeaders(1).setPosition(12,1,0,0).setOption('title','Self-assessments: matched pre/post pairs only')
    .setOption('hAxis',{viewWindow:{min:0,max:5}}).setOption('width',1050).setOption('height',500).build());
}
