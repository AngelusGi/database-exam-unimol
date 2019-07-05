/********************************
 *
 *   userLocal:      angel
 *   date:      23/01/2019
 *   project:   Relational databases at University Of Molise - Prof. Francesco Mercaldo
 *   angelus_gi / angelusgi
 *
 ********************************/


public class Credentials {

    private static final String dbName = "acme_societa";

    //Connessione LocalHost
    private static final String userLocal = "USERNAME_LOCAL";
    private static final String passwordLocal = "PASSWORD_LOCAL";

    //Connessione Azure
    private static final String password = "PASSWORD_AZURE";
    private static final String serverName = "acme-unimol";
    private static final String user = "angelo@" + serverName;
    private static final String serverUrl = serverName + ".mysql.database.azure.com";
    private static final String portNumber = ":3306/";


    private static final String connectionStringLocal = "jdbc:mysql://localhost" + portNumber + dbName +
            "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false";

    private static final String connectionStringAzure = "jdbc:mysql://" + serverUrl + portNumber + dbName +
            "?useSSL=false&requireSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

    //String url = "jdbc:mysql://acme-unimol.mysql.database.azure.com:3306/{your_database}?useSSL=true&requireSSL=false"; myDbConn = DriverManager.getConnection(url, "angelo@acme-unimol", {your_password});
    //String url = "jdbc:mysql://acme-unimol.mysql.database.azure.com:3306/acme_societa?useSSL=true&requireSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";


    protected static String getPasswordLocal() {
        return passwordLocal;
    }

    protected static String getConnectionStringLocal() {
        return connectionStringLocal;
    }

    protected static String getUserLocal() {
        return userLocal;
    }

    protected static String getPassword() {
        return password;
    }

    protected static String getUser() {
        return user;
    }

    protected static String getConnectionStringAzure() {
        return connectionStringAzure;
    }
}
