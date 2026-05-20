Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B0136EAAB;
	Wed, 20 May 2026 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263244; cv=none; b=ECEVlM2HudZjST1HPQEm601SKYYR9hIo2Uc3ocluoFGk7BvUPUlZ0tuXDKJtbuO6hWj1aEi66Iho3SNctqRiHyKXKezM5CGzFT1GCL3f2vpfEnfVjFvfsii9We7xjEcvfko+qQ6GF3dUQVL4rcPmb04A4rJU8tPpfTOJk0lYTZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263244; c=relaxed/simple;
	bh=iox1T+Ss2L+SOj/qCL/rI9bAf7b7woXw0NMHfdm6138=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGuN9Ftm1wjkHx//n2KwFuSJkk3Aix2ql6suWj6QhcALMxxZCHOg8uRpq1iI2E5p682ASS1kd9NjLv5j2Xat4vmRMDfod5rPjAC7MoEAwf6VgL7ULgT1rLyJgVrMtyQdWW9P1Wuh2/xFMGAVejGYRXUB1L9LnijlcR4WLVlvWRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJ5DMtMi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJ5DMtMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8018E1F000E9;
	Wed, 20 May 2026 07:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263240;
	bh=ULpjYOWlk6QepvRPImnVaFE/cdv7fymMVDxSSwoizbM=;
	h=From:To:Cc:Subject:Date;
	b=FJ5DMtMicPY4Mw8MFe3YVJduhlX/G2wB4328Hsw+ZJJ9gKAPHV0gq8oGWf3bCKyKB
	 X672ahBjHaYw38uiMSw9VBa2jZYAm6ZzKNr8DIeOrefyCZO8eGGYinZdwV0YmcovBb
	 m1LOKOfdajkOfuEpzn2EG97fo10WNr7KNuDiQKDBD+4paXKxVZukCTqcHaLmPpPR4I
	 85VtKkJy43q8FTABIaNbvS3qubih8mJAMxcXPzj76eJvMGK7lV3SELHeGE70J26PNe
	 qRyCaLX/gUzRYYGScoXh3keAAfDg2MLlX59yD5jVpTORj2z0ithGcGPW7liMtX9nis
	 U4O3qkJ7CBoNA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wPbe9-00000002gSN-4A9P;
	Wed, 20 May 2026 09:47:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] USB: serial: digi_acceleport: fix memory corruption with small endpoints
Date: Wed, 20 May 2026 09:46:53 +0200
Message-ID: <20260520074653.639831-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing bulk-out buffer size sanity checks to avoid
out-of-bounds memory accesses or slab corruption should a malicious
device report smaller buffers than expected.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index d515df045c4c..c481208255eb 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -1229,15 +1229,34 @@ static int digi_port_init(struct usb_serial_port *port, unsigned port_num)
 static int digi_startup(struct usb_serial *serial)
 {
 	struct digi_serial *serial_priv;
+	int oob_port_num;
 	int ret;
+	int i;
+
+	/*
+	 * The port bulk-out buffers must be large enough for header and
+	 * buffered data.
+	 */
+	for (i = 0; i < serial->type->num_ports; i++) {
+		if (serial->port[i]->bulk_out_size < DIGI_OUT_BUF_SIZE + 2)
+			return -EINVAL;
+	}
+
+	/*
+	 * The OOB port bulk-out buffer must be large enough for the two
+	 * commands in digi_set_modem_signals().
+	 */
+	oob_port_num = serial->type->num_ports;
+	if (serial->port[oob_port_num]->bulk_out_size < 8)
+		return -EINVAL;
 
 	serial_priv = kzalloc_obj(*serial_priv);
 	if (!serial_priv)
 		return -ENOMEM;
 
 	spin_lock_init(&serial_priv->ds_serial_lock);
-	serial_priv->ds_oob_port_num = serial->type->num_ports;
-	serial_priv->ds_oob_port = serial->port[serial_priv->ds_oob_port_num];
+	serial_priv->ds_oob_port_num = oob_port_num;
+	serial_priv->ds_oob_port = serial->port[oob_port_num];
 
 	ret = digi_port_init(serial_priv->ds_oob_port,
 						serial_priv->ds_oob_port_num);
-- 
2.53.0

