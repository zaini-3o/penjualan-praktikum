<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Kategori_model extends CI_Model
{
    protected $_table = 'kategori';
    protected $primary = 'id';

    // Ambil semua data kategori
    public function getAll()
    {
        return $this->db->get($this->_table)->result();
    }

    // Ambil satu data kategori berdasarkan ID
    public function getById($id)
    {
        return $this->db->get_where($this->_table, ['id' => $id])->row();
    }

    // Simpan data baru
    public function save()
    {
        $data = [
            'name' => htmlspecialchars($this->input->post('name', true))
        ];
        return $this->db->insert($this->_table, $data);
    }

    // 🔧 Update data kategori (fungsi edit)
    public function editData()
    {
        $id = $this->input->post('id');
        $data = [
            'name' => htmlspecialchars($this->input->post('name', true))
        ];

        return $this->db->set($data)
                        ->where($this->primary, $id)
                        ->update($this->_table);
    }

    // 🗑️ Hapus data kategori berdasarkan ID
    public function delete($id)
    {
        return $this->db->delete($this->_table, [$this->primary => $id]);
    }
}
