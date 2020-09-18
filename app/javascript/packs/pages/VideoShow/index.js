import React, { useEffect, useState } from 'react';

import { useParams } from 'react-router-dom';

import videosService from '../../services/videosService';

import ReactPlayer from 'react-player';

import './styles.css';

function VideoShow() {
  const { id } = useParams();
  const [video, setVideo] = useState();

  useEffect(() => {
    videosService.show(id).then((res) => {
      setVideo(res.data);
    });
  }, []);

  if (!video) {
    return null;
  }

  return (
    <div className="container">
      <div id="video">
        <div id="video-box">
          <div id="player">
            <ReactPlayer
              url={video.file_url}
              controls
              playing={true}
              onStart={() => console.log('started')}
            />
          </div>

          <div id="video-infos">
            <h1>{video.name}</h1>
            <p>{video.user_name}</p>
            <p>{video.views} visualizações</p>
            <p id="description">{video.description}</p>
          </div>
        </div>
        <div id="videos-list"></div>
      </div>
    </div>
  );
}

export default VideoShow;
