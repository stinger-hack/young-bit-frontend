export type FetchNewsType = 'FORMAL' | 'INFORMAL' | 'INITIATIVE';

export type RoleType = 'EMPLOYEE' | 'HR' | 'ADMIN';

export interface NewsType {
  id: number;
  title: string;
  news_type: FetchNewsType;
  created_at: string;
  updated_at: string;
  main_text: string;
  image_url: string;
  user: {
    first_name: string;
    last_name: string;
    patronymic: string;
    username: string;
    role: RoleType;
    img_link: string;
  };
}
