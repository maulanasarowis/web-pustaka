<?php
include_once "library/inc.seslogin.php";
include_once "library/inc.connection.php";

// Jika ditemukan data Kode dari URL browser
if(isset($_GET['Kode'])){
	$Kode	= $_GET['Kode'];
	// Hapus data sesuai Kode yang didapat di URL
	$mySql = "DELETE FROM buku WHERE kd_buku='$Kode'";
	$myQry = mysqli_query($conn,$mySql) or die ("Eror hapus data".mysqli_error($conn));
	if($myQry){
		// Refresh halaman
		echo "<meta http-equiv='refresh' content='0; url=?open=Buku-Data'>";
	}
}
else {
	// Jika tidak ada data Kode ditemukan di URL
	echo "<b>Data yang dihapus tidak ada</b>";
}
