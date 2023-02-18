import { AxiosResponse } from 'axios';

export type ResponseType<T> = AxiosResponse<Response<T>>;

type Response<T> = {
  code: number;
  message: string;
  body: T;
};
