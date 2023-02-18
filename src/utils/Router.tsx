import { RouteObject } from 'react-router-dom';

import { NotFoundPage } from 'pages/NotFoundPage';

import { HomePage, LibraryPage, ShopPage, StatisticsPage } from '../pages';
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
    path: paths.statistics,
    element: <StatisticsPage />,
  },
  {
    path: paths.shop,
    element: <ShopPage />,
  },
  {
    path: '*',
    element: <NotFoundPage />,
  },
];
