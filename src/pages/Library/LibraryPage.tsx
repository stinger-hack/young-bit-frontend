import { FC } from 'react';

import { AppLayout } from 'components/AppLayout';

import styles from './styles.module.scss';

export const LibraryPage: FC = () => {
  return (
    <AppLayout header="Библиотека">
      <div className={styles.LibraryPage} />
    </AppLayout>
  );
};
