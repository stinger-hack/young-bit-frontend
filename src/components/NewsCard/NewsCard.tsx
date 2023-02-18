import { FC, memo } from 'react';

import { NewsType } from 'services/news/types';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

const _NewsCard: FC<NewsType> = ({ title, main_text, image_url }) => {
  return (
    <div className={styles.NewsCard}>
      <img src={image_url} alt={title} className={styles.NewsCard_img} />
      <Text>{main_text}</Text>
    </div>
  );
};

export const NewsCard = memo(_NewsCard);
