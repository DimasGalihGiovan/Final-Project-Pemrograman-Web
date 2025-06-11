<!-- File: detail-armada.php -->
<?php
include 'koneksi.php';

// Validasi ID
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
  die("ID tidak ditemukan atau tidak valid.");
}
$id = intval($_GET['id']);

// Ambil data armada
$query = mysqli_query($conn, "SELECT * FROM armada WHERE id=$id");
if (!$query || mysqli_num_rows($query) == 0) {
  die("Data armada tidak ditemukan.");
}
$data = mysqli_fetch_assoc($query);

// Ambil fasilitas sesuai kategori
function getFasilitas($conn, $id, $kategori) {
  $q = mysqli_query($conn, "SELECT fasilitas FROM fasilitas WHERE armada_id=$id AND kategori='$kategori'");
  $list = [];
  while ($r = mysqli_fetch_assoc($q)) {
    $list[] = $r['fasilitas'];
  }
  return $list;
}
?>


<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?= $data['nama']; ?> - Barokah Trans</title>
  <link rel="stylesheet" href="fasilitas.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>
<body>

<div class="wrapper">
  <header>
      <div class="logo">
        <img src="Assets/logo_hitam.jpg" alt="Barokah Trans Logo" />
      </div>
      <nav>
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="bus.html">Bus</a></li>
          <li class="dropdown">
            <a href="#">Fasilitas</a>
            <ul class="dropdown-menu">
              <li><a href="fasilitas.php?id=1">Bus Besar</a></li>
              <li><a href="fasilitas.php?id=2">Bus Mini</a></li>
              <li><a href="fasilitas.php?id=3">Bus Elf</a></li>
              <li><a href="fasilitas.php?id=4">Bus HiAce</a></li>
            </ul>
          </li>
          <li><a href="about.html">About</a></li>
          <li><a href="order.html">Order</a></li>
          <li><a href="galeri.html">Galeri</a></li>
        </ul>
      </nav>
    </header>

  <section class="armada-detail">
    <div class="armada-left">
      <img src="Assets/<?= $data['gambar']; ?>" alt="<?= $data['nama']; ?>" class="armada-img">
    </div>

    <div class="armada-right">
      <h2><?= $data['nama']; ?></h2>
      <h3><?= $data['kursi']; ?> Seats - <?= $data['jenis']; ?></h3>
      <p><?= nl2br($data['deskripsi']); ?></p>

      <div class="armada-fasilitas">
        <h4>Trip Service</h4>
        <ul>
          <?php foreach(getFasilitas($conn, $id, 'Trip Service') as $f): ?>
            <li><i class="fas fa-check-circle"></i> <?= $f; ?></li>
          <?php endforeach; ?>
        </ul>

        <h4>Entertainment</h4>
        <ul>
          <?php foreach(getFasilitas($conn, $id, 'Entertainment') as $f): ?>
            <li><i class="fas fa-check-circle"></i> <?= $f; ?></li>
          <?php endforeach; ?>
        </ul>

        <h4>Seat Features</h4>
        <ul>
          <?php foreach(getFasilitas($conn, $id, 'Seat Features') as $f): ?>
            <li><i class="fas fa-check-circle"></i> <?= $f; ?></li>
          <?php endforeach; ?>
        </ul>
      </div>

      <div class="armada-buttons">
        <a href="order.html" class="btn"><i class="fab fa-whatsapp"></i> Sewa Bus Pariwisata</a>
      </div>
    </div>
  </section>
</div>

<footer>
    <div class="footer-left">
      <img src="Assets/logo_hitam.jpg" alt="Barokah Trans Logo" />
      <div class="tagline">#YourTripPartner</div>
    </div>
    <div class="footer-right">
      <div>
        <h4>Alamat</h4>
        <p>
          <a href="https://www.google.com/maps?q=Jl.+Joyoboyo+34+Aloha,+Sawotratap,+Sidoarjo,+61254"
             target="_blank" class="footer-link">
            Jl. Joyoboyo 34 Aloha - Sawotratap - Sidoarjo, 61254
          </a>
        </p>
      </div>
      <div>
        <h4>Jam Operasional</h4>
        <p>Senin - Sabtu: 07.00 - 17.00<br/>Minggu & Hari Libur Nasional: Tutup</p>
      </div>
    </div>
  </footer>

</body>
</html>
