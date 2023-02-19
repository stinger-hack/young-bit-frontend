import { useContext } from 'react';
import { useMutation, useQueryClient } from 'react-query';

import { LoadingProviderContext } from 'components/LoadingProvider/LoadingProvider';
import { HttpError } from 'services/HttpError';
import { ResponseType } from 'services/types';

import axios from '../http-common';
import { FetchNewsType, NewsType } from './types';

const queryKey = 'services/lessons.service/lessons';

const fetchNews = async (
  type: FetchNewsType = 'FORMAL'
): Promise<ResponseType<NewsType[]>> => {
  return axios.get(`api/news?news_type=${type}`);
};

export const useGetNews = () => {
  const queryClient = useQueryClient();
  const { show, hide } = useContext(LoadingProviderContext);

  return useMutation(fetchNews, {
    onMutate: () => {
      show({ text: 'Выполняем обновление ...' });
    },
    onSuccess: (response) => {
      const data = queryClient.getQueryData<ResponseType<NewsType[]>>([
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

const postInitiative = async (body: any): Promise<ResponseType<NewsType>> => {
  return axios.post('api/initiative', body);
};

export const usePostInitiative = () => {
  const queryClient = useQueryClient();
  const { show, hide } = useContext(LoadingProviderContext);

  return useMutation(postInitiative, {
    onMutate: () => {
      show({ text: 'Выполняем обновление ...' });
    },
    onSuccess: (response) => {
      const data = queryClient.getQueryData<ResponseType<NewsType[]>>([
        queryKey,
      ]);

      if (data) {
        const newData = data.data.body.concat(response.data.body);
        queryClient.setQueryData([queryKey], newData);
      }
    },
    onError: (e: HttpError) => {
      console.error(e);
    },
    onSettled: () => {
      hide();
    },
  });
};
