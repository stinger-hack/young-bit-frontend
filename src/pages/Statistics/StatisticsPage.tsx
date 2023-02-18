/* eslint-disable react/jsx-props-no-spreading */
/* eslint-disable react/no-array-index-key */
import { FC, useEffect, useMemo } from 'react';

import { AppLayout } from 'components/AppLayout';
import Text from 'ui-kit/Text';
import Icon from 'ui-kit/Icon';
import { useGetUsers } from 'services/users/users.service';

import puzzle from './assets/puzzle.png';
import { UserCard } from './components/UserCard/UserCard';

import styles from './styles.module.scss';

export const StatisticsPage: FC = () => {
  const { mutate, data: users, isLoading } = useGetUsers();

  useEffect(() => {
    mutate(1);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const totalRewards = useMemo(
    () => users?.data.body.reduce((acc, cur) => acc + cur.score, 0),
    [users?.data.body]
  );

  return (
    <AppLayout header="Статистика">
      <div className={styles.StatisticsPage}>
        <div className={styles.StatisticsPage_header}>
          <div className={styles['StatisticsPage_header-text']}>
            <Text size="h2">Пазл</Text>
            <Text size="h2" className={styles.StatisticsPage_count}>
              61/64
            </Text>
          </div>
          <Icon iconName="dots" />
        </div>
        <img
          src={puzzle}
          alt="puzzle"
          width="100%"
          className={styles.StatisticsPage_puzzle}
        />
        <div className={styles.StatisticsPage_header}>
          <div className={styles['StatisticsPage_header-text']}>
            <Text size="h2">Команда</Text>
            <Text
              size="h2"
              className={styles.StatisticsPage_count2}
              weight="regular"
            >
              {totalRewards}
              <Icon
                iconName="reward"
                className={styles.StatisticsPage_rewards}
              />
            </Text>
          </div>
          <Icon iconName="dots" className={styles.StatisticsPage_dots} />
        </div>
        <div className={styles.StatisticsPage_grid}>
          {!isLoading && users
            ? users.data.body.map((el, i) => <UserCard key={i} {...el} />)
            : null}
        </div>
      </div>
    </AppLayout>
  );
};
