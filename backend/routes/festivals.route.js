const express = require("express");
const {
	getFestivals,
	getFestivalById,
	getStagesForFestival,
	getPerformancesForFestival,
	getVendorAssignmentsForFestival,
	getSponsorshipsForFestival,
	getStaffAssignmentsForFestival,
} = require("./festivals.controller.js");

const router = express.Router();

//Route to get all festivals
router.get("/", getFestivals);

// Route to get festival by ID
router.get("/:id", getFestivalById);

// Route to get stages for a festival
router.get("/:id/stages", getStagesForFestival);

// Route to get performances for a festival
router.get("/:id/performances", getPerformancesForFestival);

// Route to get vendor assignments for a festival
router.get("/:id/vendor-assignments", getVendorAssignmentsForFestival);

// Route to get sponsorships for a festival
router.get("/:id/sponsorships", getSponsorshipsForFestival);

// Route to get staff assignments for a festival
router.get("/:id/staff-assignments", getStaffAssignmentsForFestival);
module.exports = router;
