const express = require("express");
const { getSponsors } = require("./sponsors.controller.js");

const router = express.Router();

router.get("/sponsors", getSponsors);

module.exports = router;
