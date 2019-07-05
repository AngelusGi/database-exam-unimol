using System;
using MySql.Data.MySqlClient;

namespace ProgettoBasiDati
{
    internal class Start
    {
        private static void Print(string text)
        {
            Console.WriteLine(text);
        }

        private static void Exit(string condition)
        {
            if (condition == null)
            {
                Print("\n\nEsecuzione terminata. Premi un tasto per uscire...");
                Console.ReadKey();
                Environment.Exit(-1);
            }
        }

        private static void Main()
        {
            Gui.MenuIntro();

            var connectionString = Connection.ConnectionMenu();

            try
            {
                var connection = new MySqlConnection(connectionString);

                Exit(connectionString);

                Print("Tentativo di connessione in corso...");
                connection.Open();
                Print("\nConnessione stabilita.");

                string querySql;

                do
                {
                    var gui = new Gui();

                    querySql = gui.Menu();

                    Exit(querySql);

                    Print("\nQuery '" + querySql + "' in corso...");

                    try
                    {
                        var command = new MySqlCommand(querySql, connection);
                        var readerQuery = command.ExecuteReader();
                        Print("\nQuery effettuata con successo!\n");

                        try
                        {
                            Print("\t========================================================================");
                            for (var index = 0; index < readerQuery.VisibleFieldCount; index++)
                                Console.Write("\t" + readerQuery.GetName(index));

                            Print("\n\t========================================================================\n\n");

                            while (readerQuery.Read())
                            {
                                for (var index = 0; index < readerQuery.FieldCount; index++)
                                    Console.Write("\t" + readerQuery[index]);

                                Print("\n");
                            }

                            readerQuery.Close();
                        }

                        catch (Exception exception)
                        {
                            Print("\nErrore, ecco il log:");
                            Print(exception.ToString());
                        }
                    }
                    catch (MySqlException mySqlException)
                    {
                        Print("\nErrore, ecco il log:");
                        Print(mySqlException.ToString());
                    }
                } while (querySql != null);


                connection.Close();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
                throw;
            }

            Print("\n\nEsecuzione terminata. Premi un tasto per uscire...");
            Console.ReadKey();
        }
    }
}