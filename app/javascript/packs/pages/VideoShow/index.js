import React, { useEffect, useState } from 'react';
import ReactPlayer from 'react-player';
import { useParams } from 'react-router-dom';

import './styles.css';
import videosService from '../../services/videosService';
import VideoCard from '../../components/VideoCard';

function VideoShow() {
  const { id } = useParams();
  const [video, setVideo] = useState();
  const [recommendedVideos, setRecommendedVideos] = useState();

  useEffect(() => {
    videosService.show(id).then((res) => {
      setVideo(res.data);
    });
  }, []);

  useEffect(() => {
    videosService.recommended_videos().then((res) => {
      setRecommendedVideos(res.data);
    });
  }, []);

  if (!video || !recommendedVideos) {
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
        <div id="videos-list">
          {recommendedVideos.map((video) => (
            <VideoCard
              id={video.id}
              key={video.id}
              name={video.name}
              thumbnail_url={video.thumbnail_url}
              views={video.views}
              userName={video.user_name}
            />
          ))}
        </div>
      </div>
    </div>
  );
}

export default VideoShow;
