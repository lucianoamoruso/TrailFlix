package trailFlix.flix_ui;

import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.WindowOwner;
import trailFlix.flix.appModel.AdminMovie;

@SuppressWarnings("all")
public class AdminMovieWindow extends TransactionalDialog<AdminMovie> {
  public AdminMovieWindow(final WindowOwner owner, final AdminMovie model) {
    super(owner, model);
    this.setTitle("Cree una nueva película");
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    throw new Error("Unresolved compilation problems:"
      + "\nInvalid number of arguments. The constructor AdminContent(TrailFlix) is not applicable for the arguments (TrailFlix,AdminMovieWindow)");
  }
}
