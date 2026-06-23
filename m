Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C973F3D7A03;
	Tue, 23 Jun 2026 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228118; cv=none; b=TY3CTrtj+yuFZp9SbVWj5/FQrP1Xv0AYRaoMUP+stIjm7aq7OEIfVHE8SoBuAzGY6L0jcZKKMP9PylwUnovs442uoDsxwCwhUDBbMiXNTWatBUlUHrRDyVWxujhN3rb8e5O7zDIcSbHJ/miE0phHuAXtfYxeqBOzNz8golzgwSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228118; c=relaxed/simple;
	bh=wR1ijruuFUmexFYwfRWVW0MH5FeyF19PV2rRuS214nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q145pJ5nlxn/eZ81dD87jLg/ZOtvrqB85Zc8ue9RMiphJEja/93D7t1z01QenvZ33OLZQoKJjDKTy+Vrtg7iVK13Wp7XL86YuID85FyrkhnLiZgdJeL/8IDsuZYNhXcIZF4SjN/NoZXs+1RlXqFywQe8KmlSH6jAx8TAON029nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/jH7FQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/jH7FQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9567A1F00A3D;
	Tue, 23 Jun 2026 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782228117;
	bh=7IKYDk+7+MvzCWkFJHHBjJ/iK3lCwKGH+wa6xGRNftc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e/jH7FQMrCXC80SIkSlZhcuC5EU9tamEKZD+72nnoqSxWzt4lMoBtOcsel1qb5gBE
	 J9agsOp3zFMXf0WLbAFM++TwX1+HJKQScwZZU9A+kTgg9FYf8uGLCPwjMWUGX1L1vG
	 OjPNW1aV5ri9/1TE/HZfs3RC5F5qNUdnh25M4eu8gaFAx3sfWiO3yXMqe/P+n0+zBo
	 Cuj5yQs+Io8oQ8SPd4e3l0kwJHaWP95ZYmHehf/HzP0yeB2Nda2BJPJovJsBqjvYkY
	 eMfz7S32ZXv+SCkcNun3cECR/2+zIhk0H18U/HLg1VQcFvBnAOPIIG/lfYUQoTK/86
	 seL39WFTa0Ohg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2wl-00000001KFf-0QER;
	Tue, 23 Jun 2026 17:21:55 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] USB: serial: metro-usb: drop redundant initialisations
Date: Tue, 23 Jun 2026 17:21:48 +0200
Message-ID: <20260623152148.316149-4-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623152148.316149-1-johan@kernel.org>
References: <20260623152148.316149-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three functions are initialising their return value variables at
declaration only to later assign them unconditionally.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/metro-usb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/metro-usb.c b/drivers/usb/serial/metro-usb.c
index 8458713277f4..22c5f071f116 100644
--- a/drivers/usb/serial/metro-usb.c
+++ b/drivers/usb/serial/metro-usb.c
@@ -109,7 +109,7 @@ static void metrousb_read_int_callback(struct urb *urb)
 	unsigned char *data = urb->transfer_buffer;
 	unsigned long flags;
 	int throttled = 0;
-	int result = 0;
+	int result;
 
 	dev_dbg(&port->dev, "%s\n", __func__);
 
@@ -173,7 +173,7 @@ static int metrousb_open(struct tty_struct *tty, struct usb_serial_port *port)
 	struct usb_serial *serial = port->serial;
 	struct metrousb_private *metro_priv = usb_get_serial_port_data(port);
 	unsigned long flags;
-	int result = 0;
+	int result;
 
 	/* Set the private data information for the port. */
 	spin_lock_irqsave(&metro_priv->lock, flags);
@@ -327,7 +327,7 @@ static void metrousb_unthrottle(struct tty_struct *tty)
 	struct metrousb_private *metro_priv = usb_get_serial_port_data(port);
 	unsigned long flags;
 	int throttled;
-	int result = 0;
+	int result;
 
 	/* Set the private information for the port to resume reading data. */
 	spin_lock_irqsave(&metro_priv->lock, flags);
-- 
2.53.0

