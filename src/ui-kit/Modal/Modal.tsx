/* eslint-disable jsx-a11y/click-events-have-key-events */
/* eslint-disable jsx-a11y/no-static-element-interactions */
import clsx from 'clsx';
import { FC, PropsWithChildren, useEffect, useMemo, useState } from 'react';
import { createPortal } from 'react-dom';

import styles from './styles.module.scss';

type Props = {
  isVisible: boolean;
  onOverlayClick?: () => void;
};

export const Modal: FC<PropsWithChildren<Props>> = ({
  isVisible,
  onOverlayClick,
  children,
}) => {
  const portal = document.getElementById('modal') as HTMLElement;
  const root = document.getElementById('root');
  const { body } = document;

  const [isOpening, setIsOpening] = useState(isVisible);

  const isOpen = useMemo(() => !!portal && isVisible, [portal, isVisible]);

  useEffect(() => {
    setIsOpening(isVisible);
  }, [isVisible]);

  useEffect(() => {
    if (isOpen) {
      root?.classList.add('blur');
      body.classList.add('overflow-hidden');
    } else {
      root?.classList.remove('blur');
      body.classList.remove('overflow-hidden');
    }
  }, [isOpen, root, body]);

  if (!isOpen) {
    return null;
  }

  return createPortal(
    <div onClick={onOverlayClick} className={styles.Modal}>
      <div
        className={clsx(styles.Modal_content, {
          [styles['Modal_content-active']]: isOpening,
        })}
        onClick={(ev) => {
          ev.stopPropagation();
        }}
      >
        {children}
      </div>
    </div>,
    portal
  );
};
