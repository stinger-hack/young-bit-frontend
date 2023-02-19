/* eslint-disable react/jsx-props-no-spreading */
import { FC, useEffect, useMemo, useState } from 'react';

import { AppLayout } from 'components/AppLayout';
import Text from 'ui-kit/Text';
import Icon from 'ui-kit/Icon';
import { useGetShop } from 'services/shop/shop.service';
import { InputSearch } from 'ui-kit/InputSearch';

import { ShopCard } from './components/ShopCard/ShopCard';

import styles from './styles.module.scss';

export const ShopPage: FC = () => {
  const { mutate, data: shop, isLoading, isSuccess } = useGetShop();
  const [searchValue, setSearchValue] = useState('');

  useEffect(() => {
    if (!isSuccess) {
      mutate();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const totalItems = useMemo(
    () => shop?.data.body.length,
    [shop?.data.body.length]
  );

  const sortedItems = useMemo(
    () =>
      shop?.data.body.filter((el) =>
        el.title.toLocaleLowerCase().includes(searchValue.toLocaleLowerCase())
      ),
    [searchValue, shop?.data.body]
  );

  return (
    <AppLayout
      header="Магазин"
      additionallyChildrens={
        <InputSearch
          onChange={setSearchValue}
          value={searchValue}
          className={styles.ShopPage_search}
        />
      }
    >
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
            ? sortedItems?.map((el) => <ShopCard key={el.id} {...el} />)
            : null}
        </div>
      </div>
    </AppLayout>
  );
};
