<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Motivasi extends REST_Controller
{

    function __construct($config = 'rest')
    {
        parent::__construct($config);
    }


    public function index_get()
    {
        $id = $this->get('id');
        if ($id == '') {
            $result = $this->db->get('motivasi')->result();
        } else {
            $result = $this->db->get_where('motivasi', ['id' => $id])->result();
        }
        $this->response($result, 400);
    }



    public function index_post()
    {
        $data = [
            'isi_motivasi' => $this->post('isi_motivasi'),
            'iduser' => $this->post('iduser'),
            'tanggal_input' => date("Y-m-d", time()),
            'tanggal_update' => "0000-00-00",
        ];
        $insert = $this->db->insert('motviasi', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(['status' => 'fail'], 502);
        }
    }



    public function index_put()
    {
        $id = $this->put('id');
        $data = [
            'isi_motivasi' => $this->post('isi_motivasi'),
            'iduser' => $this->post('iduser'),
            'tanggal_update' => date("Y-m-d", time()),
        ];
        $update = $this->db->update('motivasi', $data, ['id' => $id]);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(['status' => 'failed'], 502);
        }
    }
    public function index_delete()
    {
        $id = $this->delete('id');
        $delete = $this->db->delete('motivasi', ['id' => $id]);
        if ($delete) {
            $this->response(['status' => 'Success'], 200);
        } else {
            $this->response(['status' => 'failed'], 502);
        }
    }
}
