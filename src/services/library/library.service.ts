import { useContext } from 'react';
import { useMutation, useQueryClient } from 'react-query';

import { LoadingProviderContext } from 'components/LoadingProvider/LoadingProvider';
import { HttpError } from 'services/HttpError';
import { ResponseType } from 'services/types';

import axios from '../http-common';
import { LibraryType } from './types';

const queryKey = 'services/library.service';

const fetchLibrary = async (): Promise<ResponseType<LibraryType[]>> => {
  return axios.get(`api/library`);
};

export const useGetLibrary = () => {
  const queryClient = useQueryClient();
  const { show, hide } = useContext(LoadingProviderContext);

  return useMutation(fetchLibrary, {
    onMutate: () => {
      show({ text: 'Выполняем обновление ...' });
    },
    onSuccess: (response) => {
      const data = queryClient.getQueryData<ResponseType<LibraryType[]>>([
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
