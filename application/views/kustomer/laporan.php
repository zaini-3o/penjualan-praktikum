<div class="main-content">
    <div class="section">
        <div class="section-header">
            <h1><?php echo $title ?></h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="<?php echo site_url('user') ?>">Dashboard</a></div>
                <div class="breadcrumb-item"><?php echo $title ?></div>
            </div>
        </div>

        <div class="card mb-4">
            <div class="card-header"></div>
            <div class="card-body">
                <div class="card mb-4">
                    <div class="card-body">
                        <form class="form-horizontal" method="post" action="<?php echo base_url('report/kustomerlap') ?>" target="_blank">
                            <div class="col-sm-12">
                                <label for="exampleInputEmail1" class="form-label">Internal file Controller : Menyeritakan report pada file controller</label>
                            </div>
                            <button type="submit" class="btn btn-warning">Cetak Laporan</button>
                        </form>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <form class="form-horizontal" method="post" action="<?php echo base_url('report/headerlap') ?>" target="_blank">
                            <div class="col-sm-12">
                                <label for="exampleInputEmail1" class="form-label">Internal file Controller : Menyeritakan report hanya header pada file controller</label>
                            </div>
                            <button type="submit" class="btn btn-warning">Cetak Laporan</button>
                        </form>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <form class="form-horizontal" method="post" action="<?php echo base_url('report/kustomerfull') ?>" target="_blank">
                            <div class="col-sm-12">
                                <label for="exampleInputEmail1" class="form-label">Eksternal file Controller : Menyeritakan report pada file berbeda dan diletakan di folder view</label>
                            </div>
                            <button type="submit" class="btn btn-warning">Cetak Laporan</button>
                        </form>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <form class="form-horizontal" method="post" action="<?php echo base_url('report/kustomerextview') ?>" target="_blank">
                            <div class="col-sm-12">
                                <label for="exampleInputEmail1" class="form-label">Custom eksternal file Controller : Menyeritakan report pada file berbeda dan diletakan di folder view</label>
                            </div>
                            <button type="submit" class="btn btn-warning">Cetak Laporan</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
