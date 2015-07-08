package org.glassfish.servlet.business;

import java.util.ArrayList;
import java.util.List;
import org.glassfish.servlet.DAO.AmigoDAO;
import org.glassfish.servlet.DAO.LoginDAO;
import org.glassfish.servlet.persistent.AmigoPO;
import org.glassfish.servlet.persistent.LoginPO;

public class AmigoBO {
    private int amigoId;
    private int userHost;
    private int userGuest;
    private String amigoName;
    private String photoUrl;
    
    private final AmigoDAO daoAmigo;
            
    public AmigoBO() {
        daoAmigo = new AmigoDAO();
    }
    
    public int getAmigoId() {
        return amigoId;
    }

    public void setAmigoId(int amigoId) {
        this.amigoId = amigoId;
    }

    public int getUserHost() {
        return userHost;
    }

    public void setUserHost(int userHost) {
        this.userHost = userHost;
    }

    public int getUserGuest() {
        return userGuest;
    }

    public void setUserGuest(int userGuest) {
        this.userGuest = userGuest;
    }
    
    public String getAmigoName() {
        return amigoName;
    }

    public void setAmigoName(String amigoName) {
        this.amigoName = amigoName;
    }
    
    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }
    
    public List<AmigoBO> getListaAmigos(int userId) {
        List<AmigoBO> lista = new ArrayList<AmigoBO>();
        
        List<AmigoPO> amigos = daoAmigo.listaAmigosPorUsuario(userId);
        
        for (AmigoPO amigo : amigos) {
            LoginDAO daoLogin = new LoginDAO();
            LoginPO login = daoLogin.getLogin(amigo.getUserGuest());
            
            AmigoBO amigoB = new AmigoBO();
            amigoB.setAmigoId(amigo.getAmigoId());
            amigoB.setUserHost(amigo.getUserHost());
            amigoB.setUserGuest(amigo.getUserGuest());
            amigoB.setAmigoName(login.getUser());
            amigoB.setPhotoUrl(login.getPhoto());
            
            lista.add(amigoB);
        }
        
        return lista;
    }
    
    public void agregarAmigo(AmigoPO amigo) {
        daoAmigo.insertarAmigo(amigo);
    }
}
