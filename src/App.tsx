import { FC } from 'react';
import { useRoutes } from 'react-router-dom';

import { Router as PathRouter } from './utils/Router';
import { LoadingProvider } from './components';

export const App: FC = () => {
  const routes = useRoutes(PathRouter);

  return <LoadingProvider>{routes}</LoadingProvider>;
};
