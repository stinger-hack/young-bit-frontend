import clsx from 'clsx';
import { FC } from 'react';

import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

type Props = {
  progress: number;
  className?: string;
};

export const ProgressBar: FC<Props> = ({ progress, className }) => (
  <div className={clsx(styles.ProgressBar, className)}>
    <Text className={styles.ProgressBar_text}>{`${progress}%`}</Text>
    <progress max={100} value={progress} className={styles.ProgressBar_line} />
  </div>
);
