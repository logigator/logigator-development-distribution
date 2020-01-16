const fs = require('fs');
const path = require('path');

const logigatorHomePackage = require('./logigator-home/package.json');
logigatorHomePackage.dependencies['@logigator/logigator-shared-comps'] = 'file:../logigator-shared-comps/dist/logigator-shared-comps';
fs.writeFileSync(path.join(__dirname, 'logigator-home', 'package.json'), JSON.stringify(logigatorHomePackage, null, '\t'));

const logigatorEditorPackage = require('./logigator-editor/package.json');
logigatorEditorPackage.dependencies['@logigator/logigator-shared-comps'] = 'file:../logigator-shared-comps/dist/logigator-shared-comps';
logigatorEditorPackage.dependencies['@logigator/logigator-simulation'] = 'file:../logigator-simulation';
fs.writeFileSync(path.join(__dirname, 'logigator-editor', 'package.json'), JSON.stringify(logigatorEditorPackage, null, '\t'));
