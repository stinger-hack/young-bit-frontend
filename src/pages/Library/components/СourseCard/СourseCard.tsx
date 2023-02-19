import { FC, memo } from 'react';

import { LibrarySection } from 'services/library/types';
import { Button } from 'ui-kit/Button';
import { ProgressBar } from 'ui-kit/ProgressBar';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

const _СourseCard: FC<LibrarySection> = ({
  name,
  progress,
  description,
  img_link,
}) => {
  return (
    <div className={styles.СourseCard}>
      <img className={styles.СourseCard_image} src={img_link} alt={name} />
      <div className={styles.СourseCard_content}>
        <Text className={styles.СourseCard_title}>{name}</Text>
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
