import { ChangeEvent, FC, memo } from 'react';
import clsx from 'clsx';

import styles from './styles.module.scss';

export type InputType = 'text' | 'default' | 'search';

export interface InputProps {
  value: string | undefined;
  width?: 's' | 'm' | 'xl';
  type?: InputType;
  rows?: number;
  onChange: (value: string) => void;
  onFocus?: () => void;
  onBlur?: () => void;
  autoWidth?: boolean;
  placeholder?: string;
  textSize?: 'small' | 'default';
  className?: string;
  disabled?: boolean;
}

export const _Input: FC<InputProps> = ({
  value,
  type,
  rows,
  onChange,
  onFocus,
  onBlur,
  disabled = false,
  autoWidth,
  placeholder,
  textSize = 'default',
  width = 's',
  className,
}) => {
  const onInputChange = (
    ev: ChangeEvent<HTMLTextAreaElement | HTMLInputElement>
  ) => {
    onChange(ev.target.value);
  };
  if (rows) {
    return (
      <textarea
        className={clsx([
          className,
          styles.Input,
          styles[`Input-${textSize}`],
          styles[`Input-${width}`],
          { [styles[`Input-autoWidth`]]: autoWidth },
          { [styles[`Input-textarea`]]: !!rows },
        ])}
        rows={rows}
        value={value}
        onChange={onInputChange}
        placeholder={placeholder}
      />
    );
  }
  return (
    <input
      value={value}
      className={clsx([
        className,
        styles.Input,
        styles[`Input-${textSize}`],
        styles[`Input-${width}`],
        { [styles[`Input-autoWidth`]]: autoWidth },
      ])}
      onChange={onInputChange}
      placeholder={placeholder}
      onFocus={onFocus}
      onBlur={onBlur}
      disabled={disabled}
      type={type}
    />
  );
};

export const Input = memo(_Input);
