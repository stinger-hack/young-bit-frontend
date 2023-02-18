/* eslint-disable react/jsx-props-no-spreading */
import { FC, useCallback, useEffect, useState } from 'react';

import { AppLayout } from 'components/AppLayout';
import Text from 'ui-kit/Text';
import Icon from 'ui-kit/Icon';
import { useGetNews } from 'services/news/news.service';
import { NewsCard } from 'components/NewsCard/NewsCard';
import { ButtonContainer } from 'ui-kit/ButtonContainer';
import { useGetTasks } from 'services/tasks/tasks.service';

import { TasksCard } from './components/TasksCard/TasksCard';
import { ImportantCard } from './components/ImportantCard/ImportantCard';
import { TeamTasksCard } from './components/TeamTasksCard/TeamTasksCard';

import styles from './styles.module.scss';

export const HomePage: FC = () => {
  const [selectedTask, setSelectedTask] = useState(0);

  const {
    data: news,
    isLoading: isNewsLoading,
    mutate: getNews,
  } = useGetNews();
  const {
    data: tasks,
    isLoading: isTasksLoading,
    mutate: getTasks,
  } = useGetTasks();

  const onNextTask = useCallback(() => {
    setSelectedTask((prev) => {
      if (tasks?.data?.body.tasks.length === prev + 1) {
        return prev;
      }
      return prev + 1;
    });
  }, [tasks?.data?.body.tasks.length]);

  useEffect(() => {
    getNews('FORMAL');
    getTasks('INDIVIDUAL');
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <AppLayout header="Главная">
      <div className={styles.HomePage}>
        <div className={styles.HomePage_left}>
          {!isTasksLoading && tasks?.data.body.tasks ? (
            <>
              <div className={styles.HomePage_lessonsContainer}>
                <Text className={styles.HomePage_lessonsHeader}>
                  ЗАДАНИЯ{' '}
                  <Text
                    className={styles.HomePage_allLessons}
                  >{`${tasks?.data.body.tasks_finished}/${tasks?.data.body.tasks_count}`}</Text>
                </Text>
                <div className={styles.HomePage_awards}>
                  <Text>{`${tasks?.data.body.tasks_finished}`}</Text>
                  <Icon
                    iconName="reward"
                    className={styles.HomePage_rewardIcon}
                  />
                </div>
              </div>
              <TasksCard
                {...tasks?.data.body.tasks[selectedTask]}
                onNextClick={onNextTask}
                nextDisabled={
                  tasks?.data?.body.tasks.length === selectedTask + 1
                }
              />
            </>
          ) : null}
          <div className={styles.HomePage_formalNews}>
            <div className={styles.HomePage_formalNewsHeader}>
              <Text>СОБЫТИЯ</Text>
              <ButtonContainer className={styles.HomePage_formalNewsAdd}>
                <Icon iconName="plus" />
              </ButtonContainer>
            </div>
            <div className={styles.HomePage_searchBar}>
              <Icon iconName="reward" className={styles.HomePage_rewardIcon} />
            </div>
          </div>
          <div className={styles.HomePage_events}>
            {!isNewsLoading
              ? news?.data.body.map((el) => <NewsCard key={el.id} {...el} />)
              : null}
          </div>
        </div>
        <div className={styles.HomePage_right}>
          <Text className={styles.HomePage_sectionText}>
            ВАЖНОЕ
            <Text
              className={styles['HomePage_sectionText-count']}
              weight="black"
            >
              2
            </Text>
          </Text>
          <div className={styles.HomePage_section}>
            <ImportantCard
              text={`Изучение процессов работы компании. Задание: ознакомиться с процессом подачи заявок на гранты и условиями акселерационных программ.\nВся информация есть в Ководстве.`}
              date="сегодня в 13:25"
            />
            <ImportantCard
              text={`Изучение процессов работы компании. Задание: ознакомиться с процессом подачи заявок на гранты и условиями акселерационных программ.\nВся информация есть в Ководстве.`}
              date="сегодня в 13:25"
            />
          </div>
          <Text className={styles.HomePage_sectionText}>
            Командные задания
            <Text
              className={styles['HomePage_sectionText-count']}
              weight="black"
            >
              2
            </Text>
          </Text>
          <div className={styles.HomePage_section}>
            <TeamTasksCard
              progress={65}
              text="Подготовить материалы для обучения клиентов самостоятельному решению проблем, такие как руководства и инструкции, которые можно будет размещать на сайте компании."
            />
            <TeamTasksCard
              progress={97}
              text="Подготовить материалы для обучения клиентов самостоятельному решению проблем, такие как руководства и инструкции, которые можно будет размещать на сайте компании."
            />
          </div>
        </div>
      </div>
    </AppLayout>
  );
};
