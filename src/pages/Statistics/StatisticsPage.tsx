import { FC } from 'react';

import { AppLayout } from 'components/AppLayout';
import Text from 'ui-kit/Text';
import Icon from 'ui-kit/Icon';

import styles from './styles.module.scss';

export const StatisticsPage: FC = () => {
  return (
    <AppLayout header="Статистика">
      <div className={styles.StatisticsPage}>
        <div className={styles.StatisticsPage_header}>
          <div className={styles['StatisticsPage_header-text']}>
            <Text size="h2">Пазл</Text>
            <Text size="h2" className={styles.StatisticsPage_puzzleCount}>
              61/64
            </Text>
          </div>
          <Icon iconName="dots" className={styles.StatisticsPage_dots} />
        </div>
      </div>
    </AppLayout>
  );
};
