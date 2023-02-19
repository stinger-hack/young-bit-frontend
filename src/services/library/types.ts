export interface LibraryType {
  category: string;
  cards: LibrarySection[];
}

export interface LibrarySection {
  progress: number;
  name: string;
  updated_at: null;
  id: number;
  category: string;
  img_link: string;
  description: string;
  created_at: Date;
  deleted_at: Date;
}
