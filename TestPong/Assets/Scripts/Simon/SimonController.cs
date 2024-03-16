/*
Script to generate the sequence of buttons to show and compare them with user inputs

Emiliano Romero
2024-03-06
*/

using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using TMPro;
using UnityEngine.UIElements;

public class SimonController : MonoBehaviour
{
    [SerializeField] List<int> sequence; //Serialized field solo deja que unity vea la lista, en lugar de hacerla public y que otra clase pueda modificarla
    [SerializeField] GameObject[] buttons;
    // Start is called before the first frame update

    bool playerTurn = false;
    int index;
    int level;
    public TMP_Text currentScore;
    public TMP_Text wildcard;
    void Start()
    {

        NewGame();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void NewGame(){
        sequence = new List<int>();
        index = 0;
        level = 0;
        currentScore.text = "Current score: "+level.ToString();
        AddNumber();
    }

    void AddNumber(){
        playerTurn = false;
        index = 0;
        int num = Random.Range(0, buttons.Length-1);
        sequence.Add(num);
        StartCoroutine(ShowSequence());
    }

    IEnumerator ShowSequence(){
    yield return new WaitForSeconds(1);
    for (int i = 0; i<sequence.Count; i++){
        int num = sequence[i];
         //Call a method on the Button script
        buttons[num].GetComponent<SimonButton>().HighLight();
        yield return new WaitForSeconds(1);
        }
        playerTurn = true;
    }

    public void ButtonSelect(int buttonID){
        if (playerTurn){
            buttons[buttonID].GetComponent<SimonButton>().HighLight();
        if (buttonID == 4){
            Destroy(buttons[buttonID]);
            Destroy(wildcard);
            buttonID = sequence[index];
        }
        if (sequence[index] == buttonID){
            //Continue
            index++;
            //Check if the sequence is complete
            if (index == sequence.Count){
                level++;
                currentScore.text = "Current score: "+level.ToString();
                PlayerPrefs.SetInt("score", level);
                AddNumber();
            }
        }
        else{
            //Game over
            Debug.Log("Game over");
            UnityEngine.SceneManagement.SceneManager.LoadScene("SimonResults");
        }
    }
    }
}
