/* eslint-disable react/jsx-props-no-spreading */
import { FC, useEffect, useMemo } from 'react';

import { AppLayout } from 'components/AppLayout';
import Text from 'ui-kit/Text';
import Icon from 'ui-kit/Icon';
import { useGetShop } from 'services/shop/shop.service';

import { ShopCard } from './components/ShopCard/ShopCard';

import styles from './styles.module.scss';

export const ShopPage: FC = () => {
  const { mutate, data: shop, isLoading } = useGetShop();

  useEffect(() => {
    mutate();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const totalItems = useMemo(
    () => shop?.data.body.length,
    [shop?.data.body.length]
  );
  return (
    <AppLayout header="Магазин">
      <div className={styles.ShopPage}>
        <div className={styles.ShopPage_header}>
          <div className={styles['ShopPage_header-text']}>
            <Text size="h2">Каталог</Text>
            <Text size="h2" className={styles.ShopPage_count}>
              {totalItems || 0}
            </Text>
          </div>
          <Icon iconName="dots" className={styles.ShopPage_dots} />
        </div>
        <div className={styles.ShopPage_grid}>
          {!isLoading
            ? shop?.data.body.map((el) => <ShopCard key={el.id} {...el} />)
            : null}
        </div>
      </div>
    </AppLayout>
  );
};
