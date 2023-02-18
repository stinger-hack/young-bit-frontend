/* eslint-disable react/jsx-props-no-spreading */
import { FC, useCallback, useEffect, useMemo, useState } from 'react';

import { AppLayout } from 'components/AppLayout';
import Text from 'ui-kit/Text';
import Icon from 'ui-kit/Icon';
import { useGetNews } from 'services/news/news.service';
import { NewsCard } from 'components/NewsCard/NewsCard';
import { ButtonContainer } from 'ui-kit/ButtonContainer';
import { useGetTasks } from 'services/tasks/tasks.service';
import { InputSearch } from 'ui-kit/InputSearch';

import { TasksCard } from './components/TasksCard/TasksCard';
import { TeamTasksCard } from './components/TeamTasksCard/TeamTasksCard';
import { ImportantSection } from './components/ImportantSection/ImportantSection';

import styles from './styles.module.scss';

export const HomePage: FC = () => {
  const [selectedTask, setSelectedTask] = useState(0);
  const [importantsCount, setImportantsCount] = useState(0);
  const [searchValue, setSearchValue] = useState('');

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
  const {
    data: groupTasks,
    isLoading: isGroupTasksLoading,
    mutate: getGroupTasks,
  } = useGetTasks();

  const onNextTask = useCallback(() => {
    setSelectedTask((prev) => {
      if (tasks?.data?.body.tasks.length === prev + 1) {
        return prev;
      }
      return prev + 1;
    });
  }, [tasks?.data?.body.tasks.length]);

  const sortedNews = useMemo(
    () =>
      news?.data.body.filter((el) =>
        el.main_text.toLowerCase().includes(searchValue.toLocaleLowerCase())
      ),
    [news?.data.body, searchValue]
  );

  useEffect(() => {
    getNews('INITIATIVE');
    getTasks('INDIVIDUAL');
    getGroupTasks('DEPARTAMENT');
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
              <InputSearch value={searchValue} onChange={setSearchValue} />
            </div>
          </div>
          <div className={styles.HomePage_events}>
            {!isNewsLoading && sortedNews
              ? sortedNews.map((el) => <NewsCard key={el.id} {...el} />)
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
              {importantsCount}
            </Text>
          </Text>
          <div className={styles.HomePage_section}>
            <ImportantSection setImportantsCount={setImportantsCount} />
          </div>
          <Text className={styles.HomePage_sectionText}>
            Командные задания
            <Text
              className={styles['HomePage_sectionText-count']}
              weight="black"
            >
              {groupTasks?.data.body.tasks.length}
            </Text>
          </Text>
          <div className={styles.HomePage_section}>
            {!isGroupTasksLoading
              ? groupTasks?.data.body.tasks.map((el) => (
                  <TeamTasksCard
                    key={el.title}
                    progress={el.progress}
                    text={el.description}
                  />
                ))
              : null}
          </div>
        </div>
      </div>
    </AppLayout>
  );
};
