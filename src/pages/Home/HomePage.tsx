import { FC } from 'react';

import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

export const HomePage: FC = () => {
  return (
    <div className={styles.HomePage}>
      <Text size="h1">Здарова</Text>
    </div>
  );
};
