<?
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

include 'conexao.php';

$nome = $_POST["nome"];
$mensagem = $_POST["mensagem"];

$query = "INSERT INTO mensagens(nome, mensagem) VALUES ('$nome', '$mensagem')";


if ($link->query($query) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $link->error;
}
?>