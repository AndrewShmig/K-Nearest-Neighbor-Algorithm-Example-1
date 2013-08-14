#K-Nearest Neighbor Algorithm (Example #1)

[K-nearest neighbor algorithm search results](https://duckduckgo.com/k-nearest_neighbor_algorithm)

<h1>Описание задачи</h1>
Необходимо определить являются ли фильмы из списка драмами, комедиями или боевиками. Классификация будет происходить по 3
параметрам: кол-во поцелуев, кол-во смешных сцен и кол-во взрывов/выстрелов.

<h1>Имеющиеся данные</h1>
Таблица уже классифицированных фильмов:
<table>
  <tr>
    <td>Наименование</td>
    <td>Кол-во поцелуев</td>
    <td>Кол-во смешных сцен</td>
    <td>Кол-во взрывов/выстрелов</td>
    <td>Жанр</td>
  </tr>
  
  <tr>
    <td align="center">Эммануель</td>
    <td align="center">73</td>
    <td align="center">0</td>
    <td align="center">0</td>
    <td align="center">Драма</td>
  </tr>
  
  <tr>
    <td align="center">Великий Гэтсби</td>
    <td align="center">35</td>
    <td align="center">7</td>
    <td align="center">2</td>
    <td align="center">Драма</td>
  </tr>
  
  <tr>
    <td align="center">Железный человек</td>
    <td align="center">5</td>
    <td align="center">7</td>
    <td align="center">98</td>
    <td align="center">Боевик</td>
  </tr>
  
  <tr>
    <td align="center">Очень страшное кино</td>
    <td align="center">16</td>
    <td align="center">69</td>
    <td align="center">1</td>
    <td align="center">Комедия</td>
  </tr>
  
  <tr>
    <td align="center">Терминатор</td>
    <td align="center">1</td>
    <td align="center">0</td>
    <td align="center">157</td>
    <td align="center">Боевик</td>
  </tr>
</table>

<img src="http://habrastorage.org/storage2/e7b/46c/b38/e7b46cb389bf94b77b5fc0b4164abd76.jpg"/>
<img src="http://habrastorage.org/storage2/a84/dd8/22b/a84dd822b5d95b54a0ec5fc48ec668fa.jpg"/>
<img src="http://habrastorage.org/storage2/24f/e76/10f/24fe7610fb97202172e0a009244c1f79.jpg"/>
<img src="http://habrastorage.org/storage2/c60/df0/fc6/c60df0fc682775e411458b9cce4a5cf9.jpg"/>

Список фильмов, жанр которых необходимо определить:
<table>
  <tr>
    <td>Наименование</td>
    <td>Кол-во поцелуев</td>
    <td>Кол-во смешных сцен</td>
    <td>Кол-во взрывов/выстрелов</td>
    <td>Жанр</td>
  </tr>
  
  <tr>
    <td align="center">Морской бой</td>
    <td align="center">0</td>
    <td align="center">4</td>
    <td align="center">74</td>
    <td align="center">?</td>
  </tr>
  
  <tr>
    <td align="center">Город грехов</td>
    <td align="center">24</td>
    <td align="center">15</td>
    <td align="center">58</td>
    <td align="center">?</td>
  </tr>
  
  <tr>
    <td align="center">Призрачный патруль</td>
    <td align="center">3</td>
    <td align="center">42</td>
    <td align="center">65</td>
    <td align="center">?</td>
  </tr>
</table>

Желтыми точками обозначены фильмы, жанр которых необходимо определеить:
<img src="http://habrastorage.org/storage2/d39/64a/ee7/d3964aee7d9d4ad4fa26fbac99b67ed7.jpg"/>
<img src="http://habrastorage.org/storage2/428/863/8b3/4288638b39c56c0cd9bb3a3427b65010.jpg"/>
<img src="http://habrastorage.org/storage2/ed2/197/247/ed2197247a6a7e91a45e3c3f85687a08.jpg"/>

<h1>Результаты работы классификатора</h1>
