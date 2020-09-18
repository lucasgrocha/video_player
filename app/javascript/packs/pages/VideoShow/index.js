import React, { useEffect, useState } from 'react';

import { useParams } from 'react-router-dom';

import videosService from '../../services/videosService';

import './styles.css';

function VideoShow() {
  const { id } = useParams();
  const [video, setVideo] = useState();

  useEffect(() => {
    videosService.show(id).then((res) => {
      setVideo(res.data);
      console.log(res.data);
    });
  }, []);

  if (!video) {
    return null;
  }

  return <p>{id}</p>;
}

export default VideoShow;
