import { useState } from "react";
import CrudPage from "../../components/CrudPage";
import {
	vendorAssignmentColumns,
	vendorAssignmentFields,
} from "../../config/vendorAssignments";

const fakeVendorAssignments = [
	{
		assignmentID: 1,
		vendorID: 2,
		festivalID: 1,
		boothNumber: "A12",
		registrationFee: 450.0,
		assignmentDate: "2025-07-10",
	},
	{
		assignmentID: 2,
		vendorID: 5,
		festivalID: 1,
		boothNumber: "B07",
		registrationFee: 600.0,
		assignmentDate: "2025-07-11",
	},
	{
		assignmentID: 3,
		vendorID: 1,
		festivalID: 2,
		boothNumber: "C04",
		registrationFee: 350.0,
		assignmentDate: "2025-07-15",
	},
	{
		assignmentID: 4,
		vendorID: 4,
		festivalID: 2,
		boothNumber: "D22",
		registrationFee: 800.0,
		assignmentDate: "2025-07-16",
	},
	{
		assignmentID: 5,
		vendorID: 3,
		festivalID: 3,
		boothNumber: "E10",
		registrationFee: 500.0,
		assignmentDate: "2025-07-20",
	},
];

function VendorAssignmentsPage() {
	const [data, setData] = useState(fakeVendorAssignments);
	const handleSubmit = (item) => {
		console.log(`Submitted, ${item}`);
	};
	const handleDelete = (item) => {
		console.log(`Deleted ${item}`);
		setData((prev) => prev.filter((v) => v.assignmentID !== item.assignmentID));
	};
	return (
		<>
			<h3 className="text-3xl font-bold px-2 py-1">
				Electric Daisy Carnival:{" "}
			</h3>
			<CrudPage
				title="Vendor Assignments"
				columns={vendorAssignmentColumns}
				fields={vendorAssignmentFields}
				initialData={data}
				setData={setData}
				onSubmit={handleSubmit}
				onDelete={handleDelete}
				idAccessor="assignmentID"
				displayNameAccessor="boothNumber"
			/>
		</>
	);
}

export default VendorAssignmentsPage;
