export const sponsorshipColumns = [
	{ header: "ID", accessor: "sponsorshipID" },
	{ header: "Sponsor ID", accessor: "sponsorID" },
	{ header: "Festival ID", accessor: "festivalID" },
	{ header: "Amount", accessor: "sponsorshipAmount" },
	{ header: "Tier", accessor: "sponsorshipTier" },
	{ header: "Contract Date", accessor: "contractDate" },
	{ header: "Benefits", accessor: "benefits" },
];

export const sponsorshipFields = [
	{
		name: "sponsorID",
		label: "Sponsor ID",
		type: "number",
		placeholder: "Enter sponsor ID",
	},
	{
		name: "festivalID",
		label: "Festival ID",
		type: "number",
		placeholder: "Enter festival ID",
	},
	{
		name: "sponsorshipAmount",
		label: "Sponsorship Amount",
		type: "number",
		step: "0.01",
		placeholder: "Enter amount",
	},
	{
		name: "sponsorshipTier",
		label: "Sponsorship Tier",
		placeholder: "Gold, Silver, Bronze, etc.",
	},
	{ name: "contractDate", label: "Contract Date", type: "date" },
	{
		name: "benefits",
		label: "Benefits",
		type: "textarea",
		placeholder: "Describe sponsor perks",
	},
];
