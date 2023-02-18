export type FetchTasksType = 'INDIVIDUAL' | 'DEPARTAMENT';

export interface TaskType {
  title: string;
  description: string;
  spent_time: number;
  cost: number;
  img_link: string;
  progress: number;
  created_at: string;
  updated_at: string;
}

export interface TasksType {
  tasks_count: number;
  tasks_finished: number;
  tasks: TaskType[];
}
