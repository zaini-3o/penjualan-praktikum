<main>
    <div class="container-fluid">
        <h1 class="mt-4"><?= $title; ?></h1>

        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item">
                <a href="<?= site_url('barang'); ?>">Barang</a>
            </li>
            <li class="breadcrumb-item active"><?= $title; ?></li>
        </ol>

        <div class="card mb-4">
            <div class="card-body">
                <form action="<?= site_url('barang/save') ?>" method="post">
                    <!-- Hidden ID untuk update -->
                    <input type="hidden" name="id" value="<?= $barang->id; ?>">

                    <!-- Barcode -->
                    <div class="mb-3">
                        <label>Barcode <code>*</code></label>
                        <input class="form-control" name="barcode" value="<?= $barang->barkode; ?>" type="text" placeholder="Barcode" required>
                    </div>

                    <!-- Nama Barang -->
                    <div class="mb-3">
                        <label>Nama Barang <code>*</code></label>
                        <input class="form-control" name="name" value="<?= $barang->name; ?>" type="text" placeholder="Nama Barang" required>
                    </div>

                    <!-- Harga Beli -->
                    <div class="mb-3">
                        <label>Harga Beli <code>*</code></label>
                        <input class="form-control" name="harga_beli" value="<?= $barang->harga_beli; ?>" type="text" placeholder="Harga Beli" required>
                    </div>

                    <!-- Harga Jual -->
                    <div class="mb-3">
                        <label>Harga Jual <code>*</code></label>
                        <input class="form-control" name="harga_jual" value="<?= $barang->harga_jual; ?>" type="text" placeholder="Harga Jual" required>
                    </div>

                    <!-- Stok (readonly tapi tetap dikirim) -->
                    <div class="mb-3">
                        <label>Stok</label>
                        <input class="form-control" value="<?= $barang->stok; ?>" readonly>
                        <input type="hidden" name="stok" value="<?= $barang->stok; ?>">
                    </div>

                    <!-- Kategori -->
                    <div class="mb-3">
                        <label>Kategori <code>*</code></label>
                        <select name="kategori" class="form-control" required>
                            <?php foreach($kategori as $k): ?>
                                <option value="<?= $k['id']; ?>" <?= ($barang->kategori_id == $k['id']) ? 'selected' : ''; ?>>
                                    <?= $k['name']; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <!-- Satuan -->
                    <div class="mb-3">
                        <label>Satuan <code>*</code></label>
                        <select name="satuan" class="form-control" required>
                            <?php foreach($satuan as $s): ?>
                                <option value="<?= $s['id']; ?>" <?= ($barang->satuan_id == $s['id']) ? 'selected' : ''; ?>>
                                    <?= $s['name']; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <!-- Supplier -->
                    <div class="mb-3">
                        <label>Supplier <code>*</code></label>
                        <select name="supplier" class="form-control" required>
                            <?php foreach($supplier as $sup): ?>
                                <option value="<?= $sup['id']; ?>" <?= ($barang->supplier_id == $sup['id']) ? 'selected' : ''; ?>>
                                    <?= $sup['name']; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <button class="btn btn-warning" type="submit">
                        <i class="fas fa-save"></i> Update
                    </button>
                </form>
            </div>
        </div>
    </div>
</main>
