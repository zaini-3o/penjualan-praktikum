<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4"><?= $title ?></h1>

        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="<?= site_url('kategori') ?>">Kategori</a></li>
            <li class="breadcrumb-item active"><?= $title ?></li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <a href="<?= site_url('kategori/add') ?>" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add New
                </a>
            </div>

            <?php if ($this->session->flashdata('success')): ?>
                <div class="alert alert-success" role="alert">
                    <?= $this->session->flashdata('success'); ?>
                </div>
            <?php endif; ?>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
                        <thead class="table-dark">
                            <tr>
                                <th width="5%">No</th>
                                <th>Nama Kategori</th>
                                <th width="20%">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($kategori)) : ?>
                                <?php $no = 1; foreach ($kategori as $k) : ?>
                                    <tr>
                                        <td><?= $no++; ?></td>
                                        <td><?= htmlspecialchars($k->name); ?></td>
                                        <td>
                                            <a href="<?= base_url('kategori/getedit/' . $k->id); ?>" class="btn btn-sm btn-info">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                            <a href="<?= base_url('kategori/delete/' . $k->id); ?>" 
                                               class="btn btn-sm btn-danger"
                                               onclick="return confirm('Yakin ingin menghapus kategori ini?');">
                                                <i class="fas fa-trash"></i> Hapus
                                            </a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else : ?>
                                <tr>
                                    <td colspan="3" class="text-center">Belum ada data kategori.</td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
