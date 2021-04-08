/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import br.senac.sp.entidade.Usuario;

/**
 *
 * @author PICHAU
 */
public class teste {
    public static void main(String[] args) {
        Usuario usuario = new Usuario();
        String senhaCripto = usuario.codificarSenha("admin");
        System.out.println("senha " + senhaCripto);
    }
}
