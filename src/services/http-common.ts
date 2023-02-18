import axios from 'axios';

export default axios.create({
  baseURL: import.meta.env.VITE_API,
  headers: {
    'Content-type': 'application/json',
    timeout: 20000,
  },
});
