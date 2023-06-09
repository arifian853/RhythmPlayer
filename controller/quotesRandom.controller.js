const Quotes = require("../models/data.quotesModel");

exports.getQuotes = async (req, res) => {
  try {
    const response = await Quotes.find();
    res.json(response);

  } catch (error) {
    console.log(error.message);
  }
};

exports.getQuotesById = async (req, res) => {
  
  try {
    const response = await Quotes.findOne({
      id: req.params.id
    });
    res.json(response);
  } catch (error) {
    console.log(error.message);
  }
};
