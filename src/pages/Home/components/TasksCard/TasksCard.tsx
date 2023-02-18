import { FC } from 'react';

import { TaskType } from 'services/tasks/types';
import { BoxContainer } from 'ui-kit/BoxContainer';
import { Button } from 'ui-kit/Button';
import Text from 'ui-kit/Text';

import styles from './styles.module.scss';

type Props = {
  nextDisabled: boolean;
  onNextClick: () => void;
} & TaskType;

export const TasksCard: FC<Props> = ({
  nextDisabled,
  onNextClick,
  title,
  description,
}) => {
  return (
    <BoxContainer row>
      <div className={styles.TasksCard_image}>
        <img src="" alt={title} />
      </div>
      <div className={styles.TasksCard_content}>
        <Text className={styles.TasksCard_text}>{description}</Text>
        <div className={styles.TasksCard_buttons}>
          <Button type="primary">изучить</Button>
          {!nextDisabled ? (
            <Button onClick={onNextClick}>дальше →</Button>
          ) : null}
        </div>
      </div>
    </BoxContainer>
  );
};
