package app.Utilitarios;

import java.sql.Date;

public class Utilidades {
    public static String nullTrim(Integer valor){
        if(valor == null){
            return "";
        } else {
            return valor.toString();
        }
    }

    public static String nullTrim(String valor){
        if(valor == null){
            return "";
        } else {
            return valor.trim();
        }
    }
    
    public static String nullTrim(Date valor){
        if(valor == null){
            return "";
        } else {
            return valor.toString();
        }
    }  
    
    public static String arrumarCaractereHtmlJs(String texto) {
        if (texto == null) return "";

        return texto.trim()
            .replace("&", "&amp;")       // & ? &amp;
            .replace("<", "&lt;")        // < ? &lt;
            .replace(">", "&gt;")        // > ? &gt;
            .replace("\"", "&quot;")     // " ? &quot;
            .replace("'", "\\'");        // ' ? \'
    }
    
}
