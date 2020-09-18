import React, { useEffect } from 'react';

import videosService from '../../services/videosService'

function Home() {

  useEffect(() => {
    videosService.index().then(res => {
      console.log(res.data)
    })
  }, [])

  return (
    <div className='container'>

    </div>
  );
}

export default Home;