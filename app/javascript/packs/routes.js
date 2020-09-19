import React from 'react';

import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Navbar from './components/Navbar';

import Home from './pages/Home';
import VideoShow from './pages/VideoShow';

function AppRoutes() {
  return (
    <BrowserRouter>
    <Navbar />

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/videos/:id" element={<VideoShow />} />
      </Routes>
    </BrowserRouter>
  );
}

export default AppRoutes;
