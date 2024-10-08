<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Surat extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('m_layanan');
        $this->load->library('Pdf'); // MEMANGGIL LIBRARY YANG KITA BUAT TADI
        $this->load->library('Qrcodes'); // MEMANGGIL LIBRARY YANG KITA BUAT TADI        
    }
    public function domisili($id)
    {
        $surat = $this->m_layanan->surat_get_id($id);
        $penduduk = $this->m_layanan->get_get_nik($surat['nik']);
        if ($surat['status'] == 3) {
            $link = "https://jayawaras.id/layanan/validsurat/" . md5($surat['id']);
            $fileName = 'qr_' . md5($surat['id']) . '.png';
            $pngAbsoluteFilePath = 'assets/img/qrimg/' . $fileName;
            $urlRelativeFilePath = $link . $fileName;
            if (!file_exists($pngAbsoluteFilePath)) {
                QRcode::png($link, $pngAbsoluteFilePath);
            }
        }
        $pdf = new FPDF('P', 'mm', array(210, 330));
        $pdf->SetTitle('Surat Keterangan Domisili ' . $surat['nama']);
        $pdf->AddPage();
        $pdf->Image(base_url() . 'assets/img/kop.png', 12, 10, 185);
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetFont('');
        $pdf->Ln(3);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, 'PEMERINTAH KABUPATEN GARUT', 0, 2, 'C');
        $pdf->Ln(4);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 16);
        $pdf->Cell(185, 2, 'KECAMATAN TAROGONG KIDUL', 0, 1, 'C');
        $pdf->Ln(5);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', 'B', 18);
        $pdf->Cell(185, 2, 'KELURAHAN JAYAWARAS', 0, 1, 'C');
        $pdf->Ln(6);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetFont('');
        $pdf->Cell(185, 2, 'Jalan Gordah No.40 Kode Pos 44151', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(180, 2, '', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, '', 0, 1, 'C');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'BU', 12);
        $pdf->Ln(8);
        $pdf->Cell(185, 2, 'SURAT KETERANGAN DOMISILI', 0, 1, 'C');
        $pdf->SetFont('Arial', '', 12);
        $pdf->Ln(3);
        $pdf->Cell(185, 2, 'Nomor:474 / ' . $surat['nosurat'] . ' - KEL/XI/2022', 0, 1, 'C');
        $pdf->Ln(10);
        $pdf->Cell(12);
        $pdf->SetFont('Arial', '', 12);
        $pdf->MultiCell(170, 7, '    Yang bertanda tangan di bawah ini Kepala Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut, dengan ini menerangkan bahwa :', 0, 'J', FALSE);
        $pdf->Ln(5);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Nama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['nama'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Jenis Kelamin', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['jenis_kelamin'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tempat/Tanggal Lahir', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['tempat_lahir'] . ', ' . date('d F Y', strtotime($penduduk['tanggal_lahir'])), 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Kewarganegaraan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, 'WNI', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Agama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['agama'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Status Perkawinan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['status_perkawinan'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pekerjaan ', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['nama_pekerjaan'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->MultiCell(150, 0, 'Alamat', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->MultiCell(100, 6, $penduduk['alamat_spesifik'], 0, 'L');
        $pdf->Ln(7);
        $pdf->Cell(12);
        $pdf->MultiCell(170, 7, ' Berdasarkan surat pengantar dari Rt/Rw setempat bahwa benar orang tersebut di atas penduduk Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut dan yang bersangkutan di atas saat ini berdomisili di alamat tersebut.', 0, 'J', FALSE);
        $pdf->SetFont('Arial', 'B', '12');
        $pdf->SetFont('');
        $pdf->Ln(2);
        $pdf->Cell(115, 6, '', 0, 0, 'J');
        $pdf->Ln();
        $pdf->Cell(20);
        $pdf->Cell(10, 0, '  Demikian Surat keterangan ini dibuat untuk dipergunakan sebagaimana mestinya', 0, 'J', FALSE);
        $pdf->Ln(12);
        $pdf->Cell(115);
        $pdf->Cell(10, 6, 'Garut, ' . date('d F Y', strtotime($surat['tgl_pengambilan'])), 0, 0, 'L');
        $pdf->Ln();
        $pdf->Cell(115, 6, '', 0, 0, 'C');
        $pdf->Cell(10, 6, 'Kepala Kelurahan Jayawaras,', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Ln(29);
        $pdf->SetFont('Arial', 'BU', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, 'AGUS KUSNADI, SE.', 0, 0, 'L');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'B', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, 'NIP. 19780828 201001 1 019', 0, 0, 'L');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        if ($surat['status'] == 3) {
            $pdf->Image($pngAbsoluteFilePath, 124, 198, 30);
            unlink($pngAbsoluteFilePath);
        }
        $pdf->SetMargins(3, 3, 3);
        $pdf->Output();
    }
    public function usaha($id)
    {
        $surat = $this->m_layanan->surat_get_id($id);
        $penduduk = $this->m_layanan->get_get_nik($surat['nik']);
        if ($surat['status'] == 3) {
            $link = "https://jayawaras.id/layanan/validsurat/" . md5($surat['id']);
            $fileName = 'qr_' . md5($surat['id']) . '.png';
            $pngAbsoluteFilePath = 'assets/img/qrimg/' . $fileName;
            $urlRelativeFilePath = $link . $fileName;
            if (!file_exists($pngAbsoluteFilePath)) {
                QRcode::png($link, $pngAbsoluteFilePath);
            }
        }
        $pdf = new FPDF('P', 'mm', array(210, 330));
        $pdf->SetTitle('Surat Keterangan Usaha ' . $surat['nama']);
        $pdf->AddPage();
        $pdf->Image(base_url() . 'assets/img/kop.png', 12, 10, 185);
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetFont('');
        $pdf->Ln(3);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, 'PEMERINTAH KABUPATEN GARUT', 0, 2, 'C');
        $pdf->Ln(4);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 16);
        $pdf->Cell(185, 2, 'KECAMATAN TAROGONG KIDUL', 0, 1, 'C');
        $pdf->Ln(5);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', 'B', 18);
        $pdf->Cell(185, 2, 'KELURAHAN JAYAWARAS', 0, 1, 'C');
        $pdf->Ln(6);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetFont('');
        $pdf->Cell(185, 2, 'Jalan Gordah No.40 Kode Pos 44151', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(180, 2, '', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, '', 0, 1, 'C');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'BU', 12);
        $pdf->Ln(8);
        $pdf->Cell(185, 2, 'SURAT KETERANGAN USAHA', 0, 1, 'C');
        $pdf->SetFont('Arial', '', 12);
        $pdf->Ln(3);
        $pdf->Cell(185, 2, 'Nomor:511 / ' . $surat['nosurat'] . ' - KEL/VIII/2022', 0, 1, 'C');
        $pdf->Ln(10);
        $pdf->Cell(12);
        $pdf->SetFont('Arial', '', 12);
        $pdf->MultiCell(170, 7, '     Yang bertanda tangan di bawah ini Kepala Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut, dengan ini menerangkan bahwa :', 0, 'J', FALSE);
        $pdf->Ln(5);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Nama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['nama'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Jenis Kelamin', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['jenis_kelamin'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tempat/Tanggal Lahir', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['tempat_lahir'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Kewarganegaraan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Agama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['agama'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Status Perkawinan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['status_perkawinan'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pekerjaan ', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, $penduduk['nama_pekerjaan'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Alamat', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(102);
        $pdf->Cell(10, 0,  $penduduk['alamat_spesifik'], 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(12);
        $pdf->MultiCell(170, 7, '       Adalah benar Orang tersebut diatas penduduk Kelurahan Jayawaras Kecamatan tarogong kidul Kabupaten Garut,dan benar Orang tersebut mempunyai usaha ..........', 0, 'J', FALSE);
        $pdf->SetFont('Arial', 'B', '12');
        $pdf->SetFont('');
        $pdf->Ln(2);
        $pdf->Cell(115, 6, '', 0, 0, 'J');
        $pdf->Ln();
        $pdf->Cell(20);
        $pdf->Cell(10, 0, '  Surat keterangan ini diberikan untuk melengkapi persyaratan Administrasi.', 0, 1);
        $pdf->Ln(12);
        $pdf->MultiCell(170, 7, '          Demikian Surat Keterangan ini saya buat dengan sesungguhnya dan untuk dapat dipergunakan sebagaimana mestinya', 0, 'J', FALSE);
        $pdf->SetFont('Arial', 'B', '12');
        $pdf->SetFont('');
        $pdf->Ln(2);
        $pdf->Cell(115);
        $pdf->Cell(10, 6, 'Garut, ', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Cell(115, 6, '', 0, 0, 'C');
        $pdf->Cell(10, 6, 'Kepala Kelurahan Jayawaras,', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Ln(29);
        $pdf->SetFont('Arial', 'BU', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, 'AGUS KUSNADI, SE.', 0, 0, 'L');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'B', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, 'NIP. 19780828 201001 1 019', 0, 0, 'L');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        if ($surat['status'] == 3) {
            $pdf->Image($pngAbsoluteFilePath, 124, 198, 30);
            unlink($pngAbsoluteFilePath);
        }

        $pdf->SetMargins(3, 3, 3);
        $pdf->Output();
    }
    public function skkb()
    {
        $pdf = new FPDF('P', 'mm', array(210, 330));
        $pdf->SetTitle('Berita Acara PTS ');
        $pdf->AddPage();
        $pdf->Image(base_url() . 'assets/img/kop.png', 12, 10, 185);
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetFont('');
        $pdf->Ln(3);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, 'PEMERINTAH KABUPATEN GARUT', 0, 2, 'C');
        $pdf->Ln(4);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 16);
        $pdf->Cell(185, 2, 'KECAMATAN TAROGONG KIDUL', 0, 1, 'C');
        $pdf->Ln(5);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', 'B', 18);
        $pdf->Cell(185, 2, 'KELURAHAN JAYAWARAS', 0, 1, 'C');
        $pdf->Ln(6);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetFont('');
        $pdf->Cell(185, 2, 'Jalan Gordah No.40 Kode Pos 44151', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(180, 2, '', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, '', 0, 1, 'C');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'BU', 12);
        $pdf->Ln(8);
        $pdf->Cell(185, 2, 'SURAT KETERANGAN KELAKUAN BAIK', 0, 1, 'C');
        $pdf->SetFont('Arial', '', 12);
        $pdf->Ln(3);
        $pdf->Cell(185, 2, 'Nomor:474 /         -KEL/XI/2022', 0, 1, 'C');
        $pdf->Ln(10);
        $pdf->Cell(12);
        $pdf->SetFont('Arial', '', 12);
        $pdf->MultiCell(170, 7, '     Yang bertanda tangan di bawah ini Kepala Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut, dengan ini menerangkan bahwa :', 0, 'J', FALSE);
        $pdf->Ln(5);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Nama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Jenis Kelamin', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tempat/Tanggal Lahir', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Kewarganegaraan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Agama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Status Perkawinan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pekerjaan ', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Alamat', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(12);
        $pdf->Cell(10, 0, '       NIK', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(12);
        $pdf->MultiCell(170, 7, '       Adalah benar Penduduk Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut,dan benar  Orang tersebut diatas sampai saat ini berkelakuan baik serta tidak pernah atau sedang berurusan dengan pihak berwajib.', 0, 'J', FALSE);
        $pdf->SetFont('Arial', 'B', '12');
        $pdf->SetFont('');
        $pdf->Ln(2);
        $pdf->Cell(115, 6, '', 0, 0, 'J');
        $pdf->Ln();
        $pdf->Cell(20);
        $pdf->Cell(10, 0, '        Surat keterangan ini diberikan untuk melengkapi persyaratan Administrasi.', 0, 1);
        $pdf->Ln(12);
        $pdf->Cell(12);
        $pdf->MultiCell(170, 7, '             Demikian Surat Keterangan ini saya buat dengan sesungguhnya dan untuk dapat dipergunakan sebagaimana mestinya', 0, 'J', FALSE);
        $pdf->SetFont('Arial', 'B', '12');
        $pdf->SetFont('');
        $pdf->Ln(2);
        $pdf->Cell(115);
        $pdf->Cell(10, 6, 'Garut, ', 0, 0, 'L');
        $pdf->Ln(10);
        $pdf->Cell(115, 6, '', 0, 0, 'C');
        $pdf->Cell(10, 6, 'Kepala Kelurahan Jayawaras,', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Ln(20);
        $pdf->SetFont('Arial', 'BU', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, '', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Cell(115, 5, '', 0, 0, 'C');


        $pdf->SetMargins(3, 3, 3);
        $pdf->Output();
    }
    public function sktm()
    {
        $pdf = new FPDF('P', 'mm', array(210, 330));
        $pdf->SetTitle('Berita Acara PTS ');
        $pdf->AddPage();
        $pdf->Image(base_url() . 'assets/img/kop.png', 12, 10, 185);
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetFont('');
        $pdf->Ln(3);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, 'PEMERINTAH KABUPATEN GARUT', 0, 2, 'C');
        $pdf->Ln(4);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 16);
        $pdf->Cell(185, 2, 'KECAMATAN TAROGONG KIDUL', 0, 1, 'C');
        $pdf->Ln(5);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', 'B', 18);
        $pdf->Cell(185, 2, 'KELURAHAN JAYAWARAS', 0, 1, 'C');
        $pdf->Ln(6);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetFont('');
        $pdf->Cell(185, 2, 'Jalan Gordah No.40 Kode Pos 44151', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(180, 2, '', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, '', 0, 1, 'C');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'BU', 12);
        $pdf->Ln(8);
        $pdf->Cell(185, 2, 'SURAT KETERANGAN TIDAK MAMPU', 0, 1, 'C');
        $pdf->SetFont('Arial', '', 12);
        $pdf->Ln(3);
        $pdf->Cell(185, 2, 'Nomor:474 /         -KEL/XI/2022', 0, 1, 'C');
        $pdf->Ln(10);
        $pdf->Cell(12);
        $pdf->SetFont('Arial', '', 12);
        $pdf->MultiCell(170, 7, '    Yang bertanda tangan di bawah ini Kepala Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut, dengan ini menerangkan bahwa :', 0, 'J', FALSE);
        $pdf->Ln(5);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Nama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Jenis Kelamin', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tempat/Tanggal Lahir', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Kewarganegaraan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Agama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Status Perkawinan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pekerjaan ', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Alamat', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(12);
        $pdf->MultiCell(170, 7, '       Berdasarkan surat pengantar dari Rt/Rw setempat bahwa benar orang tersebut di atas penduduk Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut dan benar berasa dari Keluarga Tidak Mampuh.', 0, 'J', FALSE);
        $pdf->SetFont('Arial', 'B', '12');
        $pdf->SetFont('');
        $pdf->Ln(2);
        $pdf->Cell(115, 6, '', 0, 0, 'J');
        $pdf->Ln();
        $pdf->Cell(20);
        $pdf->Cell(10, 0, '  Demikian Surat keterangan ini dibuat untuk dipergunakan sebagaimana mestinya', 0, 1);
        $pdf->Ln(12);
        $pdf->Cell(115);

        $pdf->Cell(10, 6, 'Garut, ', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Cell(115, 6, '', 0, 0, 'C');
        $pdf->Cell(10, 6, 'Kepala Kelurahan Jayawaras,', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Ln(20);
        $pdf->SetFont('Arial', 'BU', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, '', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->SetMargins(3, 3, 3);
        $pdf->Output();
    }
    public function kelahiran()
    {
        $pdf = new FPDF('P', 'mm', array(210, 330));

        $pdf->SetTitle('SURAT KELAHIRAN ');
        $pdf->AddPage();
        $pdf->Image(base_url() . 'assets/img/kop.png', 12, 10, 185);
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetFont('');
        $pdf->Ln(3);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, 'PEMERINTAH KABUPATEN GARUT', 0, 2, 'C');
        $pdf->Ln(4);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 16);
        $pdf->Cell(185, 2, 'KECAMATAN TAROGONG KIDUL', 0, 1, 'C');
        $pdf->Ln(5);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', 'B', 18);
        $pdf->Cell(185, 2, 'KELURAHAN JAYAWARAS', 0, 1, 'C');
        $pdf->Ln(6);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetFont('');
        $pdf->Cell(185, 2, 'Jalan Gordah No.40 Kode Pos 44151', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(180, 2, '', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, '', 0, 1, 'C');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'BU', 12);
        $pdf->Ln(8);
        $pdf->Cell(185, 2, 'SURAT KETERANGAN KELAHIRAN', 0, 1, 'C');
        $pdf->SetFont('Arial', '', 12);
        $pdf->Ln(3);
        $pdf->Cell(185, 2, 'Nomor:474.3 /         -KEL/X/2022', 0, 1, 'C');
        $pdf->Ln(10);
        $pdf->Cell(12);
        $pdf->SetFont('Arial', '', 12);
        $pdf->MultiCell(170, 7, '    Yang bertanda tangan di bawah ini Kepala Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut, dengan ini menerangkan bahwa :', 0, 'J', FALSE);
        $pdf->Ln(5);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'hari', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tanggal', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pukul', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Di', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Telah Lahir Seorang anak ke', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(15);
        $pdf->Cell(10, 0, '    Jenis Kelamin', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(20);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Dari seorang ibu bernama ', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(15);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tempat Tanggal lahir', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(15);
        $pdf->Cell(10, 0, '    Agama', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pekerjaan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Istri dari', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(20);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tempat Tanggal lahir', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pekerjaan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Alamat', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(20);
        $pdf->Cell(115, 6, '', 0, 0, 'J');
        $pdf->Ln();
        $pdf->Cell(20);
        $pdf->Cell(10, 0, '  Demikian Surat keterangan ini dibuat untuk dipergunakan sebagaimana mestinya', 0, 1);
        $pdf->Ln(12);
        $pdf->Cell(115);

        $pdf->Cell(10, 6, 'Garut, ', 0, 0, 'L');
        $pdf->Ln(10);
        $pdf->Cell(115, 6, '', 0, 0, 'C');
        $pdf->Cell(10, 6, 'Kepala Kelurahan Jayawaras,', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Ln(20);
        $pdf->SetFont('Arial', 'BU', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, '', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Cell(115, 5, '', 0, 0, 'C');


        $pdf->SetMargins(3, 3, 3);

        $pdf->Output();
    }
    public function kematian()
    {
        $pdf = new FPDF('P', 'mm', array(210, 330));

        $pdf->SetTitle('SURAT KEMATIAN ');
        $pdf->AddPage();
        $pdf->Image(base_url() . 'assets/img/kop.png', 12, 10, 185);
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetFont('');
        $pdf->Ln(3);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, 'PEMERINTAH KABUPATEN GARUT', 0, 2, 'C');
        $pdf->Ln(4);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 16);
        $pdf->Cell(185, 2, 'KECAMATAN TAROGONG KIDUL', 0, 1, 'C');
        $pdf->Ln(5);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', 'B', 18);
        $pdf->Cell(185, 2, 'KELURAHAN JAYAWARAS', 0, 1, 'C');
        $pdf->Ln(6);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetFont('');
        $pdf->Cell(185, 2, 'Jalan Gordah No.40 Kode Pos 44151', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(180, 2, '', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, '', 0, 1, 'C');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'BU', 12);
        $pdf->Ln(8);
        $pdf->Cell(185, 2, 'SURAT KETERANGAN KEMATIAN', 0, 1, 'C');
        $pdf->SetFont('Arial', '', 12);
        $pdf->Ln(3);
        $pdf->Cell(185, 2, 'Nomor:474.3 /         -KEL/X/2022', 0, 1, 'C');
        $pdf->Ln(15);
        $pdf->Cell(12);
        $pdf->SetFont('Arial', '', 12);
        $pdf->MultiCell(170, 7, '        Yang bertanda tangan di bawah ini Kepala Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut, dengan ini menerangkan bahwa :', 0, 'J', FALSE);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tempat Tanggal lahir', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pekerjaan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Alamat', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0,  '', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(15);
        $pdf->Cell(10, 0, '    Hari', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tanggal ', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(15);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Di', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(15);
        $pdf->Cell(10, 0, '    Di Sebabkan                                                :', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(15);
        $pdf->Cell(15);
        $pdf->Cell(10, 0, '         Demikian Surat keterangan ini dibuat dan dapat dipergunakan sebagai mana mestinya', 0, 1);
        $pdf->Ln(12);
        $pdf->Cell(115);

        $pdf->Cell(10, 6, 'Garut, ', 0, 0, 'L');
        $pdf->Ln(10);
        $pdf->Cell(115, 6, '', 0, 0, 'C');
        $pdf->Cell(10, 6, 'Kepala Kelurahan Jayawaras,', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Ln(7);
        $pdf->SetFont('Arial', 'BU', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, '', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Cell(115, 5, '', 0, 0, 'C');


        $pdf->SetMargins(3, 3, 3);

        $pdf->Output();
    }
    public function menikah()
    {
        $pdf = new FPDF('P', 'mm', array(210, 330));

        $pdf->SetTitle('SURAT MENIKAH ');
        $pdf->AddPage();
        $pdf->Image(base_url() . 'assets/img/kop.png', 12, 10, 185);
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetFont('');
        $pdf->Ln(3);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, 'PEMERINTAH KABUPATEN GARUT', 0, 2, 'C');
        $pdf->Ln(4);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 16);
        $pdf->Cell(185, 2, 'KECAMATAN TAROGONG KIDUL', 0, 1, 'C');
        $pdf->Ln(5);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', 'B', 18);
        $pdf->Cell(185, 2, 'KELURAHAN JAYAWARAS', 0, 1, 'C');
        $pdf->Ln(6);
        $pdf->Cell(19);
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetFont('');
        $pdf->Cell(185, 2, 'Jalan Gordah No.40 Kode Pos 44151', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(180, 2, '', 0, 1, 'C');
        $pdf->Ln(2);
        $pdf->Cell(19);
        $pdf->Cell(185, 2, '', 0, 1, 'C');
        $pdf->Ln();
        $pdf->SetFont('Arial', 'BU', 12);
        $pdf->Ln(8);
        $pdf->Cell(185, 2, 'SURAT KETERANGAN MENIKAH', 0, 1, 'C');
        $pdf->SetFont('Arial', '', 12);
        $pdf->Ln(3);
        $pdf->Cell(185, 2, 'Nomor:474.3 /         -KEL/X/2022', 0, 1, 'C');
        $pdf->Ln(15);
        $pdf->Cell(12);
        $pdf->SetFont('Arial', '', 12);
        $pdf->MultiCell(170, 7, '        Yang bertanda tangan di bawah ini Kepala Kelurahan Jayawaras Kecamatan Tarogong Kidul Kabupaten Garut, dengan ini menerangkan bahwa :', 0, 'J', FALSE);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tempat Tanggal lahir', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Pekerjaan', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Alamat', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0,  '', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(15);
        $pdf->Cell(10, 0, '    Hari', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(7);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Tanggal ', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Cell(10, 0, ' ', 0, 1);
        $pdf->Ln(15);
        $pdf->Cell(20);
        $pdf->Cell(10, 0, 'Di', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, ':', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(7);
        $pdf->Cell(15);
        $pdf->Cell(10, 0, '    Di Sebabkan                                                :', 0, 1);
        $pdf->Cell(100);
        $pdf->Cell(10, 0, '', 0, 1);
        $pdf->Cell(102);
        $pdf->Ln(15);
        $pdf->Cell(15);
        $pdf->Cell(10, 0, '         Demikian Surat keterangan ini dibuat dan dapat dipergunakan sebagai mana mestinya', 0, 1);
        $pdf->Ln(12);
        $pdf->Cell(115);

        $pdf->Cell(10, 6, 'Garut, ', 0, 0, 'L');
        $pdf->Ln(10);
        $pdf->Cell(115, 6, '', 0, 0, 'C');
        $pdf->Cell(10, 6, 'Kepala Kelurahan Jayawaras,', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Ln(7);
        $pdf->SetFont('Arial', 'BU', '12');
        $pdf->Cell(115, 5, '', 0, 0, 'C');
        $pdf->Cell(10, 5, '', 0, 0, 'L');
        $pdf->Ln();
        $pdf->Cell(115, 5, '', 0, 0, 'C');


        $pdf->SetMargins(3, 3, 3);

        $pdf->Output();
    }
}
