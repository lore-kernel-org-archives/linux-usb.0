Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F75408634;
	Wed, 10 Jun 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097767; cv=none; b=OeMjPWqfdA3eeXYr9FEeQiFigZZDSqMmjhMpzTux8IqdyelGssdEYWd00HxSVmomZU2ifpbbJHQewVFeNM+dXn9+gxs9guIH/bqesbSO8aLEypfu3bIcKZvhAeIaxqH9mJpHN+Y2sDDROm3wzOW0y1mCtHSPFFHqrSaklk1K5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097767; c=relaxed/simple;
	bh=LcXx/4juVmtty9xj5tvqjVHCOvGppdZqPGwixF07Fxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9qkoV9I1/cC/ImrElr07Cl62ImD6RgsDINVkcSm7wVqOec4dqXLGbr5cmBzfLzKICXu/RnuoTK553rYpIvaE/uUydA6Lp50YST/KuDefT5VOAJ6xkkUKgUwi7lR4gPCwRdb9qCvHpILYXPdEEoFl/It/bNffEdRRcTMmRKmsNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbnK0VC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbnK0VC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868A51F008A2;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=A5jaU1HpIfcLvOfrAyRBbe/KUDqQeLSNbLt+ex1qCXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QbnK0VC1Wrxd9jdUJb9LSZq02YBvdlrhNg4fb7O4pFx46aVB4QYGNku/IKrSVhgz4
	 7eu8pG/advaeJTEOphndtsvSrCHzjMQryxkRofe2qPwtTH2gevdM+looLm0c8vvCw+
	 1yUcghyjU0XemdO0F6zNP/i0/tOE26eFKw07tVaa1iQmzKz01RS+swfsk7y811gSuy
	 wJJi37bxtFv5pI90yEfAu+6HHJ161h4UM/130G2030bQVobT712M4f5pqFrSaOgIya
	 ZudP2UAf4nVvl+NZGiP4P72g7O/gel6CfA54tOCd70989OItGoDyp5RD8gx0POrYLb
	 eTCL6HByHovOQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001Uf1-1VVe;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] USB: serial: digi_acceleport: drop unused wait queue
Date: Wed, 10 Jun 2026 15:22:23 +0200
Message-ID: <20260610132232.356139-3-johan@kernel.org>
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

Drop the close wait queue which has not been used since commit
335f8514f200 ("tty: Bring the usb tty port structure into more use").

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index d10d60b5d356..16ced067c5f9 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -194,7 +194,6 @@ struct digi_port {
 	int dp_throttled;
 	int dp_throttle_restart;
 	wait_queue_head_t dp_flush_wait;
-	wait_queue_head_t dp_close_wait;	/* wait queue for close */
 	wait_queue_head_t write_wait;
 	struct usb_serial_port *dp_port;
 };
@@ -1169,7 +1168,6 @@ static void digi_close(struct usb_serial_port *port)
 exit:
 	spin_lock_irq(&priv->dp_port_lock);
 	priv->dp_write_urb_in_use = 0;
-	wake_up_interruptible(&priv->dp_close_wait);
 	spin_unlock_irq(&priv->dp_port_lock);
 	mutex_unlock(&port->serial->disc_mutex);
 }
@@ -1218,7 +1216,6 @@ static int digi_port_init(struct usb_serial_port *port, unsigned port_num)
 	priv->dp_port_num = port_num;
 	init_waitqueue_head(&priv->dp_transmit_idle_wait);
 	init_waitqueue_head(&priv->dp_flush_wait);
-	init_waitqueue_head(&priv->dp_close_wait);
 	init_waitqueue_head(&priv->write_wait);
 	priv->dp_port = port;
 
-- 
2.53.0

