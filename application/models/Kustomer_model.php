<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kustomer_model extends CI_Model {

    // Ambil semua data kustomer
    public function get_all()
    {
        return $this->db->get('kustomer')->result();
    }

    // Jika kamu perlu get by id
    public function get_by_id($id)
    {
        return $this->db->get_where('kustomer', ['id' => $id])->row();
    }

}
