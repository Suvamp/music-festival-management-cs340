export const performanceColumns = [
	{ header: "ID", accessor: "performanceID" },
	{ header: "Artist ID", accessor: "artistID" },
	{ header: "Stage ID", accessor: "stageID" },
	{ header: "Performance Date", accessor: "performanceDate" },
	{ header: "Start Time", accessor: "startTime" },
	{ header: "End Time", accessor: "endTime" },
	{ header: "Setup Notes", accessor: "setupNotes" },
	{ header: "Soundcheck Time", accessor: "soundcheckTime" },
];

export const performanceFields = [
	{
		name: "artistID",
		label: "Artist ID",
		type: "number",
		placeholder: "Enter artist ID",
	},
	{
		name: "stageID",
		label: "Stage ID",
		type: "number",
		placeholder: "Enter stage ID",
	},
	{ name: "performanceDate", label: "Performance Date", type: "date" },
	{ name: "startTime", label: "Start Time", type: "time" },
	{ name: "endTime", label: "End Time", type: "time" },
	{
		name: "setupNotes",
		label: "Setup Notes",
		type: "textarea",
		placeholder: "Enter setup notes",
	},
	{ name: "soundcheckTime", label: "Soundcheck Time", type: "time" },
];
