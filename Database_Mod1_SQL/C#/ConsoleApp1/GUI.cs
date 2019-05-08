using System;
using System.Collections.Generic;
using System.Text;

namespace ProgettoBasiDati
{

    class GUI
    {
        private static void stampa(String stringa)
        {
            Console.WriteLine(stringa);
        }

        public static void menuIntro()
        {
            stampa("***Query progetto Basi di Dati***" +
                   "\n\tUniMol AA2018-2019" +
                   "\n\tProf. Francesco Mercaldo" +
                   "\n\tCandidato: Varrati\n\n");
        }

        QuerySQL querySql = new QuerySQL();

        public string Menu()
        {
            querySql.queryMenu();


            int selectedMenu = selectMenu();
            if ((selectedMenu != 2) && (selectedMenu != 3))
            {
                return querySql.callQuery(selectedMenu);
            }
            else if(selectedMenu == 2)
            {
                return querySql.queryFullCustom(selectedMenu);
            }
            else
            {
                stampa("Inserisci il sesso: ");
                string gender = Console.ReadLine();
                return querySql.callQuery(selectedMenu, gender);
            }
            
            //in caso di null - ritornare inserimento query custom

        }

        

        private int selectMenu()
        {

            stampa( "Scelta -> ");

            string userSelection = Console.ReadLine();
            
            int selection = Int32.Parse(userSelection);

            return selection;
        }

        

    }
}
