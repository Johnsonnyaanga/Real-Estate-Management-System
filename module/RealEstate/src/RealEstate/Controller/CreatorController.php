<?php

namespace RealEstate\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class CreatorController extends AbstractActionController {

	public function houseAction() {

		$form = new \RealEstate\Form\HouseForm();
		$form->get('submit')->setAttribute('label', 'Add');

		$request = $this->getRequest();
		if ($request->isPost()) {
			$houseFilter = new \RealEstate\Form\Filter\HouseFilter($this->getServiceLocator()->get('db'));

			$form->setInputFilter($houseFilter->getInputFilter());
			$form->setData($request->getPost());

			if ($form->isValid()) {
				$data = $request->getPost();

//				var_dump($data);

				$house = new \RealEstate\Entity\House();
				$houseType = new \RealEstate\Entity\HouseType();

				$houseType->setTitle($data->houseType);
				$this->save($houseType);

				$address = new \RealEstate\Entity\Address();
				$address->setHouse($data->houseNumber);
				$address->setStreet($data->street);
				$address->setVilege($data->village);
				$address->setDistrict($data->district);
				$address->setQuarter($data->quarter);
				$address->setCity($data->city);
				$address->setLatitude($data->latitude);
				$address->setLongitude($data->longitude);
				$this->save($address);

				$size = new \RealEstate\Entity\Size();
				$size->setWidth($data->width);
				$size->setHeight($data->height);
				$size->setLength($data->lenght);
				$this->save($size);
				
				$house->setCost($data->cost);
				$house->setAddress($address);
				$house->setType($houseType);
				$house->setSize($size);
				$house->setAvailable($data->avaialbe);
				$house->setIsRoomRent($data->haveRoomRent);
				$house->setOtherinfo($data->other);
				
				$this->save($house);
				
//				var_dump($house);
				
			}
		}
		return new ViewModel(array(
					'form' => $form
				));
	}

	private function save($entity) {
		$this->getEntityManager()->persist($entity);
		$this->getEntityManager()->flush();
	}

	/**
	 * Entity manager instance
	 *           
	 * @var Doctrine\ORM\EntityManager
	 */
	protected $em;

	/**
	 * Returns an instance of the Doctrine entity manager loaded from the service 
	 * locator
	 * 
	 * @return Doctrine\ORM\EntityManager
	 */
	public function getEntityManager() {
		if (null === $this->em) {
			$this->em = $this->getServiceLocator()
					->get('doctrine.entitymanager.orm_default');
		}
		return $this->em;
	}

}
