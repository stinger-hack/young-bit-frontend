import { FC } from 'react';

import { ColorBox } from 'ui-kit/ColorBox';
import { ProgressBar } from 'ui-kit/ProgressBar';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

type Props = {
  text: string;
  progress: number;
};

export const TeamTasksCard: FC<Props> = ({ text, progress }) => {
  return (
    <ColorBox color="#F9FCD7">
      <Text className={styles.TeamTasksCard_text}>{text}</Text>
      <ProgressBar progress={progress} />
    </ColorBox>
  );
};
