const express = require("express");
const { getVendors } = require("./vendors.controller.js");

const router = express.Router();

router.get("/vendors", getVendors);

module.exports = router;
