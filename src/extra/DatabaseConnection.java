package extra;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseConnection{
    public static String url;
    public static Connection connexion;

    static{
        url="jdbc:sqlite:/tmp/burgerinsa.db";
        connexion=null;
    }

    public static Connection getConnexion(){
        if(connexion==null){
            try{
                Class.forName("org.sqlite.JDBC");
                connexion = DriverManager.getConnection(url);
            } catch(Exception e){
                System.out.println("La connexion a échoué: "+e);
                return null;
            }
            System.out.println("La connexion semble être établie.");
        }
        return connexion;
    }

    public static void deconnexion(){
        try{
            connexion.close();
        } catch(Exception e){
            System.out.println("La déconnexion a échoué:"+e);
        }
    }
}
