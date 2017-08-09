package chap09_model;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GuestBoardDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(GuestBoardDAOTest.class);

	@Test
	public void showTest() {
		GuestBoardDAO gbd = new GuestBoardDAO();
		List<GuestBoard> list = gbd.showGuestBoard();
		
		for(GuestBoard g : list)
			logger.debug(g.getName() + " " + g.getEmail());
	}
}
