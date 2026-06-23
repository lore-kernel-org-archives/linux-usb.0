Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C43D7D86;
	Tue, 23 Jun 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227347; cv=none; b=rbMK1lmXsRP0glx3m5ax6/zktP5LW+8vDuUJnBLG0FOmoQ3keJguhwC6rYe0ZPclpSZ6xe2nyYaVPDrclrZ6jYnY5FHParCtTYW27yyIg6iA2BtKXEm0i+C7T4LroMUvgBlqd/eNWaKl5YI3DgYT3gzJshzQ2YpH9e+OvsiyhJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227347; c=relaxed/simple;
	bh=6vPZ+SGsIscjCVz3liUaYaXPPLafiKy3VubJzgPW4EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=at1VMkAhXtP8FDCDrIt/gYfhzBzktsQFTgpwXJAH0CfD2Wx8z5+lYg0sDUTGrNKLGZJ8000DPkQBiwFpQ/Pt60oX0KRDYjIXR1K4jXfyU+Nr1aRYO3Bquf4mvVdVACWCM1v83h6R7ueGGQAlGeE3G6b2Pqgd14tqY6/7dFyPdD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFUa8hlN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFUa8hlN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1BF1F00ACA;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=8J2fMdTXLSjVZjtiycCSwUhAqncxDBt6K9MB2zBSAIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nFUa8hlNYUzQrbweRMFfCc8DcqRf3f7KWuaeh4lcHVRMG91FcBaaDNbG81gHjgCNv
	 57yPENx4+ntQXEIcYZ6MBFe2f3w4PsyP4rOzh4VfH48oD1fkD7jefHLHAwKcqcMrJV
	 0yUTh4v5uC4ZN0GEOkYRVL4mlLB4e6Kq5EhbTAYvYezbjqQWhuxEH8mKoK+cyUMnVM
	 T0gOJ8Ax49pRwsQW1w4aunsqwIVzsKZVp81cwXRuozwz5cDhKNIq/reQje1a8H9gaW
	 zgRZKxDsWiEHLgl/9sHwcbxVlTCFp/HP0II0YQ1K5MQvfTyO5GjOxGF81iTIcpzgJH
	 Xe1ZGAFjB21VQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuD-1P3N;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 03/12] USB: serial: digi_acceleport: drop unused wait queue
Date: Tue, 23 Jun 2026 17:08:17 +0200
Message-ID: <20260623150826.314727-4-johan@kernel.org>
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

Drop the close wait queue which has not been used since commit
335f8514f200 ("tty: Bring the usb tty port structure into more use").

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 046cd9d57600..83c4bacc2df8 100644
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
@@ -1174,7 +1173,6 @@ static void digi_close(struct usb_serial_port *port)
 exit:
 	spin_lock_irq(&priv->dp_port_lock);
 	priv->dp_write_urb_in_use = 0;
-	wake_up_interruptible(&priv->dp_close_wait);
 	spin_unlock_irq(&priv->dp_port_lock);
 	mutex_unlock(&port->serial->disc_mutex);
 }
@@ -1223,7 +1221,6 @@ static int digi_port_init(struct usb_serial_port *port, unsigned port_num)
 	priv->dp_port_num = port_num;
 	init_waitqueue_head(&priv->dp_transmit_idle_wait);
 	init_waitqueue_head(&priv->dp_flush_wait);
-	init_waitqueue_head(&priv->dp_close_wait);
 	init_waitqueue_head(&priv->write_wait);
 	priv->dp_port = port;
 
-- 
2.53.0

