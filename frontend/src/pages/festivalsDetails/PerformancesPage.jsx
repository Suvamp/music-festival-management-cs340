import { useState } from "react";
import CrudPage from "../../components/CrudPage";
import {
	performanceColumns,
	performanceFields,
} from "../../config/performances";

const fakePerformances = [
	{
		performanceID: 1,
		artistID: 1,
		stageID: 2,
		performanceDate: "2025-08-12",
		startTime: "18:00:00",
		endTime: "19:00:00",
		setupNotes: "Requires fog machine and extra lighting",
		soundcheckTime: "16:30:00",
	},
	{
		performanceID: 2,
		artistID: 4,
		stageID: 1,
		performanceDate: "2025-08-12",
		startTime: "20:00:00",
		endTime: "21:15:00",
		setupNotes: "Vocal reverb requested",
		soundcheckTime: "18:00:00",
	},
	{
		performanceID: 3,
		artistID: 2,
		stageID: 3,
		performanceDate: "2025-08-13",
		startTime: "14:00:00",
		endTime: "15:00:00",
		setupNotes: "Wireless mics required",
		soundcheckTime: "12:45:00",
	},
	{
		performanceID: 4,
		artistID: 5,
		stageID: 1,
		performanceDate: "2025-08-13",
		startTime: "16:00:00",
		endTime: "17:30:00",
		setupNotes: "DJ table and LED wall",
		soundcheckTime: "14:30:00",
	},
	{
		performanceID: 5,
		artistID: 3,
		stageID: 2,
		performanceDate: "2025-08-14",
		startTime: "19:30:00",
		endTime: "20:45:00",
		setupNotes: "Full band, needs 6 monitors",
		soundcheckTime: "18:00:00",
	},
];

function PerformancesPage() {
	const [data, setData] = useState(fakePerformances);

	const handleSubmit = (item) => {
		console.log(`Submitted, ${item}`);
	};
	const handleDelete = (item) => {
		console.log(`Deleted ${item}`);
		setData((prev) =>
			prev.filter((p) => p.performanceID !== item.performanceID)
		);
	};
	return (
		<>
			<h3 className="text-3xl font-bold px-2 py-1">
				Electric Daisy Carnival:{" "}
			</h3>
			<CrudPage
				title="Performances"
				columns={performanceColumns}
				fields={performanceFields}
				initialData={data}
				setData={setData}
				onSubmit={handleSubmit}
				onDelete={handleDelete}
				idAccessor="performanceID"
				displayNameAccessor="performanceID"
			/>
		</>
	);
}

export default PerformancesPage;
