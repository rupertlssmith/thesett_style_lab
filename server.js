'use strict';

var express = require('express');
var app = express();

app.use('/style-lab', express.static('app'));
app.listen(9072);
