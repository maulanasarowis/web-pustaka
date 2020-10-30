<?php
if (isset($_SESSION['SES_LOGIN'])) {
	echo "<h2>Selamat Datang di Pustaka - Sistem Informasi Perpustakaan</h2>";
	echo "<b> Anda login sebagai Admin";
	exit;
} else {
	echo "<h2>Selamat Datang di Pustaka - Sistem Informasi Perpustakaan</h2>";
	echo "<b>Anda belum login, silahkan <a href='?open=Login' alt='Login'>login </a>untuk mengakses sistem ini ";
}
