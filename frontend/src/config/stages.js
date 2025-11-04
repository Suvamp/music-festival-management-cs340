export const stageColumns = [
	{ header: "ID", accessor: "stageID" },
	{ header: "Festival ID", accessor: "festivalID" },
	{ header: "Stage Name", accessor: "stageName" },
	{ header: "Capacity", accessor: "capacity" },
	{ header: "Stage Type", accessor: "stageType" },
	{ header: "Location Description", accessor: "locationDescription" },
	{ header: "Has Cover", accessor: "hasCover" },
];

export const stageFields = [
	{
		name: "festivalID",
		label: "Festival ID",
		type: "number",
		placeholder: "Enter festival ID",
	},
	{ name: "stageName", label: "Stage Name", placeholder: "Enter stage name" },
	{
		name: "capacity",
		label: "Capacity",
		type: "number",
		placeholder: "Enter capacity",
	},
	{ name: "stageType", label: "Stage Type", placeholder: "Enter stage type" },
	{
		name: "locationDescription",
		label: "Location Description",
		placeholder: "Describe location",
	},
	{ name: "hasCover", label: "Has Cover", type: "checkbox" },
];
