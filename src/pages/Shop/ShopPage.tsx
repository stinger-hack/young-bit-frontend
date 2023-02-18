import { FC } from 'react';

import { AppLayout } from 'components/AppLayout';
import Text from 'ui-kit/Text';
import Icon from 'ui-kit/Icon';

import { ShopCard } from './components/ShopCard/ShopCard';

import styles from './styles.module.scss';

export const ShopPage: FC = () => {
  return (
    <AppLayout header="Магазин">
      <div className={styles.ShopPage}>
        <div className={styles.ShopPage_header}>
          <div className={styles['ShopPage_header-text']}>
            <Text size="h2">Каталог</Text>
            <Text size="h2" className={styles.ShopPage_count}>
              16
            </Text>
          </div>
          <Icon iconName="dots" className={styles.ShopPage_dots} />
        </div>
        <div className={styles.ShopPage_grid}>
          <ShopCard />
          <ShopCard />
          <ShopCard />
          <ShopCard />
          <ShopCard />
          <ShopCard />
          <ShopCard />
          <ShopCard />
        </div>
      </div>
    </AppLayout>
  );
};
