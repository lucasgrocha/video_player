import React from 'react';
import PropTypes from 'prop-types';

import './styles.css';

function VideoCard(props) {
  return (
    <div className="video-card">
      <div className="thumbnail">
        <img src={props.thumbnail_url} alt="Thumb" />
      </div>

      <div className="info">
        <h3 id="video-name">{props.name}</h3>
        <div id="user-name">{props.userName}</div>
        <div id="views">{props.views} visualizações</div>
      </div>
    </div>
  );
}

VideoCard.propTypes = {
  thumbnail_url: PropTypes.string.isRequired,
  name: PropTypes.string.isRequired,
  views: PropTypes.number.isRequired,
  userName: PropTypes.string.isRequired,
};

export default VideoCard;
