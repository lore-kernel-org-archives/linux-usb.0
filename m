Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9320ED;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097767; cv=none; b=Iy4V6iLQxtpqmWHORXobJDErSe6DFXV2AGn1Ht4JW87o69pEwbrQzqhYFk3XGWtCoY8Hn+AdTGhmnnKOFISByycsL0JmpaTXh8LLC6sdh5ga+Pnhi9dIkdML//T9tDBeITCLBw8nRnCAeMO0zt5jOczVcKtwOfSxlTmVvoupmYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097767; c=relaxed/simple;
	bh=FbZHDCb9KfjOhnJEJo2LbrCLdCeQQZnVe7db21rUoBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJpGNuvq5CNKe15T+KAmLkLoajxKAf6jb7zyejkXpovxlGZv5IVpavaib8vSkLbKRwat5iyl8lxJyNopOjIrHN7ubfwUW8p4udrtbg9cgEpV65mXzYpxueMDZFa7CWeoNPDaGMuRthQVjq6BTgO1gRNLb8G/uEtjdrBm1eAzv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMH3+OHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMH3+OHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB1E1F00893;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=R913vhvbqI0Nsv+WvL48a2w9Isz8oKwu+kxAtm47bEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lMH3+OHySOHAAPk5Gr8mOngnq1gQjK29Nt5rzifsPijQ2JPyrEALqJprXAW8tXNW0
	 OOqA3CqgDCpcgyaHHx81wc7SYaqwzm1icF50PAaqHFa78jE2ayfP5yu3DClpbNHIi/
	 652bxEaLSk63NfsHgaoNwFN3zCPP5hZryFCkxUoJkf1EqoCi+8MQc/hBNWmgYZ62Lr
	 hFPggHKI+Zg2T02WNHCvQHSkKaTiMNQOVvBCBQ6oJs+OjoJ9SVN+d36scVy9t8878+
	 bbPPXHwgnQ30PKNSaBUL3TG91v4EEoeJOf+CCALcF4QPsjJK//FSJbEIX4lCx4EADj
	 Z79/r5G/fZgsQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001Uf3-1Y6n;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] USB: serial: digi_acceleport: always stop write urb on close
Date: Wed, 10 Jun 2026 15:22:24 +0200
Message-ID: <20260610132232.356139-4-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610132232.356139-1-johan@kernel.org>
References: <20260610132232.356139-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly stop the write URB on close() also if the device is being
unbound instead of relying on core to do it after returning.

Note that the dp_write_urb_in_use flag is cleared by the completion
handler.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 16ced067c5f9..7195a63da8a1 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -1116,7 +1116,6 @@ static void digi_close(struct usb_serial_port *port)
 	usb_kill_urb(port->read_urb);
 
 	mutex_lock(&port->serial->disc_mutex);
-	/* if disconnected, just clear flags */
 	if (port->serial->disconnected)
 		goto exit;
 
@@ -1162,14 +1161,11 @@ static void digi_close(struct usb_serial_port *port)
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

