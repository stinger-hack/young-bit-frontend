import { FC, PropsWithChildren } from 'react';
import clsx from 'clsx';

import styles from './styles.module.scss';

interface Props extends PropsWithChildren {
  row?: boolean;
}

export const BoxContainer: FC<Props> = ({ row, children }) => {
  return (
    <div
      className={clsx(styles.BoxContainer, {
        [styles['BoxContainer-row']]: row,
      })}
    >
      {children}
    </div>
  );
};
