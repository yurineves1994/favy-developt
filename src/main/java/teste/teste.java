package teste;

import br.senac.sp.entidade.Usuario;

public class teste {
    public static void main(String[] args) {
        Usuario usuario = new Usuario();
        String senhaCripto = usuario.codificarSenha("admin");
        System.out.println("senha " + senhaCripto);
    }
}
