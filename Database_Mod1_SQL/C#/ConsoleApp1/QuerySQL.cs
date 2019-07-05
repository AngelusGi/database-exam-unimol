using System;

namespace ProgettoBasiDati
{
    internal enum QueryType
    {
        Exit,
        CustomQuery,
        ViewSiGePr,
        ViewGender
    }

    internal class QuerySql
    {
        private static void Print(string text)
        {
            Console.WriteLine(text);
        }

        /// <summary>
        ///     Stampa il menù di query disponibili, oppure è possibile inserirne una nuova.
        /// </summary>
        public void QueryMenu()
        {
            Print("Quale query vuoi eseguire: " +
                  $"\n{(int) QueryType.CustomQuery}. Query personalizzata" +
                  $"\n{(int) QueryType.ViewSiGePr}. Stampa tutti i costumi, selezionando il sesso, la taglia e il prezzo" +
                  $"\n{(int) QueryType.ViewGender}. Stampa tutti i costumi economici disponibili selezionando il sesso" +
                  $"\n\t{(int) QueryType.Exit}. USCIRE");
        }


        /// <summary>
        ///     Esegue una query completamente personalizzata.
        /// </summary>
        /// <returns>Stringa contenente il risultato della query.</returns>
        public string QueryFullCustom()
        {
            Print("Inserisci il sesso: ");
            var gender = Console.ReadLine();

            Print("Inserisci la taglia:");
            var size = Console.ReadLine();

            Print("Inserisci la prezzo:");
            var price = double.Parse(Console.ReadLine());

            return CallQuery(gender, size, price);
        }

        /// <summary>
        ///     Invoca una query.
        /// </summary>
        /// <param name="selection">Voce selezionata da menu.</param>
        /// <returns>Stringa contenente il risultato della query.</returns>
        public string CallQuery(int selection)
        {
            string querySql;

            if (selection.Equals(1))
            {
                var dbName = "use acme_societa; ";

                Print("Inserisci la selezione:");
                var select = Console.ReadLine();

                Print("Inserisci la tabella:");
                var from = Console.ReadLine();

                Print("Inserisci la condizione:");
                var where = Console.ReadLine();

                querySql = dbName + " " + select + " " + from + " " + where + " ;";
            }
            else
            {
                querySql = null;
            }

            return querySql;
        }

        /// <summary>
        ///     Invoca una query ad una vista che utilizza i seguenti parametri.
        /// </summary>
        /// <param name="gender">Sesso del costume.</param>
        /// <param name="size">Taglia del costume.</param>
        /// <param name="price">Prezzo massimo del costume.</param>
        /// <returns>Stringa contenente il risultato della query.</returns>
        public string CallQuery(string gender, string size, double price)
        {
            var querySql = "CALL costumi_economici_user('" + gender + "', \"%" + size + "%\", " + price + ");";

            return querySql;
        }

        /// <summary>
        ///     Invoca una query ad una vista che utilizza i seguenti parametri.
        /// </summary>
        /// <param name="gender">Sesso del costume.</param>
        /// <returns>Stringa contenente il risultato della query.</returns>
        public string CallQuery(string gender)
        {
            var querySql = "CALL costumi_economici_gender('" + gender + "');";

            return querySql;
        }
    }
}