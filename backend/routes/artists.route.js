const express = require("express");
const { getArtists } = require("./artists.controller.js");

const router = express.Router();

router.get("/artists", getArtists);

module.exports = router;
