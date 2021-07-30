// Find the latest version by visiting https://cdn.skypack.dev/three.
import * as THREE from 'https://cdn.skypack.dev/pin/three@v0.130.0-WI96Ec9p8dZb5AMcOcgD/mode=imports/optimized/three.js';

import { OrbitControls } from 'https://cdn.skypack.dev/three@0.130.0/examples/jsm/controls/OrbitControls.js';

//표현 공간 기본 셋팅: scene, camera, renderer
var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 0.1, 1000);
//절두체(입체를 절단하는 두 평행면 사이 부분) 설정 (fov: 시야각 카메라 거리에 따라 절두체 높이 계산 적용, aspect:절두체 너비(창 비율 그대로 사용), near: ,far:모형의 끝부분 절두체)
var renderer = new THREE.WebGLRenderer();
//궤도 객체(마우스로 클릭하고 궤도 이동 가능)
var controls = new OrbitControls(camera, renderer.domElement);


//화면 크기 조정시 캔버스크기 리사이징
window.addEventListener('resize', function()
{
  var width = window.innerWidth;
  var height = window.innerHeight;
  renderer.setSize(width, height);
})

//카메라 위치
camera.position.setZ(25);
camera.position.setX(-55);
camera.position.setY(10);
document.body.appendChild(renderer.domElement);

//렌더링 설정
renderer.setSize(window.innerWidth, window.innerHeight-120); //출력 크기 설정
renderer.setPixelRatio(window.devicePixelRatio); //출력 화질 설정
renderer.render(scene,camera); //설정한 scene, camera 출력

//sphere
//모형 만들때 꼭짓점 데이터 가진 기하학 객체 geometry + 표면 속성 (색, 밝기)사진 material 객체를 mesh객체를 이용해서 합쳐서 만들어냄
var sphereGeometry = new THREE.SphereGeometry( 2, 40, 40 ); //(반경, 넓이, 높이)
var sphereMaterial = new THREE.MeshBasicMaterial( {color: 0xffffff, wireframe: true} );
var sphereMesh = new THREE.Mesh(sphereGeometry, sphereMaterial);

scene.add(sphereMesh);

//lighting
var frontLight = new THREE.DirectionalLight(0xffffff, 1);
frontLight.position.set(0, 0, 1);
scene.add(frontLight);

//sphere (at center)
function sphereAnimate() {
  requestAnimationFrame(sphereAnimate);
  renderer.render(scene,camera);

  sphereMesh.rotation.x += 0.02;
  sphereMesh.rotation.y += 0.02;

  camera.position.x += 0.01;
  camera.position.z += 0.01;
}
sphereAnimate();

//rings (on the background)
function firstRing() {
  var geometry = new THREE.TorusGeometry(13, 1.5, 10, 80);
  var material = new THREE.MeshBasicMaterial({ color: 0xff00ff, wireframe: true});
  var ring = new THREE.Mesh(geometry, material);

  var [x, y, z] = Array(3)
    .fill()
    .map(() => THREE.MathUtils.randFloatSpread(120));
  ring.position.set(x, y, z);
  scene.add(ring);
}
Array(17).fill().forEach(firstRing);

function secondRing() {
  var geometry = new THREE.TorusGeometry(15, 1.5, 10, 80);
  var material = new THREE.MeshBasicMaterial({ color: 0xffff00, wireframe: true});
  var ring = new THREE.Mesh(geometry, material);

  var [x, y, z] = Array(3)
    .fill()
    .map(() => THREE.MathUtils.randFloatSpread(120));
  ring.position.set(x, y, z);
  scene.add(ring);
}
Array(17).fill().forEach(secondRing);

function thirdRing() {
  var geometry = new THREE.TorusGeometry(17, 1.5, 10, 80);
  var material = new THREE.MeshBasicMaterial({ color: 0x009999, wireframe: true});
  var ring = new THREE.Mesh(geometry, material);

  var [x, y, z] = Array(3)
    .fill()
    .map(() => THREE.MathUtils.randFloatSpread(130));
  ring.position.set(x, y, z);
  scene.add(ring);
}
Array(17).fill().forEach(thirdRing);