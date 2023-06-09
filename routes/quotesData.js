const express = require('express');
const { getQuotes, getQuotesById } = require('../controller/quotesRandom.controller');
const router = express.Router();

router.get('/quotes', getQuotes);
router.get('/quotes/:id', getQuotesById);

module.exports = router