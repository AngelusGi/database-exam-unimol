using System;

namespace ProgettoBasiDati
{
    internal class Gui
    {
        private readonly QuerySql _querySql = new QuerySql();


        private static void Print(string stringa)
        {
            Console.WriteLine(stringa);
        }

        public static void MenuIntro()
        {
            Print("***Query progetto Basi di Dati***" +
                  "\n\tUniMol AA2018-2019" +
                  "\n\tProf. Francesco Mercaldo" +
                  "\n\tCandidato: Varrati\n\n");
        }


        public string Menu()
        {
            _querySql.QueryMenu();

            var selectedMenu = SelectMenu();

            switch (selectedMenu)
            {
                case (int) QueryType.ViewSiGePr:
                    return _querySql.QueryFullCustom();

                case (int) QueryType.ViewGender:
                    Print("Inserisci il sesso: ");
                    var gender = Console.ReadLine();
                    return _querySql.CallQuery(gender);

                //in caso di null - ritornare inserimento query custom
                default:
                    return _querySql.CallQuery(selectedMenu);
            }
        }


        private int SelectMenu()
        {
            Print("Scelta -> ");

            var userSelection = Console.ReadLine();

            var selection = int.Parse(userSelection);

            return selection;
        }
    }
}