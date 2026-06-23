Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F53D7D67;
	Tue, 23 Jun 2026 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228118; cv=none; b=G3NPAIu5l7gejQ5y+SDeWb3LYB14ZRFnkWKLoZFXHkGvQtPpxP3v/20hjmpOAio5JBGqVY+ox7t9a5b2qcIo3a1HcPEKWganU6c6wDoEvyQmvi+Rrb2qeHY0zkvsakLewLnRRjRlZ925/u5ed5amE65nWYisACr+e1xrKWbn1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228118; c=relaxed/simple;
	bh=iauC5pqg3oCTLeTfRxr5Kk+yoFxUI7HYS0CXvRS7zV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kR421nxyxEzVUDTWWfappDpKHaIqbRdbuijywEpjoCzIHRlf+pnY0weMcYat3FN6vJBMYbYniES01Us3bVBB0DHp3eQ8sSBvQh3ZxnF/8esOaGx65MYbaiNwH0hF9Jhni7om5e5S6sGNxhcvsLcg/12646OTqwf8odRhGG5FCzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feecBkvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feecBkvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E1F1F00A3A;
	Tue, 23 Jun 2026 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782228117;
	bh=L05vZi/T3kwldbleIdEBSiAwYB0rb2Lb7c+LjT2bB2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=feecBkvQfTWQ/MOYdL1v7RC7nPhqVfWzLMJRuTF8USUm6lsCgjA0mTKHFXnjUH6Iy
	 Pb3U6QqTy+vV7pS7wpcy5Q+BfRD/ajv/nr3YRnrKpi7JF+Y+imCxd4Wh/rj4042Egb
	 tPhP2bnZZqO+dUa6nyqVC1baCYNMAmkSYy4FOsja5XcU58+cOKVr0qu1zMxDVUzxA0
	 n6IODZM0XHGOR0AHfU7X6cLReo7+DXJcmSwys3QWWyYbfuwGXhVUxJXtsMdb1vTNXe
	 c82egC0YATtDP6Xmnlyhw0RPOhUNxAK4ZpQDTZYJCQRHHy0n1OcLoTjzPolUqD5XxJ
	 7vEBDzDdwqyAA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2wl-00000001KFd-0NtE;
	Tue, 23 Jun 2026 17:21:55 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/3] USB: serial: metro-usb: fix unthrottle race
Date: Tue, 23 Jun 2026 17:21:47 +0200
Message-ID: <20260623152148.316149-3-johan@kernel.org>
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

If the completion handler races with unthrottle() both functions may try
to resubmit the same interrupt-in urb, but at most one will succeed.

Fix the unthrottle logic using a throttle-requested flag so that only
one attempt to resubmit the urb is made to avoid logging an error.

Fixes: 43d186fe992d ("USB: serial: add metro-usb driver to the tree")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/metro-usb.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/metro-usb.c b/drivers/usb/serial/metro-usb.c
index f42ad5dec35e..8458713277f4 100644
--- a/drivers/usb/serial/metro-usb.c
+++ b/drivers/usb/serial/metro-usb.c
@@ -36,6 +36,7 @@
 struct metrousb_private {
 	spinlock_t lock;
 	int throttled;
+	int throttle_req;
 	unsigned long control_state;
 };
 
@@ -143,7 +144,10 @@ static void metrousb_read_int_callback(struct urb *urb)
 
 	/* Set any port variables. */
 	spin_lock_irqsave(&metro_priv->lock, flags);
-	throttled = metro_priv->throttled;
+	if (metro_priv->throttle_req) {
+		metro_priv->throttled = 1;
+		throttled = 1;
+	}
 	spin_unlock_irqrestore(&metro_priv->lock, flags);
 
 	if (throttled)
@@ -175,6 +179,7 @@ static int metrousb_open(struct tty_struct *tty, struct usb_serial_port *port)
 	spin_lock_irqsave(&metro_priv->lock, flags);
 	metro_priv->control_state = 0;
 	metro_priv->throttled = 0;
+	metro_priv->throttle_req = 0;
 	spin_unlock_irqrestore(&metro_priv->lock, flags);
 
 	/* Clear the urb pipe. */
@@ -269,7 +274,7 @@ static void metrousb_throttle(struct tty_struct *tty)
 
 	/* Set the private information for the port to stop reading data. */
 	spin_lock_irqsave(&metro_priv->lock, flags);
-	metro_priv->throttled = 1;
+	metro_priv->throttle_req = 1;
 	spin_unlock_irqrestore(&metro_priv->lock, flags);
 }
 
@@ -321,19 +326,23 @@ static void metrousb_unthrottle(struct tty_struct *tty)
 	struct usb_serial_port *port = tty->driver_data;
 	struct metrousb_private *metro_priv = usb_get_serial_port_data(port);
 	unsigned long flags;
+	int throttled;
 	int result = 0;
 
 	/* Set the private information for the port to resume reading data. */
 	spin_lock_irqsave(&metro_priv->lock, flags);
+	throttled = metro_priv->throttled;
 	metro_priv->throttled = 0;
+	metro_priv->throttle_req = 0;
 	spin_unlock_irqrestore(&metro_priv->lock, flags);
 
-	/* Submit the urb to read from the port. */
-	result = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
-	if (result)
-		dev_err(&port->dev,
-			"failed submitting interrupt in urb error code=%d\n",
-			result);
+	if (throttled) {
+		result = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
+		if (result) {
+			dev_err(&port->dev, "failed to submit interrupt in urb: %d\n",
+				result);
+		}
+	}
 }
 
 static struct usb_serial_driver metrousb_device = {
-- 
2.53.0

