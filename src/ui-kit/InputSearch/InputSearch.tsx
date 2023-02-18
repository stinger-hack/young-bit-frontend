import { FC } from 'react';
import clsx from 'clsx';

import { Input } from 'ui-kit/Input';
import { ButtonContainer } from 'ui-kit/ButtonContainer';
import Icon from 'ui-kit/Icon';

import styles from './styles.module.scss';

interface Props {
  value: string | undefined;
  onChange: (value: string) => void;
  className?: string;
}

export const InputSearch: FC<Props> = ({ value, onChange, className }) => {
  return (
    <div className={clsx([styles.InputSearch, className])}>
      <Input
        value={value}
        width="s"
        placeholder="Найти..."
        type="text"
        onChange={onChange}
        textSize="small"
        className={clsx(styles[`InputSearch-input`])}
      />
      <ButtonContainer className={clsx(styles[`InputSearch-btn`])}>
        <Icon iconName="search" />
      </ButtonContainer>
    </div>
  );
};
