<?php
include_once "library/inc.seslogin.php";
include_once "library/inc.connection.php";
include_once "library/inc.library.php";

// Baca variabel URL browser
$namaSiswa = isset($_GET['namaSiswa']) ? $_GET['namaSiswa'] : 'Semua';
// Baca variabel dari Form setelah di Post
$namaSiswa = isset($_POST['carinama']) ? $_POST['carinama'] : $namaSiswa;

// Membuat filter SQL
if ($namaSiswa == "Semua") {
  // Tidak memilih kelas
  $filterSQL   = "";
} else {
  // Memilih kelas
  $filterSQL   = "WHERE nm_siswa LIKE '%$namaSiswa%' OR nisn LIKE '%$namaSiswa%'";
}

# UNTUK PAGING (PEMBAGIAN HALAMAN)
$baris  = 50;
$hal   = isset($_GET['hal']) ? $_GET['hal'] : 1;
$infoSql = "SELECT * FROM siswa $filterSQL";
$infoQry = mysqli_query($conn, $infoSql) or die("error paging: " . mysqli_error($conn));
$jumlah  = mysqli_num_rows($infoQry);
$maks  = ceil($jumlah / $baris);
$mulai  = $baris * ($hal - 1);
?><table width="900" border="0" cellpadding="2" cellspacing="1" class="table-border">
  <tr>
    <td colspan="2">
      <h1><b> DATA SISWA </b></h1>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <form action="<?php $_SERVER['PHP_SELF']; ?>" method="post" name="form1" target="_self">
        <table width="400" border="0" class="table-list-filter">
          <tr>
            <td colspan="3" bgcolor="#CCCCCC"><strong>FILTER DATA </strong></td>
          </tr>
          <tr>
            <td width="300"><strong>Cari Data Siswa </strong></td>
            <td width="5"><strong>:</strong></td>
            <td width="397"><input name="carinama" type="text" value='<?php $namaSiswa ?>' />
              <input name="btnTampilkan" type="submit" value=" Tampilkan  " /></td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="right"><a href="?open=Siswa-Add" target="_self"><img src="images/btn_add_data.png" height="30" border="0" /></a></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">
      <table class="table-list" width="100%" border="0" cellspacing="1" cellpadding="2">
        <tr>
          <th width="22" align="center">No</th>
          <th width="43">Kode</th>
          <th width="69">NISN</th>
          <th width="170">Nama Siswa</th>
          <th width="34">L/P </th>
          <th width="280">Alamat</th>
          <th width="104">No. Telepon </th>
          <td colspan="3" align="center" bgcolor="#CCCCCC"><strong>Tools</strong></td>
        </tr>
        <?php
        // Skrip menampilkan data Siswa ke layar
        $mySql = "SELECT * FROM siswa $filterSQL ORDER BY kd_siswa ASC LIMIT $mulai, $baris";
        $myQry = mysqli_query($conn, $mySql)  or die("Query salah : " . mysqli_error($conn));
        $nomor  = $mulai;
        while ($myData = mysqli_fetch_array($myQry)) {
          $nomor++;
          $Kode = $myData['kd_siswa'];
        ?>
          <tr>
            <td> <?php echo $nomor; ?> </td>
            <td> <?php echo $myData['kd_siswa']; ?> </td>
            <td> <?php echo $myData['nisn']; ?> </td>
            <td> <?php echo $myData['nm_siswa']; ?> </td>
            <td> <?php echo $myData['kelamin']; ?> </td>
            <td> <?php echo $myData['alamat']; ?> </td>
            <td> <?php echo $myData['no_telepon']; ?> </td>
            <td width="40" align="center"><a href="?open=Siswa-Delete&Kode=<?php echo $Kode; ?>" target="_self" alt="Delete Data" onclick="return confirm('ANDA YAKIN AKAN MENGHAPUS DATA SISWA INI ... ?')">Delete</a></td>
            <td width="41" align="center"><a href="?open=Siswa-Edit&Kode=<?php echo $Kode; ?>" target="_self" alt="Edit Data">Edit</a></td>
            <td width="40" align="center"><a href="cetak/siswa_cetak.php?Kode=<?php echo $Kode; ?>" target="_blank">Cetak</a></td>
          </tr>
        <?php } ?>
      </table>
    </td>
  </tr>
  <tr class="selKecil">
    <td width="365"><b>Jumlah Data :</b> <?php echo $jumlah; ?> </td>
    <td width="424" align="right"><strong>Halaman ke :</strong>
      <?php
      for ($h = 1; $h <= $maks; $h++) {
        echo " <a href='?open=Siswa-Data&hal=$h'>$h</a> ";
      }
      ?> </td>
  </tr>
</table>