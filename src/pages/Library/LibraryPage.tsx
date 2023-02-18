import { FC, useEffect } from 'react';

import { AppLayout } from 'components/AppLayout';
import { useGetLibrary } from 'services/library/library.service';

import { TopicSection } from './components/TopicSection';

import styles from './styles.module.scss';

export const LibraryPage: FC = () => {
  const { data: library, isLoading, mutate: getLibrary } = useGetLibrary();

  useEffect(() => {
    getLibrary();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <AppLayout header="Библиотека">
      <div className={styles.LibraryPage}>
        {!isLoading
          ? library?.data.body.map((el) => (
              <TopicSection
                key={el.category}
                cards={el.cards}
                title={el.category}
              />
            ))
          : null}
      </div>
    </AppLayout>
  );
};
