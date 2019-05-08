/********************************
 *
 *   userLocal:      angel
 *   date:      23/01/2019
 *   project:   Relational databases at University Of Molise - Prof. Francesco Mercaldo
 *   angelus_gi / angelusgi
 *
 ********************************/

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;

public class Main {

    private static void stampa(String stringa){
        System.out.println(stringa);
    }


    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.cj.jdbc.Driver");

        // stringa connessione localhost
        //String url = Credentials.getConnectionStringLocal();
        //String user = Credentials.getUserLocal();
        //String psw = Credentials.getPasswordLocal();

        // stringa connessione Azure
        String url = Credentials.getConnectionStringAzure();
        String user = Credentials.getUser();
        String psw = Credentials.getPassword();

        Connection connection = DriverManager.getConnection(url, user, psw);

        stampa("\n\tConnessione effettuata!\n");

        Statement statement = connection.createStatement();

        String sqlQuery = "CALL costumi_economici_gender(\"M\");";

        //String sqlQuery = "CALL costumi_economici_user('m', \"%s%\", 400.00);";

        ResultSet resultSet = statement.executeQuery(sqlQuery);

        stampa("Query eseguita: \t" + sqlQuery + "\n");

        stampa("TIPO" + "\t|\t" + "NOME"+"\t|\t" + "TAGLIA" + "\t|\t"+"COSTO" +
                "\n*******************************************************");


        while (resultSet.next()){

            stampa(resultSet.getString("tipo")+ "\t|\t" +
                    resultSet.getString("nome")+ "\t|\t" +
                    resultSet.getString("taglia")+ "\t|\t" +
                    resultSet.getString("costo"));
        }

        connection.close();
        stampa("\n\tConnessione chiusa!");
        stampa("*** ESECUZIONE TERMINATA ***");

    }
}