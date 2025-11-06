<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kategori_model extends CI_Model
{
    protected $_table = 'kategori';
    protected $primary = 'id';

    public function getAll()
    {
        return $this->db->get($this->_table)->result();
    }

    public function save()
    {
        $data = [
            'name' => htmlspecialchars($this->input->post('name', true))
        ];
        return $this->db->insert($this->_table, $data);
    }

    
}
