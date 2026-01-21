Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A43587C4;
	Wed, 21 Jan 2026 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004691; cv=none; b=k7D9ynhvqlLjEQu7ZaQh+WstmIFYIks64eSPT4f/i/KkQBc7mqYX+33ZZFUOpigzEkNjpaSLJwIi/GmlfK1Ie4Y71Jn31zP0SB4R315CGEgTFO0JnhuRPuofPAZtjndOTv5Fy2c5RDgQ+/D7dJLQX3OeqNpAMSOjpuptyowFF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004691; c=relaxed/simple;
	bh=jW77EJdDL6t+ci7yWGFy5IMcOo26zYw0YA+cOJ5lFZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhIjnlgCYZGXyk2/n0P474aRjH0JirleAwiMj7cAE5Weu8Cruy0EuzhBkQHCQFnS3eKIJSwxSsw9L5AZTdgNAdzL7ie24Mn3RGUg7Aj7QwlxCslpKYD7PzEmGxP4ajomHEFrzd1lcsG2OekgakvdbkIWeOG2L2rVpmcudGo9Y0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA0CC4CEF1;
	Wed, 21 Jan 2026 14:11:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] usb: phy: generic: Miscellaneous improvements
Date: Wed, 21 Jan 2026 15:11:19 +0100
Message-ID: <cover.1769004444.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Greg,

This patch series contains a few improvements for the generic USB PHY
driver.  it has been tested on a Renesas Ebisu-4D board with R-Car E3.

Thanks for your comments!

Geert Uytterhoeven (4):
  usb: phy: generic: Always use dev in usb_phy_generic_probe()
  usb: phy: generic: Convert to devm_clk_get_optional()
  usb: phy: generic: Convert to dev_err_probe()
  usb: phy: generic: Convert to device property API

 drivers/usb/phy/phy-generic.c | 74 ++++++++++++-----------------------
 1 file changed, 26 insertions(+), 48 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
