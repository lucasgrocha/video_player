import * as React from 'react';
import * as ReactDOM from 'react-dom';
import App from './App';

import './assets/styles/global.css';

document.addEventListener('turbolinks:load', () => {
  ReactDOM.render(<App />, document.getElementById('root'));
});
