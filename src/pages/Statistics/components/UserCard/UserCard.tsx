/* eslint-disable no-nested-ternary */
/* eslint-disable react/no-array-index-key */
import { FC } from 'react';

import { UserType } from 'services/users/types';
import Icon from 'ui-kit/Icon';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

export const UserCard: FC<UserType> = ({
  first_name = '',
  last_name = '',
  img_link,
  username = '',
  patronymic,
  score = 0,
  cards,
}) => {
  return (
    <div className={styles.UserCard}>
      <div className={styles.UserCard_content}>
        <img className={styles.UserCard_avatar} src={img_link} alt={username} />
        <div className={styles.UserCard_name}>
          <Text>{`${last_name} ${first_name}`}</Text>
          <Text className={styles.UserCard_patronymic}>{patronymic}</Text>
        </div>
        <Text className={styles.UserCard_rewards} weight="regular" size="h2">
          {score}
          <Icon iconName="reward" className={styles['UserCard_rewards-icon']} />
        </Text>
      </div>
      <div className={styles.UserCard_cards}>
        {cards.map((el, i) =>
          i < 5 ? (
            <img
              key={i}
              src={el}
              alt="reward"
              className={styles.UserCard_rewardImg}
            />
          ) : i === 5 ? (
            <div className={styles.UserCard_more}>
              <Text className={styles['UserCard_more-text']} size="t2">
                {`ещё ${cards.length - 4}`}
              </Text>
            </div>
          ) : null
        )}
      </div>
    </div>
  );
};
