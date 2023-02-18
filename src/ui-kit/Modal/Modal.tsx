import clsx from 'clsx';
import { FC, PropsWithChildren, useEffect, useMemo, useState } from 'react';
import { createPortal } from 'react-dom';

import { ButtonContainer } from 'ui-kit/ButtonContainer';

import styles from './styles.module.scss';

// const Content = styled.div<{ maxWidth: string }>`
//   position: relative;
//   background-color: white;
//   border-radius: 16px;
//   margin: 0 auto;
//   display: flex;
//   flex-direction: column;
//   opacity: 0;
//   transform: scale(0);
//   transition: opacity, transform, 300ms ease;

//   &.open {
//     opacity: 1;
//     transform: scale(1);
//   }
// `;

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
    <ButtonContainer onClick={onOverlayClick} className={styles.Modal}>
      <ButtonContainer
        className={clsx(styles.Modal_content, {
          [styles['Modal_content-active']]: isOpening,
        })}
        onClick={(ev) => {
          ev.stopPropagation();
        }}
      >
        {children}
      </ButtonContainer>
    </ButtonContainer>,
    portal
  );
};
