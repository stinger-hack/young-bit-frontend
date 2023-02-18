import { useContext } from 'react';
import { useMutation, useQueryClient } from 'react-query';

import { LoadingProviderContext } from 'components/LoadingProvider/LoadingProvider';
import { HttpError } from 'services/HttpError';
import { ResponseType } from 'services/types';

import axios from '../http-common';
import { UserType } from './types';

const queryKey = 'services/tasks.service';

const fetchUsers = async (id: number): Promise<ResponseType<UserType[]>> => {
  return axios.get(`api/users/${id}`);
};

export const useGetUsers = () => {
  const queryClient = useQueryClient();
  const { show, hide } = useContext(LoadingProviderContext);

  return useMutation(fetchUsers, {
    onMutate: () => {
      show({ text: 'Выполняем обновление ...' });
    },
    onSuccess: (response) => {
      const data = queryClient.getQueryData<ResponseType<UserType[]>>([
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
