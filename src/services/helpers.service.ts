import { useContext } from 'react';
import { useMutation } from 'react-query';
import axios from 'axios';

import { LoadingProviderContext } from 'components/LoadingProvider/LoadingProvider';
import { HttpError } from 'services/HttpError';
import { ResponseType } from 'services/types';

const axiosFile = axios.create({
  baseURL: import.meta.env.VITE_API,
  headers: {
    'content-type': 'multipart/form-data',
    timeout: 20000,
  },
});

export type ResponseImageLink = {
  img_link: string;
};

const postImage = async (
  file: any
): Promise<ResponseType<ResponseImageLink>> => {
  return axiosFile({
    url: 'api/upload-image',
    method: 'post',
    data: { file },
  });
};

export const usePostImage = () => {
  const { show, hide } = useContext(LoadingProviderContext);

  return useMutation(postImage, {
    onMutate: () => {
      show({ text: 'Выполняем обновление ...' });
    },
    onError: (e: HttpError) => {
      console.error(e);
    },
    onSettled: () => {
      hide();
    },
  });
};
