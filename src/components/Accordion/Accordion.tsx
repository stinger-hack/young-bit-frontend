/* eslint-disable react/jsx-props-no-spreading */
import { FC } from 'react';
import { useLocation } from 'react-router-dom';

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
    href: paths.news,
  },
  {
    logoName: 'analytic',
    href: paths.analytic,
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
    </nav>
  );
};
