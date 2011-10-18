# language: ru
Функционал: Управление письмами (сообщениями)
  Для приема и регистрации писем
  Я хочу создавать и редактировать письма
  Я хочу производить поиск по письмам
  Я хочу передавать письма в работу
  Я хочу сортировать письма по исполненным и неисполненным

    Сценарий: Просмотр писем
      Допустим я на странице журнал писем
      Допустим Есть 11 писем
      И писем на странице 10
      И пагинатор

    Сценарий: Регистрация писем
      Когда я секретарь
      Когда я иду к списку сообщений
      Тогда должен увидеть список сообщений
      И сообщений на странице должно быть 10
      Если сообщений больше 10
      То должен увидеть список страниц
      И должен иметь возможность создать письмо


    Сценарий: Исполнение письма
      Когда я являюсь исполнителем письма
      Тогда мне отображается это письмо в списке прочих
      И я могу производить работу над этим письмом

    Сценарий: Отображение писем исполнителям
      Допустим есть 20 писем, 10 из которых отписаны мне в работу
      Когда я явлюсь исполнителем письма
      Тогда мне отображаются только те письма которые отписаны мне в работу
      И не отображаются письма не отписанные мне в работу

    Сценарий: Оторбажение писем руководителю
      Допустим я на странице 'messages'
      Допустим есть 20 писем
      Допустим 10 писем исполнены
      Допустим 10 писем не исполнены
      Допустим 5 писем просрочены
      Тогда отображать неисполненные письма
      И помечать просроченные письма
      И размещать просроченные письма в верху списка

    Сценарий: Статистика руководителю
      Дано есть 20 писем
      Дано 10 писем исполнены
      Дано 10 писем не исполнены
      Дано 5 писем просрочены
      Дано 5 исполнителей
      Дано у 3 исполнителей 5 просроченных писем
      Тогда Статистика должна отражать общее количество писем
      И Статистика должна отражать неисполненные письма
      И Статистика должна отражать исполнителей и количество неисполненных писем
      И Я должен увидеть "Фигу"

