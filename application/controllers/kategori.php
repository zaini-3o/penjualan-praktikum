<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Kategori extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('kategori_model');
        $this->load->library('form_validation');
        $this->load->library('session');
    }

    // 🟩 Menampilkan semua data kategori
    public function index()
    {
        $data = array(
            'title'     => 'View Data Kategori',
            'kategori'  => $this->kategori_model->getAll(),
            'content'   => 'kategori/index'
        );

        $this->load->view('template/main', $data);
    }

    // 🟦 Menampilkan form tambah data
    public function add()
    {
        $data = array(
            'title'   => 'Tambah Data Kategori',
            'content' => 'kategori/add_form'
        );

        $this->load->view('template/main', $data);
    }

    // 🟨 Proses simpan data baru
    public function save()
    {
        $this->kategori_model->save();

        if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata("success", "Data Kategori Berhasil Disimpan");
        }

        redirect('kategori');
    }

    // 🟧 Menampilkan form edit data
    public function getedit($id)
    {
        $data = array(
            'title'     => 'Update Data Kategori',
            'kategori'  => $this->kategori_model->getById($id),
            'content'   => 'kategori/edit_form'
        );

        $this->load->view('template/main', $data);
    }

    // 🟪 Proses update data
    public function edit()
    {
        $this->kategori_model->editData();

        if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata("success", "Data Kategori Berhasil Diupdate");
        }

        redirect('kategori');
    }

    // 🟥 Fungsi hapus data kategori
    public function delete($id)
    {
        $this->kategori_model->delete($id);
        redirect('kategori');
    }
}
