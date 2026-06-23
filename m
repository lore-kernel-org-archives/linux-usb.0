Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98983D7D69;
	Tue, 23 Jun 2026 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228120; cv=none; b=djkrgxIiq+XuzhWEmYvVkxRT9QFkRUqUCJnrJ1FlLAeQ28LrUZ7IgcJvJ55tOJYSIK4h7xWQhwA15WsXtsZBNauHiIqhyL5Lu4YemN7WFtwsr132Ajp6t7nag0UfwDbuuCvfM4Ox4UUH1Bmdsk4KaodPhgvRghCkVio+wOi8+wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228120; c=relaxed/simple;
	bh=P0fgzRJCWzHHcCzx/XZxrDsqXYi1V1aN2F0OojmAsAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GH3tMIvJZEAiBTxlXzxVp0t+kJku0/ywzgBYC5eaMajOy806GmQrSw9E41WVZ0UJ5NiwUzR7bxh7qgnUBI0RUl9r9nB55yeHDfTXHjp3WK9vd55RzjcPHz8iB8Snc65BnkJjKsju/Nn64RHSfzeqn0QZHWCeNPDSfmwQ/Ot4vCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1B6m4I7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1B6m4I7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFD71F000E9;
	Tue, 23 Jun 2026 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782228117;
	bh=kmlSYZqD4vr0f8SjIJ5hk6kD9Cw8OZEM3YWwKeENTMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D1B6m4I7jOmUmPWCeYYvJL1Mh+xjXvxM7drN9hxdnfcGGnzT3g+yD7SPNDlNFO/ce
	 4DDf9z1AvCmS6L91My/h6nVka3QZO9mIXVz0LlfvHbuiM+IPkJOBSzssdsoWZot05y
	 7sd+kv747HaAILv5HWCeMPF5MT4Efgs3BsCKCuEqFZlTTw/HmyFIyVLgfrtZ9y0oaw
	 9GK7nMuXYc8VNtSWHv3FNDv+zf6cSEDQABiyw2OTYrkxeh1BwzNnCpyBCRToKtQIrb
	 befOxXzIWyeqK/3Cd5GFbb3cDka9ELD7dAEDewj9NT0DfDnDUcssIlOXo1RnzDNNPS
	 VqG7IGligJW6w==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2wl-00000001KFb-0LIS;
	Tue, 23 Jun 2026 17:21:55 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/3] USB: serial: metro-usb: replace unnecessary atomic allocation
Date: Tue, 23 Jun 2026 17:21:46 +0200
Message-ID: <20260623152148.316149-2-johan@kernel.org>
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

The unthrottle callback is allowed to sleep so pass the correct GFP flag
to usb_submit_urb() to avoid unnecessary atomic allocations.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/metro-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/metro-usb.c b/drivers/usb/serial/metro-usb.c
index 35473544f1c8..f42ad5dec35e 100644
--- a/drivers/usb/serial/metro-usb.c
+++ b/drivers/usb/serial/metro-usb.c
@@ -329,7 +329,7 @@ static void metrousb_unthrottle(struct tty_struct *tty)
 	spin_unlock_irqrestore(&metro_priv->lock, flags);
 
 	/* Submit the urb to read from the port. */
-	result = usb_submit_urb(port->interrupt_in_urb, GFP_ATOMIC);
+	result = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
 	if (result)
 		dev_err(&port->dev,
 			"failed submitting interrupt in urb error code=%d\n",
-- 
2.53.0

