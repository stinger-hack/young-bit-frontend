import { FC } from "react";
import clsx from "clsx";
import { Colors } from "utils";
import * as icons from "./assets";

import styles from "./styles.module.scss";

export type IconName = keyof typeof icons;

export type IconSizes = "small" | "medium" | "big";

export interface IconProps {
  iconName: IconName;
  color?: Colors;
  iconSize?: IconSizes;
  className?: string;
  stroke?: IconSizes;
}

const getIconSize = (size: IconSizes) => {
  switch (size) {
    case "small":
      return 16;
    case "medium":
      return 24;
    case "big":
      return 32;
    default:
      return 24;
  }
};

export const Icon: FC<IconProps> = ({
  iconName,
  color = "black-1",
  stroke = "medium",
  className,
  iconSize = "medium",
}): JSX.Element | null => {
  const Glyph = icons[iconName];
  const size = getIconSize(iconSize);
  const strokeClass =
    stroke === "small" ? styles["Icon-thin"] : styles["Icon-fat"];

  if (!Glyph) {
    // такой иконки не существует
    return null;
  }

  return (
    <Glyph
      className={clsx([className, strokeClass, styles.Icon])}
      color={color}
      width={size}
      height={size}
    />
  );
};
