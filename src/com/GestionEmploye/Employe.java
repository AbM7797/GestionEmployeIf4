package com.GestionEmploye;

import javax.servlet.RequestDispatcher;
import javax.xml.transform.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Employe implements java.io.Serializable {
    private int id;
    private String nom="achref";
    private String prenom="Benmohamed";
    private int age;
    private String sexe;
    private String email;
    private String adresse;
    private String post;

    public Employe(String nom, String prenom, int age, int id,String sexe, String email, String adresse, String post) {
        this.nom = nom;
        this.prenom = prenom;
        this.age = age;
        this.sexe = sexe;
        this.id = id;
        this.email = email;
        this.adresse = adresse;
        this.post = post;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    Employe(int id){
        this.id = id;
    }
    public Employe(){ }

    Employe(String nom,String prenom){
        this.nom = nom;
        this.prenom = prenom;

    }
    Employe(String nom,String prenom,int id){
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
    }
    public void setId(int id){
        this.id = id;
    }
    public int getId(){
        return this.id;
    }
    public String getNom(){
        return this.nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public void deleteEmploye(){
        try{
            Connection connection = new Connection();
            java.sql.Connection con = connection.getConn();
            String query = "delete from Employe where id="+this.id;
            PreparedStatement pst = con.prepareStatement(query);
            pst.execute();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public Employe addEmploye(){
        try{
            Connection connection  = new Connection();
            java.sql.Connection con = connection.getConn();
            String query = "insert into Employe (id,nom,prenom,age,sexe,email,adresse,post) values (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1,this.id);
            pst.setString(2,this.nom);
            pst.setString(3,this.prenom);
            pst.setInt(4,this.age);
            pst.setString(5,this.sexe);
            pst.setString(6,this.email);
            pst.setString(7,this.adresse);
            pst.setString(8,this.post);
            pst.execute();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Employe getEmploye(int id){
        Employe employe = new Employe();
        try{
            Connection connection = new Connection();
            java.sql.Connection con = connection.getConn();
            String query = "SELECT * FROM Employe where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();
            while(resultSet.next()){
                employe.setNom(resultSet.getString("nom"));
                employe.setPrenom(resultSet.getString("prenom"));
                employe.setAdresse(resultSet.getString("adresse"));
                employe.setAge(resultSet.getInt("age"));
                employe.setSexe(resultSet.getString("sexe"));
                employe.setEmail(resultSet.getString("email"));
                employe.setPost(resultSet.getString("post"));
                employe.setId(id);
                return employe;
            }
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Employe> getAllEmployes(){
        List<Employe> employes = new ArrayList<Employe>();

        try{
            Connection connection = new Connection();
            java.sql.Connection con = connection.getConn();
            String query = "SELECT * FROM Employe";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet resultSet = pst.executeQuery();
            while(resultSet.next()){
                employes.add(
                        new Employe(
                                resultSet.getString("nom"),
                                resultSet.getString("prenom"),
                                resultSet.getInt("age"),
                                resultSet.getInt("id"),
                                resultSet.getString("sexe"),
                                resultSet.getString("email"),
                                resultSet.getString("adresse"),
                                resultSet.getString("post")) );
            }
            con.close();
            return employes;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void updateEmploye(String nom,String prenom,String sexe,String post,String adresse,String email,int age,int id){
        try{
            Connection connection = new Connection();
            java.sql.Connection con = connection.getConn();
            String query = "UPDATE Employe set nom=?,prenom=?,id=?,age=?,sexe=?,post=?,adresse=?,email=? where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(3,id);
            pst.setString(1,nom);
            pst.setString(2,prenom);
            pst.setInt(4,age);
            pst.setString(5,sexe);
            pst.setString(8,email);
            pst.setString(7,adresse);
            pst.setString(6,post);
            pst.setLong(9,this.id);
            pst.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
