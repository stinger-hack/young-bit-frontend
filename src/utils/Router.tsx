import { RouteObject } from 'react-router-dom';

import { HomePage, LibraryPage } from '../pages';
import { paths } from './paths';

export const Router: RouteObject[] = [
  {
    path: paths.home,
    element: <HomePage />,
  },
  {
    path: paths.library,
    element: <LibraryPage />,
  },
  {
    path: paths.analytic,
    element: <HomePage />,
  },
  {
    path: paths.shop,
    element: <HomePage />,
  },
];
