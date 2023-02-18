import { FC, memo } from 'react';

import { LibraryType } from 'services/library/types';
import { Button } from 'ui-kit/Button';
import { ProgressBar } from 'ui-kit/ProgressBar';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

const _СourseCard: FC<LibraryType> = ({
  title,
  description,
  progress,
  image_url,
}) => {
  return (
    <div className={styles.СourseCard}>
      <img className={styles.СourseCard_image} src={image_url} alt={title} />
      <div className={styles.СourseCard_content}>
        <Text className={styles.СourseCard_title}>{title}</Text>
        <Text className={styles.СourseCard_description}>{description}</Text>
        <div className={styles.СourseCard_controls}>
          <ProgressBar progress={progress} />
          <Button type="primary">продолжить</Button>
        </div>
      </div>
    </div>
  );
};

export const СourseCard = memo(_СourseCard);
