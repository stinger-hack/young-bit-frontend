import { FC } from 'react';
import { useRoutes } from 'react-router-dom';

import { AppLayout } from './components/AppLayout';
import { Router as PathRouter } from './utils/Router';
import { LoadingProvider } from './components';

export const App: FC = () => {
  const routes = useRoutes(PathRouter);

  return (
    <LoadingProvider>
      <AppLayout>{routes}</AppLayout>
    </LoadingProvider>
  );
};
