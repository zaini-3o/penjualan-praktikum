<h2><?= $judul ?></h2>

<table border="1" cellpadding="8">
    <tr>
        <th>No</th>
        <th>NIK</th>
        <th>Nama</th>
        <th>Alamat</th>
        <th>Telp</th>
    </tr>

    <?php $no = 1; foreach ($kustomer as $k): ?>
    <tr>
        <td><?= $no++ ?></td>
        <td><?= $k->nik ?></td>
        <td><?= $k->name ?></td>
        <td><?= $k->alamat ?></td>
        <td><?= $k->telp ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<br>
<p><i><?= $footer ?></i></p>
