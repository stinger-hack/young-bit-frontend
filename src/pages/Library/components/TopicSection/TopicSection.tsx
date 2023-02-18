/* eslint-disable react/jsx-props-no-spreading */
/* eslint-disable react/no-array-index-key */
import { FC, memo } from 'react';

import { LibrarySection } from 'services/library/types';
import Text from 'ui-kit/Text';

import { СourseCard } from '../СourseCard';

import styles from './styles.module.scss';

type Props = {
  title: string;
  cards: LibrarySection[];
};

const _TopicSection: FC<Props> = ({ title, cards }) => {
  return (
    <div className={styles.TopicSection}>
      <Text className={styles.TopicSection_title}>{title}</Text>
      <div className={styles.TopicSection_content}>
        {cards.map((el, i) => (
          <СourseCard key={i} {...el} />
        ))}
      </div>
    </div>
  );
};

export const TopicSection = memo(_TopicSection);
