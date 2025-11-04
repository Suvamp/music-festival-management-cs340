import { useState } from "react";
import CrudPage from "../../components/CrudPage";
import { stageColumns, stageFields } from "../../config/stages";

const fakeStages = [
	{
		stageID: 1,
		festivalID: 1,
		stageName: "Main Stage",
		capacity: 15000,
		stageType: "Outdoor",
		locationDescription: "Center of the festival grounds",
		hasCover: false,
	},
	{
		stageID: 2,
		festivalID: 1,
		stageName: "River Stage",
		capacity: 6000,
		stageType: "Outdoor",
		locationDescription: "Next to the river with scenic views",
		hasCover: false,
	},
	{
		stageID: 3,
		festivalID: 1,
		stageName: "Tent Stage",
		capacity: 4000,
		stageType: "Indoor",
		locationDescription: "Large covered tent with lighting rig",
		hasCover: true,
	},
	{
		stageID: 4,
		festivalID: 1,
		stageName: "Acoustic Lounge",
		capacity: 1500,
		stageType: "Indoor",
		locationDescription: "Small cozy stage for intimate performances",
		hasCover: true,
	},
	{
		stageID: 5,
		festivalID: 1,
		stageName: "Electronic Dome",
		capacity: 8000,
		stageType: "Outdoor",
		locationDescription: "360° LED dome for electronic artists",
		hasCover: false,
	},
];

function StagesPage() {
	const [data, setData] = useState(fakeStages);
	const handleSubmit = (item) => {
		console.log(`Submitted, ${item}`);
	};
	const handleDelete = (item) => {
		console.log(`Deleted ${item}`);
		setData((prev) => prev.filter((s) => s.stageID !== item.stageID));
	};
	return (
		<>
			<h3 className="text-3xl font-bold px-2 py-1">
				Electric Daisy Carnival:{" "}
			</h3>
			<CrudPage
				title="Stages"
				columns={stageColumns}
				fields={stageFields}
				initialData={data}
				setData={setData}
				onDelete={handleDelete}
				onSubmit={handleSubmit}
				idAccessor="stageID"
				displayNameAccessor="stageName"
			/>
		</>
	);
}

export default StagesPage;
