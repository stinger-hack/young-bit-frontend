export type FetchTasksType = 'INDIVIDUAL' | 'DEPARTAMENT';

export interface TaskType {
  title: string;
  description: string;
  spent_time: number;
  cost: number;
  created_at: string;
  updated_at: string;
}

export interface TasksType {
  tasks_count: number;
  tasks_finished: number;
  tasks: TaskType[];
}
