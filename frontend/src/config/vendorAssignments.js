export const vendorAssignmentColumns = [
	{ header: "ID", accessor: "assignmentID" },
	{ header: "Vendor ID", accessor: "vendorID" },
	{ header: "Festival ID", accessor: "festivalID" },
	{ header: "Booth Number", accessor: "boothNumber" },
	{ header: "Registration Fee", accessor: "registrationFee" },
	{ header: "Assignment Date", accessor: "assignmentDate" },
];

export const vendorAssignmentFields = [
	{
		name: "vendorID",
		label: "Vendor ID",
		type: "number",
		placeholder: "Enter vendor ID",
	},
	{
		name: "festivalID",
		label: "Festival ID",
		type: "number",
		placeholder: "Enter festival ID",
	},
	{
		name: "boothNumber",
		label: "Booth Number",
		placeholder: "Enter booth number",
	},
	{
		name: "registrationFee",
		label: "Registration Fee",
		type: "number",
		step: "0.01",
		placeholder: "Enter fee",
	},
	{ name: "assignmentDate", label: "Assignment Date", type: "date" },
];
