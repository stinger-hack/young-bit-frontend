import { useContext } from 'react';
import { useMutation, useQueryClient } from 'react-query';

import { LoadingProviderContext } from 'components/LoadingProvider/LoadingProvider';
import { HttpError } from 'services/HttpError';
import { ResponseType } from 'services/types';

import axios from '../http-common';
import { FetchTasksType, TasksType } from './types';

const queryKey = 'services/tasks.service';

const fetchTasks = async (
  type: FetchTasksType
): Promise<ResponseType<TasksType>> => {
  return axios.get(`api/tasks?task_type=${type}`);
};

export const useGetTasks = () => {
  const queryClient = useQueryClient();
  const { show, hide } = useContext(LoadingProviderContext);

  return useMutation(fetchTasks, {
    onMutate: () => {
      show({ text: 'Выполняем обновление ...' });
    },
    onSuccess: (response) => {
      const data = queryClient.getQueryData<ResponseType<TasksType>>([
        queryKey,
      ]);
      let newData = response;
      if (data) {
        newData = response;
      }
      queryClient.setQueryData([queryKey], newData);
    },
    onError: (e: HttpError) => {
      console.error(e);
    },
    onSettled: () => {
      hide();
    },
  });
};
