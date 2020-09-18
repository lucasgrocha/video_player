import React from 'react';

import { useParams } from 'react-router-dom';

import './styles.css';

function VideoShow() {
  const { id } = useParams();

  return <p>{id}</p>;
}

export default VideoShow;
