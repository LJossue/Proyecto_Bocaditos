



//ESTO VA EN UTIL SE LLAMA COMO QUIERA

import ModeloDAO.UsuarioDAO;
import ModeloVO.UsuarioVO;
import java.security.SecureRandom;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator; //hay que importar el que es .mail
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author APRENDIZ
 */
public class PropiedadesCorreo {

    private static final String CARACTERES_VALIDOS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int LONGITUD_CONTRASENA = 10;

    private static String generarContrasenaAleatoria() {
        SecureRandom rnd = new SecureRandom();
        StringBuilder sb = new StringBuilder(LONGITUD_CONTRASENA);
        for (int i = 0; i < LONGITUD_CONTRASENA; i++) {
            sb.append(CARACTERES_VALIDOS.charAt(rnd.nextInt(CARACTERES_VALIDOS.length())));
        }
        return sb.toString();
    }

    public static void envioCorreo(String servidor, String puerto, final String usuario, final String clave, String destino, String asunto, String mensaje) throws MessagingException {

        UsuarioDAO usuDAO = new UsuarioDAO();

        String contrasenaRecuperada = generarContrasenaAleatoria();
        
         // Actualizar la contraseña del usuario en la base de datos
        usuDAO.actualizarContrasena(contrasenaRecuperada, destino);
        
        //propiedades Servidor SMTP
        Properties propiedades = new Properties();
        propiedades.put("mail.smtp.host", servidor);
        propiedades.put("mail.smtp.port", puerto);
        propiedades.put("mail.smtp.auth", "true");
        propiedades.put("mail.smtp.starttls.enable", "true");

        Authenticator autenticar = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usuario, clave);
            }
        };

        Session sesion = Session.getInstance(propiedades, autenticar);
        Message msg = new MimeMessage(sesion);//construir el mensaje
        msg.setFrom(new InternetAddress(usuario));
        InternetAddress[] direcciones = {new InternetAddress(destino)};
        msg.setRecipients(Message.RecipientType.TO, direcciones);
        msg.setSubject("Nueva contraseña - Bocaditos.");
        msg.setSentDate(new Date());
        msg.setText("Tu nueva contraseña es : " + contrasenaRecuperada + " recuerda cambiarla en tu perfil.");

        Transport.send(msg, usuario, clave);
    }
}
