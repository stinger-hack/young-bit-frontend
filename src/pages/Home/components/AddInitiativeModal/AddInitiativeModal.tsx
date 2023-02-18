import { FC, memo, useState } from 'react';

import { Button } from 'ui-kit/Button';
import { ButtonContainer } from 'ui-kit/ButtonContainer';
import Icon from 'ui-kit/Icon';
import { Input } from 'ui-kit/Input';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

type Props = {
  close: () => void;
};

const _AddInitiativeModal: FC<Props> = ({ close }) => {
  const [anonymityField, setAnonymityField] = useState('');
  const [publicField, setPublicField] = useState('');
  const [descriptionField, setDescriptionField] = useState('');
  const [tagField, setTagField] = useState('');

  // const onSubmit = useCallback(() => {
  //   const body = {
  //     anonymityField,
  //     publicField,
  //     descriptionField,
  //     tagField,
  //   };
  // }, []);

  return (
    <div className={styles.AddInitiativeModal}>
      <div className={styles.AddInitiativeModal_header}>
        <Text size="h3">СОЗДАНИЕ ИНИЦИАТИВЫ</Text>
        <ButtonContainer onClick={close}>
          <Icon
            iconName="close"
            className={styles['AddInitiativeModal_header-closeIcon']}
          />
        </ButtonContainer>
      </div>
      <form
        className={styles.AddInitiativeModal_form}
        onSubmit={(e) => {
          e.stopPropagation();
          e.preventDefault();
          console.log(e.target);
        }}
      >
        <div className={styles.AddInitiativeModal_row}>
          <Input
            className={styles.AddInitiativeModal_input}
            value={anonymityField}
            onChange={setAnonymityField}
            placeholder="Анонимность"
          />
          <Input
            className={styles.AddInitiativeModal_input}
            value={publicField}
            onChange={setPublicField}
            placeholder="Публичность"
          />
        </div>
        <Input
          className={styles.AddInitiativeModal_input}
          value={descriptionField}
          onChange={setDescriptionField}
          rows={5}
          placeholder="Введите описание инициативы"
        />
        <Input
          className={styles.AddInitiativeModal_input}
          value={tagField}
          onChange={setTagField}
          placeholder="Введите тег"
        />
      </form>
      <div className={styles.AddInitiativeModal_controls}>
        <Button isSubmit>создать</Button>
      </div>
    </div>
  );
};

export const AddInitiativeModal = memo(_AddInitiativeModal);
