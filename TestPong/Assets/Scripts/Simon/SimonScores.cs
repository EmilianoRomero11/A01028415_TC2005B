/* Script to keep track of the highest score and display it

Emiliano Romero
2024-03-13
*/
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class SimonScores : MonoBehaviour
{
    [SerializeField] TMP_Text scoreText;
    // Start is called before the first frame update
    void Start()
    {
        int score = PlayerPrefs.GetInt("score", 0);
        scoreText.text = "Score: " + score;
    }
}

