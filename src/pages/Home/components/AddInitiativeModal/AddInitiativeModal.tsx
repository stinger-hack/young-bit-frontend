import { FC, memo, useCallback, useRef, useState } from 'react';

import { usePostImage } from 'services/helpers.service';
import { usePostInitiative } from 'services/news/news.service';
import { Button } from 'ui-kit/Button';
import { ButtonContainer } from 'ui-kit/ButtonContainer';
import Icon from 'ui-kit/Icon';
import { Input } from 'ui-kit/Input';
import { Select } from 'ui-kit/Select/Select';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

type Props = {
  close: () => void;
};

const _AddInitiativeModal: FC<Props> = ({ close }) => {
  const { mutateAsync: postInitiative } = usePostInitiative();
  const [anonymityField, setAnonymityField] = useState<string | undefined>(
    undefined
  );
  const [publicField, setPublicField] = useState<string | undefined>(undefined);
  const [descriptionField, setDescriptionField] = useState<string | undefined>(
    undefined
  );
  const [tagField, setTagField] = useState<string | undefined>(undefined);
  const [pictureLinkField, setPictureLinkField] = useState('');
  const inputRef = useRef() as React.MutableRefObject<HTMLInputElement>;

  const onFileLoad = () => {
    if (inputRef && inputRef.current) {
      inputRef.current.value = '';
      inputRef.current.files = null;
    }
  };

  const { mutateAsync: postImage } = usePostImage();
  const onFileChangeCapture = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      postImage(e.target.files![0]).then((url) => {
        setPictureLinkField(url.data.body.img_link);
      });
    }
  };

  const onSubmit = useCallback(() => {
    const body = {
      title: publicField,
      main_text: descriptionField,
      img_link: pictureLinkField,
      tags: tagField,
      is_anonymous: anonymityField === 'Анонимно',
    };

    postInitiative(body).finally(() => {
      close();
    });
  }, [
    anonymityField,
    close,
    descriptionField,
    pictureLinkField,
    postInitiative,
    publicField,
    tagField,
  ]);

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
        }}
      >
        <div className={styles.AddInitiativeModal_row}>
          <Select
            options={['Анонимно', 'Не анонимно']}
            className={styles.AddInitiativeModal_input}
            value={anonymityField}
            onChange={setAnonymityField}
            placeholder="Анонимность"
          />
          <Select
            options={['Публично', 'Не публично']}
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
        <div>
          <input
            className={styles.AddInitiativeModal_fileInput}
            ref={inputRef}
            type="file"
            value=""
            title=""
            onChangeCapture={onFileChangeCapture}
            onClick={onFileLoad}
          />
          <ButtonContainer
            onClick={(e) => {
              e.preventDefault();
              e.stopPropagation();
              inputRef.current.click();
            }}
          >
            <Text className={styles.AddInitiativeModal_fileText}>
              Прикрепить файл
            </Text>
          </ButtonContainer>
        </div>

        <Button onClick={onSubmit} className={styles.AddInitiativeModal_submit}>
          создать
        </Button>
      </div>
    </div>
  );
};

export const AddInitiativeModal = memo(_AddInitiativeModal);
