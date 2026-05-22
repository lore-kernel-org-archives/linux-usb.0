Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14783CA4BD;
	Fri, 22 May 2026 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445010; cv=none; b=i+NSHk9eswIa/S0wpaj7cGrXNIrxRvJA6IyaPCZ3fPXu4DK40zDHLT20DgotYDm4RIWq33MgP/wSQpIQqdcrS68ZJ1LRgdtyrDWRDavSUPUjwYyU55Y7ALKJM54FMav4vrzwjI2mcvJZqRu3bs/nOnB+z/FfNfFsEKEgzCGBiig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445010; c=relaxed/simple;
	bh=jEw8zWzbkWDyx7Hq2HAzDO8qXrYVI6p7J67gbnOW2Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVW33DC4WKo4tyY+zhq9LYQ2Qt3YSXI3DFkGpK7dGzyDZyJ5OzLiC4fvuVgQWDSuEJquJrDcTD1gydp2KZh+zGfv7uVniOGPT2un9uuFLBh/eheFsGrTcfGdsmdopj6Bv7lAdrNwhhV6cdHhGyYkUJeItelEghcwHhNH6UsWO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HE/3prED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HE/3prED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206691F000E9;
	Fri, 22 May 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445008;
	bh=tie9Sx62ugl95zHwccy1jha3P+jxL/pmhS11ZitlbEA=;
	h=From:To:Cc:Subject:Date;
	b=HE/3prEDlp7XCDeQtG+5MERxqFl0uJZpWlkIrXWj9B11VRVICq+00xbTgYEYyXHEA
	 GQcwCwaIxUpawmfGGI7ooNuoIeTi7FmHMY4io5qYc7E7Wl0vXOmDbFQ7dfu4fzXa85
	 CUGlpbUHdF4wIQIXkKln3fWNKnAq/mmSztjnrtn4dZsXah4usGYkdwKo2TKimVhQTd
	 /ozmtHA0wsoelNtS9NUM/rrnxOey9mdXLNfPKa+ToUY7ODWXCnJMukyKOJEuI1QBxq
	 zkDi5LkwgCKEo1siJi/aOcBC2pg5kzBkYPPSqH57RzGfm5jKlAZe5iKy0/TFacezwi
	 yJRTrNDDz/3kg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wQMvt-00000003tAf-3cGO;
	Fri, 22 May 2026 12:16:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zhang Cen <rollkingzzc@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] USB: serial: cypress_m8: fix memory corruption with small endpoint
Date: Fri, 22 May 2026 12:16:21 +0200
Message-ID: <20260522101621.927034-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure that the interrupt-out endpoint max packet size is at least
eight bytes to avoid user-controlled slab corruption or NULL-pointer
dereference should a malicious device report a smaller size.

Fixes: 3416eaa1f8f8 ("USB: cypress_m8: Packet format is separate from characteristic size")
Cc: stable@vger.kernel.org	# 2.6.26
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cypress_m8.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index afff1a0f4298..82ba0900b399 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -445,6 +445,14 @@ static int cypress_generic_port_probe(struct usb_serial_port *port)
 		return -ENODEV;
 	}
 
+	/*
+	 * The buffer must be large enough for the one or two-byte header (and
+	 * following data) but assume anything smaller than eight bytes is
+	 * broken.
+	 */
+	if (port->interrupt_out_size < 8)
+		return -EINVAL;
+
 	priv = kzalloc_obj(struct cypress_private);
 	if (!priv)
 		return -ENOMEM;
-- 
2.53.0

