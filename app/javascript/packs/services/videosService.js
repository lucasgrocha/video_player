import api from './api'

const videosService = {
  index: () => api.get('/video')
}

export default videosService