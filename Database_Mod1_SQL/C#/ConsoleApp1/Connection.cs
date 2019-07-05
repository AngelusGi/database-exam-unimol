using System;

namespace ProgettoBasiDati
{
    internal enum ConnectionType
    {
        Exit = 0,
        LocalHost = 1,
        Azure = 2
    }

    internal class Connection
    {
        private const string LocalUserName = "LOCAL_USERNAME";
        private const string LocalPassword = "LOCAL_PASSWORD";

        private const string ConnectionStringLocal = "server=localhost;user=" + LocalUserName + ";database=" + DbName +
                                                     ";port=" + PortNumber + ";password=" + LocalPassword + "";

        private const string ConnectionStringAzure = "server=" + Url + ";user=" + UserName + "@" + ServerName +
                                                     ";database=" + DbName + ";port=" + PortNumber + ";password=" +
                                                     Password + "";

        private static void Print(string stringa)
        {
            Console.WriteLine(stringa);
        }


        /// <summary>
        ///     Stampa il menu per la scelta del database da utilizzare.
        /// </summary>
        /// <returns>Una stringa di connessione.</returns>
        public static string ConnectionMenu()
        {
            PromptMenu();

            var selectedMenu = SelectMenu();

            return DbConnect(selectedMenu);
        }

        /// <summary>
        ///     Imposta la stringa di connessione scelta.
        /// </summary>
        /// <param name="selezione">Connessione selezionata.</param>
        /// <returns>Stringa di connessione scelta (Azure o LocalHost).</returns>
        private static string DbConnect(int selezione)
        {
            switch (selezione)
            {
                case (int) ConnectionType.LocalHost:
                    return ConnectionStringLocal;

                case (int) ConnectionType.Azure:
                    return ConnectionStringAzure;

                default:
                    return null;
            }
        }

        /// <summary>
        ///     Legge la scelta effettuata nel menù.
        /// </summary>
        /// <returns>Valore inserito</returns>
        private static int SelectMenu()
        {
            Print("Scelta -> ");

            return int.Parse(Console.ReadLine());
        }

        /// <summary>
        ///     Stampa il menù.
        /// </summary>
        private static void PromptMenu()
        {
            Print("Quale database vuoi utilizzare: " +
                  $"\n{(int) ConnectionType.LocalHost}. Localhost con MySQL" +
                  $"\n{(int) ConnectionType.Azure}. Microsoft Azure con MySQL" +
                  $"\n\t{(int) ConnectionType.Exit}. USCIRE");
        }

        #region AzureCredentials

        private const string UserName = "USER_AZURE";
        private const string Password = "PASSWORD_AZURE";
        private const string ServerName = "SERVER_AZURE";
        private const string Url = ServerName + ".mysql.database.azure.com";
        private const string DbName = "acme_societa";
        private const string PortNumber = "3306";

        #endregion
    }
}