Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC78B29D291;
	Sat,  1 Aug 2026 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785589198; cv=none; b=idie9nQTpj1h+QLIPF/wVA28cQd1mV3wWDM16KbiD18ftTW/DXTBzdGlIzMbDjhzhFFrdgzph8evNqGjR8CzuES4i6QZ5QN949+N0leIJcqNamjlcbSSYmVUoUcV2L/4j6yfh+hv/1c73xaLHzilGHwKeK8v19/27CUIYjZs8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785589198; c=relaxed/simple;
	bh=3g2IjhAZ9BHMJxtf1VyTfDZNoroPtQnWS7R0lLMul2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mKJ8utdApFrsw44ZeSvcmEOwU7XIGyznzX2hkQ6lC7/vCiDMw+TLmx9yNK2ZAu/6Sp/FSKGk+q7sSjNrjQANpoTJsToqu1YZPwhxKtbBrtHiokwGS5WW4oAlOOE+9uSDoihBqJ4+HKOIGGK9FaIkAn12ksHCstHHU7paWezYPIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Br2NTVgM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Br2NTVgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A151F00AC4;
	Sat,  1 Aug 2026 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785589196;
	bh=5yc4tIIgzNjrSq8Dx4fiib7TwamkPktIfnpuRQKSFkI=;
	h=From:To:Cc:Subject:Date;
	b=Br2NTVgMRZVEN610yJLjufTPUwZFZ5CaC3v4prF02HgwGu0K1n1QD2cMH/TXcrS8f
	 X6wF1ERrDeDqmHmVCzye6607Rux7L38Nmfd+eNdD1dprsFnj5CAJQ+gpH69VWK8uKj
	 FETuHs8ujV/ViBAxr+fMnxw+ngRy8MovWrDVqfhzxHSdgSYAxqYjyEUOlh3Ute2sYB
	 dEOZtPWJrMSmMaAKuPDOEQdb806ibmgeKkctsZbkWT8ULI+SGRIw+3hWIAZU++490f
	 RkmSi0qUvPeiaVb8F9q0G9rlZTI/K4l3MxrIMd4h+N6QF1hrOvYN4CaWeEPJvIK1ug
	 PsKNgmG1gu2Jw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wq9Jh-00000001EG4-47V5;
	Sat, 01 Aug 2026 14:59:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2051460e19471eeb42c3@syzkaller.appspotmail.com
Subject: [PATCH] USB: serial: digi_acceleport: add port lock nesting annotation
Date: Sat,  1 Aug 2026 14:58:27 +0200
Message-ID: <20260801125827.292983-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver takes the driver port lock of both the OOB port and the port
itself when setting the modem control signals, which confuses lockdep.

Mark the OOB port lock as belonging to a separate subclass to suppress
false positive lockdep deadlock warnings.

Reported-by: syzbot+2051460e19471eeb42c3@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6a6cd832.1aa927e4.17d4bf.0007.GAE@google.com/
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index dea039163661..911d74f20f0e 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -1228,6 +1228,7 @@ static int digi_startup_device(struct usb_serial *serial)
 
 static int digi_port_init(struct usb_serial_port *port, unsigned port_num)
 {
+	struct digi_serial *serial_priv = usb_get_serial_data(port->serial);
 	struct digi_port *priv;
 
 	priv = kzalloc_obj(*priv);
@@ -1235,6 +1236,10 @@ static int digi_port_init(struct usb_serial_port *port, unsigned port_num)
 		return -ENOMEM;
 
 	spin_lock_init(&priv->dp_port_lock);
+
+	if (port == serial_priv->ds_oob_port)
+		lockdep_set_subclass(&priv->dp_port_lock, SINGLE_DEPTH_NESTING);
+
 	priv->dp_port_num = port_num;
 	init_waitqueue_head(&priv->dp_transmit_idle_wait);
 	init_waitqueue_head(&priv->dp_flush_wait);
@@ -1279,6 +1284,8 @@ static int digi_startup(struct usb_serial *serial)
 	serial_priv->ds_oob_port_num = oob_port_num;
 	serial_priv->ds_oob_port = serial->port[oob_port_num];
 
+	usb_set_serial_data(serial, serial_priv);
+
 	ret = digi_port_init(serial_priv->ds_oob_port,
 						serial_priv->ds_oob_port_num);
 	if (ret) {
@@ -1286,8 +1293,6 @@ static int digi_startup(struct usb_serial *serial)
 		return ret;
 	}
 
-	usb_set_serial_data(serial, serial_priv);
-
 	return 0;
 }
 
-- 
2.54.0

