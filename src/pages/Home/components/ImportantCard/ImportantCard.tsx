import { FC, memo } from 'react';

import { Button } from 'ui-kit/Button';
import { ColorBox } from 'ui-kit/ColorBox';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

type Props = {
  text: string;
  date: string;
};

const _ImportantCard: FC<Props> = ({ text, date }) => {
  return (
    <ColorBox color="#EDE6F8">
      <Text className={styles.ImportantCard_text}>{text}</Text>
      <div className={styles.ImportantCard_container}>
        <Text className={styles.ImportantCard_date}>{date}</Text>
        <Button>изучить</Button>
      </div>
    </ColorBox>
  );
};

export const ImportantCard = memo(_ImportantCard);
