import {
  createContext,
  FC,
  PropsWithChildren,
  useCallback,
  useMemo,
  useRef,
  useState,
} from 'react';

import LoadingIndicator, {
  LoadingIndicatorProps,
} from 'ui-kit/LoadingIndicator';

import styles from './styles.module.scss';

export interface ContextValue {
  show: (props: LoadingIndicatorProps, delay?: number) => void;
  hide: () => void;
}

export const LoadingProviderContext = createContext<ContextValue>({
  show: () => {},
  hide: () => {},
});

export const LoadingProvider: FC<PropsWithChildren> = ({ children }) => {
  const timerId = useRef<ReturnType<typeof setTimeout>>();
  const [isOpen, setIsOpen] = useState(false);
  const [{ text }, setIndicatorProps] = useState<LoadingIndicatorProps>({});

  const show = useCallback((props: LoadingIndicatorProps, delay = 0) => {
    setIndicatorProps(props);
    timerId.current = setTimeout(() => {
      setIsOpen(true);
    }, delay);
  }, []);

  const hide = useCallback(() => {
    clearTimeout(timerId.current);
    setIsOpen(false);
  }, []);

  const values: ContextValue = useMemo(
    () => ({
      show,
      hide,
    }),
    [show, hide]
  );
  return (
    <LoadingProviderContext.Provider value={values}>
      {children}
      {isOpen ? (
        <div className={styles.LoadingProvider}>
          <LoadingIndicator text={text} className="text-primary" />
        </div>
      ) : null}
    </LoadingProviderContext.Provider>
  );
};
