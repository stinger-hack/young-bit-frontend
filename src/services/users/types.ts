export type FetchTasksType = 'INDIVIDUAL' | 'DEPARTAMENT';

export interface UserType {
  username: string;
  first_name: string;
  last_name: string;
  img_link: string;
  score: number;
  patronymic: string;
  cards: string[];
}
