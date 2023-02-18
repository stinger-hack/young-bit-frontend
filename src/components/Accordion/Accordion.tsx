/* eslint-disable react/jsx-props-no-spreading */
import { FC } from 'react';
import { Link, useLocation } from 'react-router-dom';

import Icon from 'ui-kit/Icon';
import { paths } from 'utils';

import { AccordionItem, AccordionItemProps } from './components';

import styles from './styles.module.scss';

export const accordionItems: Omit<AccordionItemProps, 'isActive'>[] = [
  {
    logoName: 'home',
    href: paths.home,
  },
  {
    logoName: 'news',
    href: paths.library,
  },
  {
    logoName: 'analytic',
    href: paths.statistics,
  },
  {
    logoName: 'shop',
    href: paths.shop,
  },
];

export const Accordion: FC = () => {
  const { pathname } = useLocation();

  return (
    <nav className={styles.Accordion_nav}>
      <ul className={styles.Accordion_ul}>
        <div className={styles.Accordion_logo}>
          <Icon iconName="logo" className={styles['Accordion_logo-icon']} />
        </div>
        {accordionItems.map((el) => (
          <AccordionItem
            key={el.logoName}
            isActive={el.href === pathname}
            {...el}
          />
        ))}
      </ul>
      <Link
        className={styles.Accordion_info}
        to="https://t.me/rossy_help_bot"
        target="_blank"
        rel="noopener"
      >
        <Icon iconName="question_mark" />
      </Link>
    </nav>
  );
};
