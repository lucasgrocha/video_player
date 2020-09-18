import api from './api';

const videosService = {
  index: () => api.get('/video'),
  show: (id) => api.get(`/video/${id}`),
  recommended_videos: () => api.get('/recommended_videos'),
};

export default videosService;
