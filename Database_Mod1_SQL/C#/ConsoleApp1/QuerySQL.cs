using System;
using System.Collections.Generic;
using System.Text;

namespace ProgettoBasiDati
{
    class QuerySQL
    {

        private static void stampa(String stringa)
        {
            Console.WriteLine(stringa);
        }

        public void queryMenu()
        {
            stampa("Quale query vuoi eseguire: " +
                   "\n1. Query personalizzata" +
                   "\n2. Stampa tutti i costumi, selezionando il sesso, la taglia e il prezzo" +
                   "\n3. Stampa tutti i costumi economici disponibili selezionando il sesso" +
                   "\n\t 0. USCIRE");
        }

        public string queryFullCustom(int selectedMenu)
        {
            stampa("Inserisci il sesso: ");
            string gender = Console.ReadLine();

            stampa("Inserisci la taglia:");
            string size = Console.ReadLine();

            stampa("Inserisci la prezzo:");
            string prezzoReadLine = Console.ReadLine();
            double prezzo = Double.Parse(prezzoReadLine);

            return callQuery(selectedMenu, gender, size, prezzo);
        }
        public String callQuery(int selezione)
        {
            string querySQL;

            if (selezione == 1)
            {
                string dbName = "use acme_societa; ";

                stampa("Inserisci la selezione:");
                string select = Console.ReadLine();

                stampa("Inserisci la tabella:");
                string from = Console.ReadLine();

                stampa("Inserisci la condizione:");
                string where = Console.ReadLine();

                querySQL = (dbName + " " + select + " " + from + " " + where + " ;");
            }
            else
            {
                querySQL = null;
            }

            return querySQL;
        }

        public String callQuery(int selezione, string gender, string size, double price)
        {
            string querySQL;

            querySQL = "CALL costumi_economici_user('" + gender + "', \"%" + size + "%\", " + price + ");";

            return querySQL;
        }

        public String callQuery(int selezione, string gender)
        {
            string querySQL;
            querySQL = "CALL costumi_economici_gender('" + gender + "');";

            return querySQL;
        }

    }
}
