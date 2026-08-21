Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0592DC321;
	Fri, 21 Aug 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327174; cv=none; b=RsSf+KA9ctc+DleBl5DQQGf8P6ow94LPWfpEzW84YpHl454jueEsqExdlnGEsnHubg3/pu61uQRhKqsAXmRhI+kp+91LuQ8hAY02Dbro59BsWcW2TR6krbzC3Nf0Tbzy8gkdujrDbDQ4nwID9Fkbay9miwphD9GWHf/oVoxeQ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327174; c=relaxed/simple;
	bh=CFjsCPLN31F/H6xKRnSGIkH/oD35roYpiPepEB9lWzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqAHIaY8yjfX5UxlbNB+EEe74S/VEWdT9wIcfn3jAfP8HpkA7WlmMaxbXGmbQoIjEBBQDBTl1p8i/XkcewDULcr+Vvzdfo9Se24HTmWcY4eo+rCpPM+TZ50zFtTvGv6AvtP3chq+vx4IHAMdtaIizzTk8V/Z9wngSLSarn05tXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWcGc18Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWcGc18Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B175D1F00A3D;
	Fri, 21 Aug 2026 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787327172;
	bh=a2Am6kVDRlYjOsf2KlsDhBCNscdUiToO1GH8R9kQgU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GWcGc18Qkl2RaUyfm3LRKz/u7ceGhFm/LG+7pAxyAj5w+pwrmq7Z2ilx/Zj3hXala
	 C8RX7BgjE51AuUUIAKfQJSuTeH8JpCmqSiCUvQEO0lrXs7V+j2pFlTi5XUoum/DiF6
	 fKrTp3Vx6QK5PidmRnn2MnGp6e55641xs5+CCw/JKM+dvt6Szx+yhwGzo9hiqM0If/
	 5fXU79VSZkU8YvLpoQVdh6yFMf90ucQwLTfMwM9G7UNOzdy99tNEI3vKwp6shvA0OZ
	 rH3dbpp/UYZcaVkzzwTLcnGnYStZZhTOXqYDEcgQG/zYhOjVvMdxx1WkvlxryTJelS
	 6IGTdBOXQOtrQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wxRRa-00000000Uvc-2Baw;
	Fri, 21 Aug 2026 17:46:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] USB: serial: use iterator for driver deregistration
Date: Fri, 21 Aug 2026 17:45:46 +0200
Message-ID: <20260821154546.118809-5-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260821154546.118809-1-johan@kernel.org>
References: <20260821154546.118809-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new serial driver iterator variable also when deregistering
serial drivers to improve readability.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/usb-serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 11a0ed6d6546..9c51b44e2284 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -1558,8 +1558,8 @@ void usb_serial_deregister_drivers(struct usb_serial_driver *const serial_driver
 
 	usb_deregister(udriver);
 
-	for (; *serial_drivers; ++serial_drivers)
-		usb_serial_deregister(*serial_drivers);
+	for (sd = serial_drivers; *sd; ++sd)
+		usb_serial_deregister(*sd);
 
 	kfree(udriver);
 }
-- 
2.54.0

