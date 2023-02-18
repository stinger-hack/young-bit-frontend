import clsx from 'clsx';
import { FC, PropsWithChildren, useState } from 'react';

import { ButtonContainer } from 'ui-kit/ButtonContainer';
import Icon from 'ui-kit/Icon';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

interface Props extends PropsWithChildren {
  header: string;
}

export const AppBar: FC<Props> = ({ header, children }) => {
  const [hasNotify] = useState(true);
  return (
    <div className={styles.AppBar}>
      <div className={styles.AppBar_header}>
        {header ? <Text>{header}</Text> : null}
      </div>
      <div
        className={clsx(styles.AppBar_content, {
          [styles['AppBar_content-withNotify']]: hasNotify,
        })}
      >
        {children || null}
        <ButtonContainer className={styles.AppBar_notifications}>
          <Icon iconName="notifications" />
        </ButtonContainer>
        <div className={styles.AppBar_avatar}>
          <img
            src="https://sun1.userapi.com/sun1-29/s/v1/ig2/3oKFXQFaZEgHPRjBApWFRPgg2hdfCzu_o5RYLvnr_xEp4UlFAHrLmqMpc8WcScD6jE7S0PrbocPW4Pkj6kpL4VMG.jpg?size=50x50&quality=95&crop=670,577,427,427&ava=1"
            alt=""
          />
        </div>
      </div>
    </div>
  );
};
