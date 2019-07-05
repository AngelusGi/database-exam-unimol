/********************************
 *
 *   userLocal:      angel
 *   date:      23/01/2019
 *   project:   Relational databases at University Of Molise - Prof. Francesco Mercaldo
 *   angelus_gi / angelusgi
 *
 ********************************/

import java.sql.*;

public class Main {

    private static void stampa(String stringa){
        System.out.println(stringa);
    }


    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        //aggiungere Project Stucture > Library > Maven > mysql:mysql-connector-java:8.0.16
        Class.forName("com.mysql.cj.jdbc.Driver");

        // stringa connessione localhost
        String url = Credentials.getConnectionStringLocal();
        String user = Credentials.getUserLocal();
        String psw = Credentials.getPasswordLocal();

//        // stringa connessione Azure
//        String url = Credentials.getConnectionStringAzure();
//        String user = Credentials.getUser();
//        String psw = Credentials.getPassword();

        Connection connection = DriverManager.getConnection(url, user, psw);

        stampa("\n\tConnessione effettuata!\n");

        Statement statement = connection.createStatement();

        String sqlQuery = "CALL costumi_economici_gender(\"M\");";
        //String sqlQuery = "CALL costumi_economici_user('m', \"%s%\", 400.00);";

        ResultSet resultSet = statement.executeQuery(sqlQuery);
        stampa("Query eseguita: \t" + sqlQuery + "\n");


        ResultSetMetaData metaData = resultSet.getMetaData();
        //numero di colonne
        int count = metaData.getColumnCount();
        String[] columnName = new String[count];

        for (int i = 1; i <= count; i++)
        {
            columnName[i-1] = metaData.getColumnLabel(i);
            System.out.print(columnName[i-1] + "\t|\t");
        }

        stampa("\n");

        while (resultSet.next()){
            stampa(resultSet.getString(columnName[0])+ "\t|\t" +
                    resultSet.getString(columnName[1])+ "\t|\t" +
                    resultSet.getString(columnName[2])+ "\t|\t" +
                    resultSet.getString(columnName[3]));
        }

        connection.close();
        stampa("\n\tConnessione chiusa!");
        stampa("*** ESECUZIONE TERMINATA ***");

    }
}