import { FC, PropsWithChildren } from 'react';

import styles from './styles.module.scss';

export const AppLayout: FC<PropsWithChildren> = ({ children }) => {
  return (
    <div className={styles.AppLayout}>
      <div className={styles.AppLayout_wrapper}>{children}</div>
    </div>
  );
};
