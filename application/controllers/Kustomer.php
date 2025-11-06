<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kustomer extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('Kustomer_model');
    }

    // ============================
    // HALAMAN MENU LAPORAN
    // ============================
    public function laporan()
    {
        $data = array(
            'title'   => 'Tambah Laporan Data Kustomer',
            'content' => 'kustomer/laporan'
        );

        $this->load->view('template/main', $data);
    }

    // ============================
    // 1. INTERNAL HEADER ONLY
    // ============================
    public function report_internal_header()
    {
        header("Content-type: application/vnd.ms-excel");
        header("Content-Disposition: attachment; filename=report_header_only.xls");

        echo "<h2>Laporan Kustomer (Header Only)</h2>";
        echo "<p>Dibuat langsung dari controller tanpa file view.</p>";
    }

    // ============================
    // 2. EKSTERNAL FILE CONTROLLER
    // ============================
    public function report_eksternal()
    {
        $data['kustomer'] = $this->Kustomer_model->get_all();

        // Jika ingin pakai template/main juga:
        // $data['title'] = "Laporan Kustomer";
        // $data['content'] = "laporan/report_eksternal";
        // $this->load->view('template/main', $data);

        // Kalau ingin langsung tampil:
        $this->load->view('laporan/report_eksternal', $data);
    }

    // ============================
    // 3. CUSTOM EKSTERNAL FILE
    // ============================
    public function report_custom()
    {
        $data['kustomer'] = $this->Kustomer_model->get_all();
        $data['judul']    = "Custom Laporan Data Kustomer";
        $data['footer']   = "Dicetak pada: " . date("d/m/Y H:i");

        $this->load->view('laporan/report_custom', $data);
    }

}
