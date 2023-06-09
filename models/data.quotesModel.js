const mongoose = require("mongoose");

const quotesDataSchema = new mongoose.Schema({
  quotesContent: {
    type: String
  },
  quotesAuthor: {
    type: String
  },
  id: {
    type: Number
  },
  year: {
    type: Number
  }
});

module.exports = mongoose.model('Quotes', quotesDataSchema);
