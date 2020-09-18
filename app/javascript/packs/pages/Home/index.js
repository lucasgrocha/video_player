import React, { useEffect, useState } from 'react';
import VideoCard from '../../components/VideoCard';

import videosService from '../../services/videosService';

import './styles.css';

function Home() {
  const [videos, setVideos] = useState();

  useEffect(() => {
    videosService.index().then((res) => {
      setVideos(res.data);
    });
  }, []);

  if (!videos) {
    return null;
  }

  return (
    <div className="container">
      <div id="videos">
        {videos.map((video) => (
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
  );
}

export default Home;
