Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7932BB17;
	Mon, 29 Jun 2026 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736668; cv=none; b=E7Ojp3NfXBsvHTcMAj93WhT56gwiqPvw+Qp9gtKqCgXj3eOUg8Jn7l6s2+myd+URmrzttINZipTH30XUGQyCI7IvpDYOHh2QyB/tHYJ7Yhk7EztvLD9N8HhamnTF0tWTBvGzQX1BROJDeD1zdVVqfytGkeNYUXfU5crVW2234Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736668; c=relaxed/simple;
	bh=I5YjZ6NLYjTcJsfhKJlZZDHNf3PTzf9MTJ9p9iIFydw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXSz9ZY6BcYCEj8EffmQu6Jl4rOfGL2tU7Gc8Xzmb9evB1ALsiyFN3hNOihDwKiYJlsjso4BU1AfTbI9qGmrb8+Xlw0vdMCiea1xCcmrX92mXxM/GBjO4rMTT8LFn74N+ov+07QJEefqs7dLNziOEQ2mMWgYVQ021f9C//iKjyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGS/BjMA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGS/BjMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF961F000E9;
	Mon, 29 Jun 2026 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782736667;
	bh=7cr9oPhOo9DZ6X9sfwgf80awgCTDsCHLvMQYozdP+jM=;
	h=From:To:Cc:Subject:Date;
	b=LGS/BjMAMxEw5lK7T6Wqi1BKcmzK1IjL9viLl/mBHcTtxq731O/fM/K1usQlwhRyK
	 bNLOnySv7v6hyTjnalSSUkKjpIEuP8pWBm7fsmIhTKAz/A6cQZv1Hnjitfs9BwStYa
	 JsaYACDUWLHc/BPguxZv+hDGicoi9WatbSrUC4bdLZ3dAJwS15rAF8bO54+gifT9fT
	 +omaYBBhSV0TAvjxsfukypBZmqOkt5r8WbLR3mZquIq9f5/J4+zhSAeWhsdJWhdyUo
	 tv/HuSDouTHGffHfatBOCtH5IjYeTFUCctzcMqRW+2hfVx8EqO1uEVDlERhP03E+/+
	 nk0vmRyFTjiYw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1weBFA-00000000PTC-3GPK;
	Mon, 29 Jun 2026 14:37:44 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: digi_acceleport: do not log stopping of urbs as errors
Date: Mon, 29 Jun 2026 14:37:33 +0200
Message-ID: <20260629123733.97892-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stopping an urb is not an error and should not be logged as such.

Demote the dev_err() in the read bulk completion handler to dev_dbg()
when an urb is being unlinked on disconnect.

Note that this will become more of an issue when the urbs are stopped
every time a port is closed.

This issue was flagged by Sashiko when reviewing the upcoming change.

Link: https://sashiko.dev/#/patchset/20260623150826.314727-1-johan%40kernel.org?part=2
Signed-off-by: Johan Hovold <johan@kernel.org>
---

This is a preparatory patch for the port registration fix:

	https://lore.kernel.org/lkml/20260610132232.356139-2-johan@kernel.org/

Johan

	
 drivers/usb/serial/digi_acceleport.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index dea039163661..fbb3609ac014 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -1355,7 +1355,17 @@ static void digi_read_bulk_callback(struct urb *urb)
 	}
 
 	/* do not resubmit urb if it has any status error */
-	if (status) {
+	switch (status) {
+	case 0:
+		break;
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+		dev_dbg(&port->dev,
+			"%s: nonzero read bulk status: status=%d, port=%d\n",
+			__func__, status, priv->dp_port_num);
+		return;
+	default:
 		dev_err(&port->dev,
 			"%s: nonzero read bulk status: status=%d, port=%d\n",
 			__func__, status, priv->dp_port_num);
-- 
2.53.0

