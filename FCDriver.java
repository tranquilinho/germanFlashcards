/*
Flashcard operations
*/
public interface FCDriver{
	public Flashcard getFlashCard();
	public void moveToNextBox(Flashcard fc);
	public void moveToFirstBox(Flashcard fc);
	public void getBoxStatus();
}
