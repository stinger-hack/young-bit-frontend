import { FC, PropsWithChildren } from 'react';
import clsx from 'clsx';

import styles from './styles.module.scss';

export type TextSize = 't1' | 't2' | 'h1' | 'h2' | 'h3';

export type TextWeight =
  | 'black'
  | 'extrabold'
  | 'bold'
  | 'semibold'
  | 'medium'
  | 'regular'
  | 'light'
  | 'extraLight'
  | 'thin';

interface TextProps extends PropsWithChildren {
  size?: TextSize;
  weight?: TextWeight;
  className?: string;
  ellipsis?: boolean;
  onClick?: (ev: React.MouseEvent) => void;
}

export const Text: FC<TextProps> = ({
  size = 't1',
  weight = 'regular',
  className,
  children,
  ellipsis,
  onClick,
}): JSX.Element => {
  return (
    // eslint-disable-next-line jsx-a11y/click-events-have-key-events, jsx-a11y/no-static-element-interactions
    <div
      className={clsx(
        styles.Text,
        className,
        `text-${size}`,
        `text-${weight}`,
        {
          'text--ellipsis': ellipsis,
        }
      )}
      onClick={onClick}
    >
      {children}
    </div>
  );
};
