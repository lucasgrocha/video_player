import React, { useEffect, useState } from 'react';

import videosService from '../../services/videosService'

function Home() {

  const [videos, setVideos] = useState()

  useEffect(() => {
    videosService.index().then(res => {
      setVideos(res.data)
    })
  }, [])

  if (!videos) {
    return null
  }

  return (
    <div className='container'>
      { videos[1].name }
    </div>
  );
}

export default Home;