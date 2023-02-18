import { FC } from 'react';

import { ShopType } from 'services/shop/types';
import { Button } from 'ui-kit/Button';
import Icon from 'ui-kit/Icon';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

export const ShopCard: FC<ShopType> = ({
  title,
  description,
  img_link,
  cost,
}) => {
  return (
    <div className={styles.ShopCard}>
      <img className={styles.ShopCard_image} src={img_link} alt={title} />
      <div className={styles.ShopCard_content}>
        <Text className={styles.ShopCard_title}>{title}</Text>
        <Text className={styles.ShopCard_text}>{description}</Text>
        <div className={styles.ShopCard_controls}>
          <Text
            className={styles['ShopCard_controls-rewards']}
            weight="regular"
          >
            {cost}
            <Icon
              iconName="reward"
              className={styles['ShopCard_controls-rewards--icon']}
            />
          </Text>
          <Button type="primary">купить</Button>
        </div>
      </div>
    </div>
  );
};
