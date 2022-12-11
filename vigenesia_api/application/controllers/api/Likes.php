<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Likes extends REST_Controller
{

  function __construct($config = 'rest')
  {
    parent::__construct($config);
    $this->load->database();
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method == "OPTIONS") {
      die();
    }
  }

  function index_get()
  {
    $id_motivasi = $this->get('id_motivasi');
    $id_user = $this->get('id_user');

    if (!empty($id_motivasi) && !empty($id_user)) {
      $where = ['id_motivasi' => $id_motivasi, 'id_user' => $id_user];
      $this->db->where($where);
      $get = $this->db->get('likes')->row_array();
      if ($get) {
        $this->response($get, 200);
      }
    } else {
      $this->response("Id Kosong.", REST_Controller::HTTP_BAD_REQUEST);
    }
  }

  function index_put()
  {
    $id_motivasi = $this->put('id_motivasi');
    $id_user = $this->put('id_user');

    // Validate the post data
    if (!empty($id_motivasi) && !empty($id_user)) {
      $likes = 0;
      $cek_motivasi = $this->db->get_where('likes', ['id_motivasi' => $id_motivasi])->row_array();
      if ($cek_motivasi) {
        $cek_user = $this->db->get_where('likes', ['id_user' => $id_user])->row_array();
        if ($cek_user) {
          $where = ['id' => $id_motivasi, 'iduser' => $id_user];
          $cekUserMotivasi = $this->db->get_where('likes', ['id_motivasi' => $id_motivasi, 'id_user' => $id_user])->row_array();
          if ($cekUserMotivasi) {
            $motivasi = $this->db->get_where('motivasi', $where)->row_array();
            if($motivasi) {
              $likes = $motivasi['likes'] - 1;
              $where = ['id_motivasi' => $id_motivasi, 'id_user' => $id_user];
              $delete = $this->db->delete('likes', ['id_motivasi' => $id_motivasi, 'id_user' => $id_user]);
              $update = $this->db->update('motivasi', ['likes' => $likes], ['id' => $id_motivasi]);
              if ($delete && $update) {
                $this->response(
                  [
                    'status' => TRUE,
                    'message' => 'unliked.'
                  ],
                  REST_Controller::HTTP_OK
                );
              }
            } else {
              // return $this->response(['user_motivasi' => $cekUserMotivasi, 'motviasi' => $motivasiku, 'id_motivasi' => $id_motivasi ]);
              if ($cekUserMotivasi) {
                $motivasi = $this->db->get_where('motivasi', ['id' => $id_motivasi])->row_array();
                $likes = $motivasi['likes'] - 1;
                $delete = $this->db->delete('likes', ['id_motivasi' => $id_motivasi, 'id_user' => $id_user]);
                $update = $this->db->update('motivasi', ['likes' => $likes], ['id' => $id_motivasi]);
                if ($delete && $update) {
                  $this->response(
                    [
                      'status' => TRUE,
                      'message' => 'unliked.'
                    ],
                    REST_Controller::HTTP_OK
                  );
                }  
              } else {
                $motivasi = $this->db->get_where('motivasi', ['id' => $id_motivasi])->row_array();
                $likes = $motivasi['likes'] + 1;
                $delete = $this->db->delete('likes', ['id_motivasi' => $id_motivasi, 'id_user' => $id_user]);
                $update = $this->db->update('motivasi', ['likes' => $likes], ['id' => $id_motivasi]);
                if ($delete && $update) {
                  $this->response(
                    [
                      'status' => TRUE,
                      'message' => 'liked.'
                    ],
                    REST_Controller::HTTP_OK
                  );
                }
              }
            }
          } else {
            $motivasi = $this->db->get_where('motivasi', ['id' => $id_motivasi])->row_array();
            $likes = $motivasi['likes'] + 1;
            $data = [
              'id_motivasi' => $id_motivasi,
              'id_user'     => $id_user,
              'likes'       => 1
            ];
            $insert = $this->db->insert('likes', $data);
            $update = $this->db->update('motivasi', ['likes' => $likes], ['id' => $id_motivasi]);
            if ($insert && $update) {
              $this->response([
                'status' => TRUE,
                'message' => 'liked.'
              ], REST_Controller::HTTP_OK);
            }
          }
        } else {
          $motivasi = $this->db->get_where('motivasi', ['id' => $id_motivasi])->row_array();
          $likes = $motivasi['likes'] + 1;
          $data = [
            'id_motivasi' => $id_motivasi,
            'id_user'     => $id_user,
            'likes'       => 1
          ];
          $insert = $this->db->insert('likes', $data);
          $update = $this->db->update('motivasi', ['likes' => $likes], ['id' => $id_motivasi]);
          if ($insert && $update) {
            $this->response([
              'status' => TRUE,
              'message' => 'liked.'
            ], REST_Controller::HTTP_OK);
          }
        }
      } else {
        $data = [
          'id_motivasi' => $id_motivasi,
          'id_user'     => $id_user,
          'likes'       => 1
        ];
        $insert = $this->db->insert('likes', $data);
        $update = $this->db->update('motivasi', ['likes' => $data['likes']], ['id' => $id_motivasi]);
        if ($insert && $update) {
          $this->response([
            'status' => TRUE,
            'message' => 'liked.'
          ], REST_Controller::HTTP_OK);
        }
      }
    } else {
      // Set the response and exit
      $this->response("Id Kosong.", REST_Controller::HTTP_BAD_REQUEST);
    }
  }
}
