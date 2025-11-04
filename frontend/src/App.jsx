import { BrowserRouter, Routes, Route } from "react-router-dom";

import MainLayout from "./layouts/MainLayout";
import FestivalsDetailsLayout from "./layouts/FestivalsDetailsLayout";
import HomePage from "./pages/HomePage";
import FestivalsPage from "./pages/FestivalsPage";
import ArtistsPage from "./pages/ArtistsPage";
import SponsorsPage from "./pages/SponsorsPage";
import StaffPage from "./pages/StaffPage";
import VendorsPage from "./pages/VendorsPage";

import StagesPage from "./pages/festivalsDetails/StagesPage";
import PerformancesPage from "./pages/festivalsDetails/PerformancesPage";
import VendorAssignmentsPage from "./pages/festivalsDetails/VendorAssignmentsPage";
import SponsorshipsPage from "./pages/festivalsDetails/SponsorshipsPage";
import StaffAssignmentsPage from "./pages/festivalsDetails/StaffAssignmentsPage";

function App() {
	return (
		<BrowserRouter>
			<Routes>
				<Route element={<MainLayout />}>
					<Route
						path="/"
						element={<HomePage />}
					/>
					<Route
						path="/festivals"
						element={<FestivalsPage />}
					/>
					<Route element={<FestivalsDetailsLayout />}>
						<Route
							path="/festivals/:id/stages"
							element={<StagesPage />}
						/>
						<Route
							path="/festivals/:id/performances"
							element={<PerformancesPage />}
						/>
						<Route
							path="/festivals/:id/vendor-assignments"
							element={<VendorAssignmentsPage />}
						/>
						<Route
							path="/festivals/:id/sponsorships"
							element={<SponsorshipsPage />}
						/>
						<Route
							path="/festivals/:id/staff-assignments"
							element={<StaffAssignmentsPage />}
						/>
					</Route>
					<Route
						path="/artists"
						element={<ArtistsPage />}
					/>
					<Route
						path="/sponsors"
						element={<SponsorsPage />}
					/>
					<Route
						path="/staff"
						element={<StaffPage />}
					/>
					<Route
						path="/vendors"
						element={<VendorsPage />}
					/>
				</Route>
			</Routes>
		</BrowserRouter>
	);
}

export default App;
