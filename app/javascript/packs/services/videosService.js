import api from './api';

const videosService = {
  index: () => api.get('/video'),
  show: (id) => api.get(`/video/${id}`),
};

export default videosService;
