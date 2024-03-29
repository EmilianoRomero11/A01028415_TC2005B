/*
Script to control the actions of buttons

Emiliano Romero

2024 - 03 - 06
*/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class SimonButton : MonoBehaviour
{
    Color originalColor;
    AudioSource audioSource;

    void Start(){
        audioSource = GetComponent<AudioSource>();
        originalColor = GetComponent<Image>().color;
    }
   public void HighLight(){
    audioSource.Play();
    StartCoroutine(ChangeColor());

   }

   IEnumerator ChangeColor(){
    GetComponent<Image>().color = Color.white; 
    yield return new WaitForSeconds(0.5f);
    GetComponent<Image>().color = originalColor;
   }
}
