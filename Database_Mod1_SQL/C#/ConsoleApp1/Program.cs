using System;
using MySql.Data.MySqlClient;



namespace ProgettoBasiDati
{

    class Program
    {

        private static void stampa(String stringa)
        {
            Console.WriteLine(stringa);
        }

        private static void uscitaAnticipata(String condizione)
        {
            if (condizione == null)
            {
                stampa("\n\nEsecuzione terminata. Premi un tasto per uscire...");
                Console.ReadKey();
                Environment.Exit(-1);
            }
        }

        static void Main(string[] args)
        {
            /**
             * ESEGUITA COME APPLICAZIONE DI TIPO CONSOLE SU .NET CORE (UTILIZZABILE ANCHE SU .NET FRAMEWORK)
             * RICORDA DI ESEGUIRE L'INSTALLAZIONE DELLA LIBRERIA "MYSQL.DATA" DA NUGET
             * NELLA CONNECTION STRING "INSERT_HERE_YOUR_***" DEVE ESSERE SOSTITUTIO DAL CORRETTO VALORE SENZA " "
             *      RICORDA DI DECOMMENTARE LA "connectionString"
             */


            GUI.menuIntro();
            
            String connectionString = Connection.ConnectionMenu();
            
            MySqlConnection connection = new MySqlConnection(connectionString);

            uscitaAnticipata(connectionString);

            stampa("Tentativo di connessione in corso...");
            connection.Open();
            stampa("\nConnessione stabilita.");

           

            string querySQL;

            do
            {
                GUI interfaccia = new GUI();

                querySQL = interfaccia.Menu();

                uscitaAnticipata(querySQL);

                stampa("\nQuery '" + querySQL + "' in corso...");

                try
                {

                    MySqlCommand command = new MySqlCommand(querySQL, connection);
                    MySqlDataReader readerQuery = command.ExecuteReader();
                    stampa("\nQuery effettuata con successo!\n");

                    try
                    {

                        while (readerQuery.Read())
                        {

                            for (int index = 0; index < readerQuery.FieldCount; index++)
                            {

                                Console.Write("\t" + readerQuery[index]);
                            }
                            stampa("\n");
                        }

                        readerQuery.Close();
                    }

                    catch (Exception exception)
                    {
                        stampa("\nErrore, ecco il log:");
                        stampa(exception.ToString());
                    }

                }
                catch (MySqlException mySqlException)
                {
                    stampa("\nErrore, ecco il log:");
                    stampa(mySqlException.ToString());
                }
            } while (querySQL != null);
            

            connection.Close();

            stampa("\n\nEsecuzione terminata. Premi un tasto per uscire...");
            Console.ReadKey();


        }
              
    }

}
