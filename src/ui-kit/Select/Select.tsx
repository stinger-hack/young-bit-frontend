import clsx from 'clsx';
import { FC, useCallback, useState } from 'react';

import { ButtonContainer } from 'ui-kit/ButtonContainer';
import { Input } from 'ui-kit/Input';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

type Props = {
  value: string | undefined;
  onChange: (value: string) => void;
  options: string[];
  className?: string;
  placeholder?: string;
};

const SelectItem: FC<{ value: string; onClick: (value: string) => void }> = ({
  value,
  onClick,
}) => {
  return (
    <ButtonContainer
      className={styles.Select_item}
      onClick={(e) => {
        e.preventDefault();
        onClick(value);
      }}
    >
      <Text>{value}</Text>
    </ButtonContainer>
  );
};

export const Select: FC<Props> = ({
  value,
  onChange,
  options,
  className,
  placeholder,
}) => {
  const [dropdownOpened, setDropdownOpened] = useState(false);
  const onSelect = useCallback(
    (val: string) => {
      onChange(val);
      setDropdownOpened(false);
    },
    [onChange]
  );

  return (
    <div className={styles.Select}>
      <Input
        className={clsx(className, styles.Select_input)}
        value={value}
        placeholder={placeholder}
        onChange={onChange}
        onFocus={() => setDropdownOpened(true)}
      />
      {dropdownOpened ? (
        <div className={styles.Select_itemsWrapper}>
          {options.map((el) => (
            <SelectItem key={el} value={el} onClick={onSelect} />
          ))}
        </div>
      ) : null}
    </div>
  );
};
