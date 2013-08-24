/*

  Database code
  @author: Jesus Cuenca

*/

import java.sql.*;
import java.util.*;

public class PostgresqlDriverConnection implements FCDriver,DBConnection {

    Connection c = null;
	
    public Flashcard getFlashCard(){
	Flashcard fc= new Flashcard();
		
	String query_tarjeta="SELECT Palabra.Aleman,Espanyol,Tipo,Imagen,numero_casillero FROM Palabra WHERE Palabra.Aleman =?";
	String query_declinacion_sustantivo="SELECT caso , raiz_singular||terminacion as declinada_singular, raiz_plural||terminacion as declinada_plural FROM sustantivo JOIN r_sufijo_sustantivo_declinacion ON sustantivo.nombre_declinacion = r_sufijo_sustantivo_declinacion.nombre_declinacion WHERE numero=? AND aleman=?";
	String query_declinacion_determinante="SELECT caso, genero_numero, palabra_declinada FROM declinacion_determinante WHERE aleman=?";
		
	String query_conjugacion_verbo="SELECT Persona,Numero,Tiempo,Raiz||Terminacion AS Palabra_conjugada FROM Verbo_regular JOIN Desinencia ON verbo_regular.nombre_conjugacion = desinencia.nombre_conjugacion WHERE Aleman=? UNION SELECT Persona,Numero,Tiempo,Palabra_conjugada FROM Conjugacion_irregular WHERE Aleman=?";

	Integer casillero=null;
		
	// Choose a random card from a random cardholder
	try{
	    Statement sc=c.createStatement();
	    ResultSet rc=sc.executeQuery("SELECT DISTINCT numero_casillero FROM Palabra");
	    Vector casilleros=new Vector();
	    while(rc.next()){
		casilleros.add(new Integer(rc.getInt("numero_casillero")));
	    }
	    Random rg=new Random();
	    int indice= rg.nextInt(casilleros.size());
	    casillero=(Integer) casilleros.elementAt(indice);
	    rc.close();
	    sc.close();
	}catch (Exception ex){
	    System.err.println("There was a problem getting a random cardholder");
	    ex.printStackTrace();
	    return null;
	}

	String aleman=null;
	try{
	    Statement sc=c.createStatement();
	    ResultSet rc=sc.executeQuery("SELECT Aleman FROM Palabra WHERE numero_casillero = " + casillero.toString());
	    Vector palabras=new Vector();
	    while(rc.next()){
		palabras.add(rc.getString("aleman"));
	    }
	    Random rg=new Random();
	    int indice= rg.nextInt(palabras.size());
	    aleman=(String) palabras.elementAt(indice);
	    rc.close(); sc.close();
	}catch (Exception ex){
	    System.err.println("There was a problem getting a random word from the cardholder");
	    ex.printStackTrace();
	    return null;
	}

	//  Load card data 
	try{
	    PreparedStatement statement = c.prepareStatement(query_tarjeta);
	    statement.setString(1, aleman);
	    ResultSet results = statement.executeQuery();

	    results.next();
	    fc.aleman=aleman;
	    fc.espanyol=results.getString("Espanyol");
	    fc.tipo_palabra=results.getString("tipo");
	    fc.imagen=results.getString("imagen");
	    fc.cajon=new Integer(results.getInt("numero_casillero"));
			

	    if(fc.tipo_palabra.equalsIgnoreCase("sustantivo")){
		PreparedStatement statement2 = c.prepareStatement(query_declinacion_sustantivo);
		statement2.setString(1, "singular");
		statement2.setString(2, aleman);
		ResultSet results2 = statement2.executeQuery();
		fc.declinaciones=new Vector();
		while(results2.next()){
		    Vector aux=new Vector();
		    aux.add(results2.getString("caso"));
		    aux.add("singular");
		    aux.add(results2.getString("declinada_singular"));
		    fc.declinaciones.add(aux);
		}

		statement2.setString(1, "plural");
		statement2.setString(2, aleman);
		results2 = statement2.executeQuery();
		fc.declinaciones=new Vector();
		while(results2.next()){
		    Vector aux=new Vector();
		    aux.add(results2.getString("caso"));
		    aux.add("plural");
		    aux.add(results2.getString("declinada_plural"));
		    fc.declinaciones.add(aux);
		}
				
		results2.close(); statement2.close();					
	    }else if(fc.tipo_palabra.equalsIgnoreCase("determinante")){
		PreparedStatement statement2 = c.prepareStatement(query_declinacion_determinante);
		statement2.setString(1, aleman);
		ResultSet results2 = statement2.executeQuery();
		fc.declinaciones=new Vector();
		while(results2.next()){
		    Vector aux=new Vector();
		    aux.add(results2.getString("caso"));
		    aux.add(results2.getString("genero_numero"));
		    aux.add(results2.getString("palabra_declinada"));
		    fc.declinaciones.add(aux);
		}
				
	    }else if(fc.tipo_palabra.equalsIgnoreCase("verbo")){
		PreparedStatement statement2 = c.prepareStatement(query_conjugacion_verbo);
		statement2.setString(1, aleman);
		statement2.setString(2, aleman);
		ResultSet results2 = statement2.executeQuery();
		fc.declinaciones=new Vector();
		while(results2.next()){
		    Vector aux=new Vector();
		    aux.add(results2.getString("persona"));
		    aux.add(results2.getString("numero"));
		    aux.add(results2.getString("tiempo"));
		    aux.add(results2.getString("palabra_conjugada"));
		    fc.declinaciones.add(aux);
		}
				
	    }

	    results.close(); statement.close();
	}catch (SQLException ex){
	    System.err.println("Error getting card");
	    ex.printStackTrace();
	    fc=null;
	}
	return fc;
    }
	
    private void moveToBox(Flashcard fc,int box){
	String query_movimiento="UPDATE Palabra SET numero_casillero = ? WHERE Aleman =?";

	try{
	    // Check that the cardholder exists
	    Statement sc=c.createStatement();
	    ResultSet rc=sc.executeQuery("SELECT numero_casillero FROM Casillero WHERE numero_casillero="+ String.valueOf(box));
	    if(rc.next() == false){
		System.err.println("Cardholder " + String.valueOf(box) + " does not exist");
	    }else{
		// Move the card to the new cardholder
		PreparedStatement statement = c.prepareStatement(query_movimiento);
		statement.setInt(1,box);
		statement.setString(2, fc.aleman);
		statement.executeUpdate();
	    }
	}catch (SQLException ex){
	    System.err.println("Error moving flashcard");
	    ex.printStackTrace();
	}
    }
	
    public void moveToNextBox(Flashcard fc){
	moveToBox(fc,fc.cajon.intValue() + 1);
    }
	
    public void moveToFirstBox(Flashcard fc){
	moveToBox(fc,1);
    }
	
    public void getBoxStatus(){
    }
	
    public void connect(String database,String user, String password){
	try {
	    Class.forName("org.postgresql.Driver");
	} catch (ClassNotFoundException ex) {
	    System.err.println("Could not find PostgreSql driver");
	    ex.printStackTrace();
	    System.exit(1);
	}
  
	/* Conectar con la base de datos */
		               
  
	try {
	    c = DriverManager.getConnection("jdbc:postgresql:"+database,user,password); 
	} catch (SQLException ex) {
	    System.err.println("Could not connect with database "+database);
	    ex.printStackTrace();
	    System.exit(1);
	}
  
    }
}


	
	
