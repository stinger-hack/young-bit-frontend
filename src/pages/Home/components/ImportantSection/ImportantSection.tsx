import { FC, useEffect, useState } from 'react';
import useWebSocket from 'react-use-websocket';

import { ImportantCard } from '../ImportantCard/ImportantCard';

import styles from './styles.module.scss';

type ImportantType = {
  id: number;
  title: string;
  main_text: string;
  created_at: string;
};

type Props = {
  setImportantsCount: (i: number) => void;
};

export const ImportantSection: FC<Props> = ({ setImportantsCount }) => {
  const [messageHistory, setMessageHistory] = useState<ImportantType[]>([]);

  const { lastMessage } = useWebSocket(
    `${import.meta.env.VITE_SOCKET}api/important/1`,
    {
      onOpen: () => console.log('WebSocket connection opened.'),
      onClose: () => console.log('WebSocket connection closed.'),
    }
  );

  useEffect(() => {
    if (lastMessage && lastMessage.data !== null) {
      setMessageHistory((prev) => {
        const newData = prev.concat(
          JSON.parse(lastMessage.data).data as ImportantType
        );
        setImportantsCount(newData.length);
        return newData;
      });
    }
  }, [lastMessage, setImportantsCount, setMessageHistory]);

  return (
    <div className={styles.ImportantSection}>
      {messageHistory.length
        ? messageHistory.map((el) => (
            <ImportantCard
              key={el.id}
              text={el.main_text}
              date={el.created_at}
            />
          ))
        : null}
    </div>
  );
};
