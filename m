Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E73D7A16;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227345; cv=none; b=MVGYfC9ny7q2KAh5SLUSwnr7lhocbd8wVbpJhwWTdk6xIs9bBTXJ2rCNhK5SfN9bJwGCJlSZi6TqG+zQeufx2UKOKG9B8XWOU5tCWB/bDT0mnkH/6cGJUaTCTPEMYwDZ4hVjqC5lBMtn48lzzQEdGqFehgCNr9v4kS+6gC9GY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227345; c=relaxed/simple;
	bh=84AOcl7aE1Mwm8MajbQoIYDNoBi4rr7mmYkPfFnP1J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SA/RS/94++0c1O+XUC4Gh5jqRrNCeyLvuEs17Z34Gu6JIkcQoUseY8CGOl3uxKA3lwykQ0so+Xv1mPya0Zg1O24unxWrlqHKydho1CeNHLUmkyBq/nciP6C1kgOHu+jT0rf+EPMYolpm7uO4iDKNIL87THf9ciTN1p5UbfFVZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaI4OXE4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaI4OXE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5936C1F00A3A;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=myUYcGb7DhO2xb4zyqOK6Jjtakd/9NfUGoaPXxt9eYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DaI4OXE4zHXFPvHYxfELxvBeB+2eCSquu49piYUFl423iqvbCztvTSQinkjjB07+T
	 MaKu7nuJ24gJowSMaCbek293Bf9d+u0EpFZE6bPV/a8ah5weBpcMaMKSWGTlXIx40X
	 Lx/jowQURLVW3aZKNOMOI2Yo7ksYCLSSuhoavJ2rqdHaqDVq8sfODSORFQTcp1Vn41
	 V4vOCQbg0cVF9WfXqu/RClgoYnk4d9PwbXGgsDoQVyIEAWAbkZ1quKDl/CHWTUBFa2
	 3+hOfiCq1ytPUbicxX0mSp0RTP1h5P3FfRRonI+H/DanQns4nemj+13bYHAeSCGnkt
	 Tj9wmP4GmS+Ag==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuF-1RRB;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 04/12] USB: serial: digi_acceleport: always stop write urb on close
Date: Tue, 23 Jun 2026 17:08:18 +0200
Message-ID: <20260623150826.314727-5-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623150826.314727-1-johan@kernel.org>
References: <20260623150826.314727-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly stop the write urb on close() also if the device is being
unbound instead of relying on core to do it after returning.

Note that the dp_write_urb_in_use flag is cleared by the completion
handler.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 83c4bacc2df8..7a52600c09b1 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -1121,7 +1121,6 @@ static void digi_close(struct usb_serial_port *port)
 	usb_kill_urb(port->read_urb);
 
 	mutex_lock(&port->serial->disc_mutex);
-	/* if disconnected, just clear flags */
 	if (port->serial->disconnected)
 		goto exit;
 
@@ -1167,14 +1166,11 @@ static void digi_close(struct usb_serial_port *port)
 			TASK_INTERRUPTIBLE);
 	schedule_timeout(DIGI_CLOSE_TIMEOUT);
 	finish_wait(&priv->dp_flush_wait, &wait);
+exit:
+	mutex_unlock(&port->serial->disc_mutex);
 
 	/* shutdown any outstanding bulk writes */
 	usb_kill_urb(port->write_urb);
-exit:
-	spin_lock_irq(&priv->dp_port_lock);
-	priv->dp_write_urb_in_use = 0;
-	spin_unlock_irq(&priv->dp_port_lock);
-	mutex_unlock(&port->serial->disc_mutex);
 }
 
 
-- 
2.53.0

