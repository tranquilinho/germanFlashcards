/*
  Controller of the application
  @author: Jesus Cuenca
*/

import java.util.*;

public class FlashCardController{
    // Set up according to your database
    // !!!! Get database parameters from an environment file
    static String db="aleman";
    static String user="changeme";
    static String password="changeme";

    private static void show(Flashcard fc){
	System.out.println("German: "+ fc.aleman + ". Word type: " + fc.tipo_palabra + ". Image: " + fc.imagen + ". Cardholder: " + fc.cajon.toString());
    }
	
    private static boolean evaluate(Flashcard fc){
	boolean res=true;
	System.out.print("Introduce the traslation: ");
	String respuesta=readLn();
	if(fc.espanyol.equals(respuesta)){
	    System.out.println("Correct");
	    res= res && true;
	}else{
	    System.out.println("Wrong. Answer: " + fc.espanyol);
	    res= res && false;
	}
		
	if(fc.declinaciones != null){
	    for(int i=1; i<=2; i++){
		Random rg=new Random();
		int indice= rg.nextInt(fc.declinaciones.size());
		Vector declinacion=(Vector) fc.declinaciones.elementAt(indice);
		System.out.print("What is the ");
		for(int j=0; j< declinacion.size() -1; j++){
		    System.out.print(declinacion.elementAt(j) + " ");
		}
		System.out.print("? ");
		respuesta=readLn();
		if(declinacion.elementAt(declinacion.size()-1).toString().equals(respuesta)){
		    System.out.println("Correct");
		    res= res && true;
		}else{
		    System.out.println("Wrong. Answer: " + declinacion.elementAt(declinacion.size()-1));
		    res= res && false;
		}
	
	    }
	}		
	return (res);
    }
	
    private static String readLn() {
	byte [] byteArray = new byte[300];
	try {
	    System.in.read(byteArray);
	} catch (Exception ex) {
	    ex.printStackTrace();
	
	}
	
	String result = new String(byteArray);
	int newLineIndex = result.indexOf("\n");
	if (newLineIndex > -1)
	    result = result.substring(0,newLineIndex);
	newLineIndex = result.indexOf("\r");
	if (newLineIndex>-1)
	    result = result.substring(0,newLineIndex);
	return result;
    }

    public static void main(String[] argv){
	Flashcard fc;
	DataBaseConnectionMgr.setConnectionParameters("org.postgresql.Driver",db,user,password);
	FCDriver fcd=null;
	try{
	    fcd=DataBaseConnectionMgr.getFCDriver();
	}catch (Exception ex){
	    System.err.println("Error getting the flashcard driver");
	    ex.printStackTrace();
	}
		
	while(true){
	    fc=fcd.getFlashCard();
					
	    show(fc);
	    if(evaluate(fc)){
		fcd.moveToNextBox(fc);
	    }else{
		fcd.moveToFirstBox(fc);
	    }		
	}		
    }
}
