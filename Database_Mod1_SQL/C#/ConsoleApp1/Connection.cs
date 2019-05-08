using System;
using System.Collections.Generic;
using System.Security.Policy;
using System.Text;

namespace ProgettoBasiDati
{
    class Connection
    {
        private static void stampa(string stringa)
        {
            Console.WriteLine(stringa);
        }

        private static string localUserName = "USER_LOCALHOST";
        private static string localPassword = "PASSWORD_LOCALHOST";

        // AZURE CREDENTIALS
        private static string userName = "USER_AZURE";
        private static string password = "PASSWORD_AZURE";
        private static string serverName = "SERVER_AZURE";
        private static string url = serverName + ".mysql.database.azure.com";
        private static string dbName = "acme_societa";
        private static string portNumber = "3306";


        private static string connectionStringLocal = "server=localhost;user=" + localUserName + ";database=" +
                                               dbName + ";port=" + portNumber + ";password=" + localPassword + "";

        private static string connectionStringAzure = "server=" + url + ";user=" + userName + "@" + serverName +
                                  ";database=" + dbName + ";port=" + portNumber + ";password=" + password + "";


        public static string ConnectionMenu()
        {
            promptMenu();

            int selectedMenu = selectMenu();

            return dbConnect(selectedMenu);

        }

        private static string dbConnect(int selezione)
        {
            string connectionString;
            switch (selezione)
            {
                case 1:
                    connectionString = connectionStringLocal;
                    break;
                case 2:
                    connectionString = connectionStringAzure;
                    break;
                default:
                    connectionString = null;
                    break;
            }

            return connectionString;
        }

        private static int selectMenu()
        {
            stampa("Scelta -> ");

            string userSelection = Console.ReadLine();

            int selection = Int32.Parse(userSelection);

            return selection;
        }
  

        private static void promptMenu()
        {
            stampa("Quale database vuoi utilizzare: " +
                   "\n1. local host con MySQL" +
                   "\n2. Microsoft Azure con MySQL" +
                   "\n\t 0. USCIRE");
        }

    }
}
