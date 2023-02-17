import { RouteObject } from 'react-router-dom';

import { HomePage } from '../pages';
import { paths } from './paths';

export const Router: RouteObject[] = [
  {
    path: paths.home,
    element: <HomePage />,
  },
];
