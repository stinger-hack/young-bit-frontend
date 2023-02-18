import {
  FC,
  MouseEvent as ReactMouseEvent,
  KeyboardEvent as ReactKeyboardEvent,
} from 'react';
import clsx from 'clsx';
import { Link } from 'react-router-dom';

import Icon, { IconName } from 'ui-kit/Icon';
import { ButtonContainer } from 'ui-kit/ButtonContainer/ButtonContainer';
import { Colors } from 'utils';

import styles from './styles.module.scss';

export type ButtonType = 'primary' | 'default';

export interface ButtonProps {
  type?: ButtonType;
  to?: string;
  onClick?: (
    e: ReactMouseEvent<HTMLDivElement> | ReactKeyboardEvent<HTMLDivElement>
  ) => void;
  iconName?: IconName;
  isRound?: boolean;
  disabled?: boolean;
  children?: React.ReactNode;
  className?: string;
  isSubmit?: boolean;
}

const getButtonColor = (type: ButtonType): Colors => {
  switch (type) {
    case 'primary':
      return 'pink';
    default:
      return 'white';
  }
};

export const Button: FC<ButtonProps> = ({
  type = 'default',
  to,
  onClick,
  children,
  iconName,
  isRound,
  disabled,
  isSubmit = false,
  className,
}) => {
  if (to) {
    return (
      <Link to={to}>
        <ButtonContainer
          className={clsx([
            className,
            styles.Button,
            styles[`Button-${type}`],
            { [styles[`Button-round`]]: isRound },
            { [styles[`Button-disabled`]]: disabled },
          ])}
          onMouseDown={(ev) => ev.preventDefault()}
        >
          {iconName ? (
            <Icon iconName={iconName} color={getButtonColor(type)} />
          ) : null}
          {children}
        </ButtonContainer>
      </Link>
    );
  }
  return (
    <ButtonContainer
      className={clsx([
        className,
        styles.Button,
        styles[`Button-${type}`],
        { [styles[`Button-round`]]: isRound },
        { [styles[`Button-disabled`]]: disabled },
      ])}
      onClick={onClick}
      onMouseDown={(ev) => ev.preventDefault()}
      submit={isSubmit}
    >
      {iconName ? (
        <Icon iconName={iconName} color={getButtonColor(type)} />
      ) : null}
      {children}
    </ButtonContainer>
  );
};
