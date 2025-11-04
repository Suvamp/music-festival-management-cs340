import { useState } from "react";
import CrudPage from "../../components/CrudPage";
import {
	staffAssignmentColumns,
	staffAssignmentFields,
} from "../../config/staffAssignments";

export const fakeStaffAssignments = [
	{
		staffAssignmentID: 1,
		staffID: 4,
		festivalID: 1,
		assignedDate: "2025-06-15",
		hoursWorked: 12.5,
		shiftNotes: "Managed VIP entrance, handled early check-ins.",
	},
	{
		staffAssignmentID: 2,
		staffID: 1,
		festivalID: 1,
		assignedDate: "2025-06-16",
		hoursWorked: 8.0,
		shiftNotes: "Staffed main gate security. Smooth shift.",
	},
	{
		staffAssignmentID: 3,
		staffID: 3,
		festivalID: 2,
		assignedDate: "2025-07-01",
		hoursWorked: 10.25,
		shiftNotes: "Assisted artist load-in and backstage coordination.",
	},
	{
		staffAssignmentID: 4,
		staffID: 2,
		festivalID: 3,
		assignedDate: "2025-07-10",
		hoursWorked: 6.5,
		shiftNotes: "Operated merchandise booth.",
	},
	{
		staffAssignmentID: 5,
		staffID: 5,
		festivalID: 2,
		assignedDate: "2025-07-02",
		hoursWorked: 9.75,
		shiftNotes: "Supported food vendor logistics.",
	},
];

function StaffAssignmentsPage() {
	const [data, setData] = useState(fakeStaffAssignments);
	const handleSubmit = (item) => {
		console.log(`Submitted, ${item}`);
	};
	const handleDelete = (item) => {
		console.log(`Deleted ${item}`);
		setData((prev) =>
			prev.filter((s) => s.staffAssignmentID !== item.staffAssignmentID)
		);
	};
	return (
		<>
			<h3 className="text-3xl font-bold px-2 py-1">
				Electric Daisy Carnival:{" "}
			</h3>
			<CrudPage
				title="Staff Assignment"
				columns={staffAssignmentColumns}
				fields={staffAssignmentFields}
				initialData={data}
				setData={setData}
				onSubmit={handleSubmit}
				onDelete={handleDelete}
				idAccessor="staffAssignmentID"
				displayNameAccessor="staffAssignmentID"
			/>
		</>
	);
}

export default StaffAssignmentsPage;
