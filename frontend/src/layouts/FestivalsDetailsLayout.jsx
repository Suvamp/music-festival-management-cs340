import { Outlet, useNavigate } from "react-router-dom";
import SideNavbar from "../features/festivals/SideNavbar";

export default function MainLayout() {
	const nav = useNavigate();
	return (
		<div className="flex h-screen flex-col">
			{/* Sidebar */}
			<aside className="px-6">
				<SideNavbar />
			</aside>

			{/* Main content */}
			<main className="flex-1 bg-gray-100 p-6 overflow-auto">
				<button onClick={() => nav("/festivals")}>
					{" "}
					{`<-`} Go Back To Festivals
				</button>
				<Outlet />
			</main>
		</div>
	);
}
