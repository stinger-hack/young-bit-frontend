import { FC } from 'react';

import { Button } from 'ui-kit/Button';
import Icon from 'ui-kit/Icon';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

export const ShopCard: FC = () => {
  return (
    <div className={styles.ShopCard}>
      <img className={styles.ShopCard_image} src="" alt="" />
      <div className={styles.ShopCard_content}>
        <Text className={styles.ShopCard_title}>ШОППЕР</Text>
        <Text className={styles.ShopCard_text}>
          Стильный, модный, молодежный, а главное качественный шоппер.
        </Text>
        <div className={styles.ShopCard_controls}>
          <Text
            className={styles['ShopCard_controls-rewards']}
            weight="regular"
          >
            12
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
