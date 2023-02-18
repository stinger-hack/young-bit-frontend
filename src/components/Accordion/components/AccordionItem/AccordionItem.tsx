import clsx from 'clsx';
import { FC, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';

import { ButtonContainer } from 'ui-kit/ButtonContainer';
import Icon, { IconName } from 'ui-kit/Icon';

import styles from './styles.module.scss';

export interface AccordionItemProps {
  logoName: IconName;
  href: string;
  isActive: boolean;
}

export const AccordionItem: FC<AccordionItemProps> = ({
  logoName,
  href,
  isActive,
}) => {
  const navigate = useNavigate();

  const onClick = useCallback(() => {
    navigate(href);
  }, [href, navigate]);

  return (
    <li className={styles.AccordionItem}>
      <ButtonContainer
        onClick={onClick}
        className={styles.AccordionItem_button}
      >
        {isActive ? (
          <Icon
            iconName="intersect"
            className={styles.AccordionItem_intersect}
          />
        ) : null}
        <div
          className={clsx(styles.AccordionItem_buttonWrapper, {
            [styles['AccordionItem_buttonWrapper-active']]: isActive,
          })}
        >
          <Icon
            iconName={logoName}
            iconSize="big"
            className={clsx(styles.AccordionItem_icon, {
              [styles['AccordionItem_icon-active']]: isActive,
            })}
          />
        </div>
      </ButtonContainer>
    </li>
  );
};
