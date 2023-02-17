import { FC } from 'react';
import { clsx } from 'clsx';

import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

export interface LoadingIndicatorProps {
  text?: string;
  className?: string;
}

export const LoadingIndicator: FC<LoadingIndicatorProps> = ({
  text,
  className,
}) => (
  <div className={clsx(styles.Spinner, className)}>
    <div className={styles.Spinner_icon} />
    {text ? (
      <Text className={styles.Spinner_text} size="t1" weight="regular" ellipsis>
        {text}
      </Text>
    ) : null}
  </div>
);
