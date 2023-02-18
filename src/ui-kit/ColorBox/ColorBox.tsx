import { FC, PropsWithChildren } from 'react';
import clsx from 'clsx';

import styles from './styles.module.scss';

interface Props extends PropsWithChildren {
  row?: boolean;
  color: string;
}

export const ColorBox: FC<Props> = ({ row, color, children }) => {
  return (
    <div
      className={clsx(styles.ColorBox, {
        [styles['ColorBox-row']]: row,
      })}
      style={{ backgroundColor: `${color}` }}
    >
      {children}
    </div>
  );
};
