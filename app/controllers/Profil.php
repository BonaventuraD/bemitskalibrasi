<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Profil extends CI_Controller
{

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function kabinet()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kabinet');
		$this->load->view('template/footer');
	}

	public function kominrel()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kominrel/kominrel');
		$this->load->view('template/footer');
	}

	public function medsi()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kominrel/medsi');
		$this->load->view('template/footer');
	}

	public function komstrat()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kominrel/komstrat');
		$this->load->view('template/footer');
	}

	public function hublu()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kominrel/hublu');
		$this->load->view('template/footer');
	}

	public function inpus()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/inpus/inpus');
		$this->load->view('template/footer');
	}

	public function psdm()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/inpus/psdm');
		$this->load->view('template/footer');
	}

	public function dagri()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/inpus/dagri');
		$this->load->view('template/footer');
	}

	public function akarinovasi()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/karinov/akarinovasi');
		$this->load->view('template/footer');
	}

	public function sosmas()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/karinov/sosmas');
		$this->load->view('template/footer');
	}

	public function ristek()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/karinov/ristek');
		$this->load->view('template/footer');
	}

	public function ekraf()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/karinov/ekraf');
		$this->load->view('template/footer');
	}

	public function kemahasiswaan()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kemahasiswaan/kemahasiswaan');
		$this->load->view('template/footer');
	}

	public function jakpus()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kemahasiswaan/jakpus');
		$this->load->view('template/footer');
	}

	public function eksodus()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kemahasiswaan/eksodus');
		$this->load->view('template/footer');
	}

	public function adkesma()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/kemahasiswaan/adkesma');
		$this->load->view('template/footer');
	}

	public function gersospol()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/gersospol/gersospol');
		$this->load->view('template/footer');
	}
	public function kp()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/gersospol/kp');
		$this->load->view('template/footer');
	}
	public function diskoan()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/gersospol/diskoan');
		$this->load->view('template/footer');
	}
	public function akspro()
	{
		$this->load->view('template/header');
		$this->load->view('template/profil/gersospol/akspro');
		$this->load->view('template/footer');
	}
}
