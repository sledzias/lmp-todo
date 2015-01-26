# Zadanie dodatkowe dla kandydatów na stanowisko Junior RoR Dev
Projekt jest prostą aplikacją todo. Należy zaimplementować następujące funkcje:

## Zadania:
- wygenerować scaffold dla modelu `Task` (z polami `done` i `description`). Pole `description` nie może być puste;
- `User` ma mieć dostęp tylko do zadań, które sam stworzył (Pundit);
- po wpisaniu adresu `/tasks` ma pojawić się widok pokazujący wszystkie zadania (szablon dla tego widoku jest obecnie dostępny w _visitors/index.html.erb_)
- oznaczenie zadania jako wykonane powinno odbywać się przez wciśnięcie przycisku z symbolem _check_ („ptaszek”). Odznaczenie w ten sam sposób. To, czy zadanie jest wykonane powinno być zaznaczone kolorem ptaszka (zielone - wykonane, szare - do wykonania);
- wciśnięcie krzyżyka usuwa zadanie;
- użytkownik może edytować każde zadanie, po opuszczeniu formularza (zdarzenie `blur()`) zadanie powinno być zapisane
- wciśnięcie plusa dodaje zadanie wpisane w inpucie obok;
- wciśnięcie przycisku _Mark all as complete_ powinno zaznaczyć wszystkie zadania jako wykonane;
- kliknięcie linków _all_, _active_, _completed_ powinno filtrować  listę zadań (obok linków powinna być wyświetlona liczba zadań odpowiadających filtrowi);
- przycisk _Clear completed_ usuwa wszystkie wykonane zadania;
- stopka zawsze powinna być na dole strony, niezależnie od liczby zadań (tzw. „sticky footer”)

## Zasady:
- każde zadanie powinno być w oddzielnym commicie;
- całość powinna zająć ok 3h;
- bardziej docenimy czytelny kod, niż wykonanie wszystkich zadań;
- rozwiązania proszę zgłaszać jako pull-request do tego repozytorium
- na rozwiązania czekamy do niedzieli (1 lutego)
