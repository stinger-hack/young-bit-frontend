import { useContext } from 'react';
import { useMutation, useQueryClient } from 'react-query';

import { LoadingProviderContext } from 'components/LoadingProvider/LoadingProvider';
import { HttpError } from 'services/HttpError';
import { ResponseType } from 'services/types';

import axios from '../http-common';
import { ShopType } from './types';

const queryKey = 'services/shop.service';

const fetchShop = async (): Promise<ResponseType<ShopType[]>> => {
  return axios.get('api/shop');
};

export const useGetShop = () => {
  const queryClient = useQueryClient();
  const { show, hide } = useContext(LoadingProviderContext);

  return useMutation(fetchShop, {
    onMutate: () => {
      show({ text: 'Выполняем обновление ...' });
    },
    onSuccess: (response) => {
      const data = queryClient.getQueryData<ResponseType<ShopType[]>>([
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
