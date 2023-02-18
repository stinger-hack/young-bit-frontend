/* eslint-disable react/no-children-prop */
import { FC, PropsWithChildren } from 'react';

import { Accordion } from 'components/Accordion';
import { AppBar } from 'components/AppBar';

import styles from './styles.module.scss';

interface Props extends PropsWithChildren {
  header: string;
  additionallyChildrens?: React.ReactNode;
}

export const AppLayout: FC<Props> = ({
  header,
  children,
  additionallyChildrens,
}) => {
  return (
    <div className={styles.AppLayout}>
      <Accordion />
      <main className={styles.AppLayout_main}>
        <AppBar header={header} children={additionallyChildrens} />
        <div className={styles.AppLayout_wrapper}>{children}</div>
      </main>
    </div>
  );
};
