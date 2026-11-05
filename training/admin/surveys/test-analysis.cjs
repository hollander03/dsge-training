// Offline checks of matching, missing answers, distributions and form construction.
const fs = require('node:fs');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const context = vm.createContext({console});
vm.runInContext(fs.readFileSync(__dirname + '/Code.gs', 'utf8'), context);
vm.runInContext(`
function record(code, knowledge, firstSkill) {
 return {code, scores:[knowledge,firstSkill,null,null,null,null,null,null], answers:[]};
}
const pre=[record('ABCD1234',2,1),record('EFGH5678',3,null),record('DUPL0001',1,1),
 record('DUPL0001',4,4),record('PREO0001',2,2),record('',5,5)];
const post=[record('ABCD1234',4,3),record('EFGH5678',2,4),record('DUPL0001',5,5),record('POST0001',4,4)];
const analysis=analyse_(pre,post);
`, context);
const val = code => vm.runInContext(code, context);
assert.equal(val('analysis.matches.length'), 2);
assert.equal(val('analysis.metrics[0].pairN'), 2);
assert.equal(val('analysis.metrics[0].change'), 0.5);
assert.equal(val('analysis.metrics[0].pairedPre'), 2.5);
assert.equal(val('analysis.metrics[0].pairedPost'), 3);
assert.equal(val('analysis.metrics[1].pairN'), 1);
assert.equal(val('analysis.metrics[1].pairedPre'), 1);
assert.equal(val('analysis.metrics[1].pairedPost'), 3);
assert.equal(val('analysis.metrics[1].change'), 2);
assert.equal(val('analysis.audit.find(r => r[0]==="DUPL0001")[3]'), 'Duplicate - excluded');
assert.equal(val('analysis.audit.find(r => r[0]==="PREO0001")[3]'), 'Pre only');
assert.equal(val('analyse_([],[]).metrics[0].change'), null);
assert.equal(val('analyse_([],[]).metrics[0].pairN'), 0);
assert.equal(val('analyse_([record("ABCD1234",1,1)],[record("ABCD1234",2,2),record("ABCD1234",3,3)]).matches.length'), 0);
assert.equal(val('normalizeCode_(" abcd1234 ")'), 'ABCD1234');
assert.equal(val('validCode_("BIRTHDAY!")'), false);
assert.equal(val('score_("5 - Advanced")'), 5);
assert.equal(val('score_("")'), null);
assert.equal(val('safeCell_("=IMPORTXML(1)")'), "'=IMPORTXML(1)");
assert.equal(val('safeCell_("00123456")'), "'00123456");
assert.equal(val('safeCell_(-2)'), -2);
assert.equal(val('answerCounts_([{answers:[{question:"Q",value:["A","A","B"]}]}],"PRE")[0][3]'), 1);
// Verify both forms use identical measurement wording and scale options.
class Item {
 constructor(kind, id) { this.kind=kind; this.id=id; }
 getId(){return this.id;}
 setTitle(v){this.title=v;return this;}
 setHelpText(v){this.help=v;return this;}
 setRequired(v){this.required=v;return this;}
 setValidation(v){this.validation=v;return this;}
 setChoiceValues(v){this.choices=Array.from(v);return this;}
 setRows(v){this.rows=Array.from(v);return this;}
 setColumns(v){this.columns=Array.from(v);return this;}
 showOtherOption(v){this.other=v;return this;}
}
class Form {
 constructor(){this.items=[];}
 setDescription(v){this.description=v;return this;}
 setConfirmationMessage(v){return this;}
 add(kind){const item=new Item(kind,this.items.length+1);this.items.push(item);return item;}
 addTextItem(){return this.add('text');}
 addMultipleChoiceItem(){return this.add('choice');}
 addCheckboxItem(){return this.add('checkbox');}
 addParagraphTextItem(){return this.add('paragraph');}
 addGridItem(){return this.add('grid');}
}
const validation = {requireTextMatchesPattern(){return this;},setHelpText(){return this;},requireSelectAtMost(){return this;},build(){return this;}};
context.FormApp={createTextValidation:()=>validation,createCheckboxValidation:()=>validation};
context.preForm=new Form();context.postForm=new Form();
val('buildSurvey_(preForm,"pre"); buildSurvey_(postForm,"post");');
for(let i=0;i<3;i++) assert.deepEqual(context.preForm.items[i],context.postForm.items[i]);
assert.equal(context.preForm.items[0].required,true);
assert.equal(context.preForm.items[1].required,false);
assert.equal(context.preForm.items[2].required,false);
console.log('Passed: matching, duplicate exclusion, itemwise missing data, empty responses, code handling, safe cells, checkbox counts, identical pre/post scales.');
if (process.argv.includes('--preview')) {
 let markdown = '# Questionnaire preview\n\nOnly the random participant code is required. All remaining questions are optional.\n\n';
 for (const [label, form] of [['Pre-training',context.preForm],['Post-training',context.postForm]]) {
  markdown += '## ' + label + '\n\n' + form.description + '\n\n';
  form.items.forEach((item,i) => {
   markdown += '### ' + (i+1) + '. ' + item.title + (item.required ? ' (required)' : '') + '\n\n';
   if(item.help) markdown += item.help + '\n\n';
   if(item.choices) markdown += item.choices.map(x=>'- '+x).join('\n')+'\n\n';
   if(item.other) markdown += '- Other (please specify)\n\n';
   if(item.rows) markdown += '**Tasks:**\n\n'+item.rows.map(x=>'- '+x).join('\n')+'\n\n**Scale:**\n\n'+item.columns.map(x=>'- '+x).join('\n')+'\n\n';
  });
 }
 fs.writeFileSync(__dirname+'/QUESTIONNAIRES.md',markdown);
}
