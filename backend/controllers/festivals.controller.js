const getFestivals = (req, res) => {
	res.send("All festivals");
};

const getFestivalById = (req, res) => {
	const { id } = req.params;
	res.send(`Festival with ID: ${id}`);
};

const getStagesForFestival = (req, res) => {
	const { id } = req.params;
	res.send(`Stages for festival ID: ${id}`);
};

const getPerformancesForFestival = (req, res) => {
	const { id } = req.params;
	res.send(`Performances for festival ID: ${id}`);
};

const getVendorAssignmentsForFestival = (req, res) => {
	const { id } = req.params;
	res.send(`Vendor assignments for festival ID: ${id}`);
};

const getSponsorshipsForFestival = (req, res) => {
	const { id } = req.params;
	res.send(`Sponsorships for festival ID: ${id}`);
};

const getStaffAssignmentsForFestival = (req, res) => {
	const { id } = req.params;
	res.send(`Staff assignments for festival ID: ${id}`);
};

module.exports = {
	getFestivals,
	getFestivalById,
	getStagesForFestival,
	getPerformancesForFestival,
	getVendorAssignmentsForFestival,
	getSponsorshipsForFestival,
	getStaffAssignmentsForFestival,
};
