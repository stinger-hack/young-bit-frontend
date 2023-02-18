/* eslint-disable jsx-a11y/click-events-have-key-events */
/* eslint-disable jsx-a11y/no-static-element-interactions */
import {
  MouseEvent as ReactMouseEvent,
  KeyboardEvent as ReactKeyboardEvent,
  PropsWithChildren,
  useEffect,
  useRef,
  useState,
  HTMLAttributes,
  forwardRef,
  ForwardRefRenderFunction,
} from 'react';
import clsx from 'clsx';

import { ENTER_KEY, SPACE_KEY } from 'utils/keyCodes';

import styles from './styles.module.scss';

export interface ButtonContainerProps extends HTMLAttributes<HTMLDivElement> {
  onClick?: (
    e: ReactMouseEvent<HTMLDivElement> | ReactKeyboardEvent<HTMLDivElement>
  ) => void;
  className?: string;
  disabled?: boolean;
  withoutOutline?: boolean;
  submit?: boolean;
}

const _ButtonContainer: ForwardRefRenderFunction<
  HTMLDivElement,
  PropsWithChildren<ButtonContainerProps>
> = (
  {
    children,
    onClick,
    className,
    disabled,
    submit,
    withoutOutline = false,
    ...rest
  },
  ref
) => {
  const submitRef = useRef<HTMLInputElement | null>(null);
  const [isPressed, setIsPressed] = useState(false);

  const clickHandler = (
    e: ReactKeyboardEvent<HTMLDivElement> | ReactMouseEvent<HTMLDivElement>
  ) => {
    if (submit && submitRef.current) {
      submitRef.current.click();
    }

    if (onClick) {
      e.preventDefault();
      onClick(e);
    }
  };

  const onKeyDown = (e: ReactKeyboardEvent<HTMLDivElement>) => {
    if (e.key === SPACE_KEY || e.key === ENTER_KEY) {
      setIsPressed(true);
      clickHandler(e);
    }
  };

  const onKeyUp = () => {
    setIsPressed(false);
  };

  const onMouseDown = () => {
    setIsPressed(true);
  };

  useEffect(() => {
    const onMouseUp = () => {
      setIsPressed(false);
    };

    window.addEventListener('mouseup', onMouseUp);

    return () => {
      setIsPressed(false);
      window.removeEventListener('mouseup', onMouseUp);
    };
  }, []);

  return (
    <div
      ref={ref}
      tabIndex={disabled ? -1 : 0}
      onMouseDown={disabled ? undefined : onMouseDown}
      onClick={disabled ? undefined : clickHandler}
      onKeyDown={disabled ? undefined : onKeyDown}
      onKeyUp={onKeyUp}
      className={clsx(styles.ButtonContainer, className, {
        [styles['ButtonContainer--no-outline']]: withoutOutline,
        [styles['ButtonContainer--disabled']]: disabled,
      })}
      data-active={isPressed}
      {...rest}
    >
      {children}
      {submit ? (
        <input
          type="submit"
          className={styles.ButtonContainer_submitter}
          ref={submitRef}
        />
      ) : null}
    </div>
  );
};

export const ButtonContainer = forwardRef(_ButtonContainer);
