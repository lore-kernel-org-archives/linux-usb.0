Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95973CFF7E;
	Wed, 20 May 2026 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271987; cv=none; b=hi2kvh1P2HKAnZhIz2QHv5VQzwtFYzRyVQERH59pQDidi7dd1V15CGjN07J3BYopnm3JOrGZ1RAyof5QvIzdZFtr492GAg0UCC/1N6gH76YlZYK+KweHaFResEiMNNZLxQ5S20QOvOwoSSVZiDCh1qCjztY1bGhzuO6lTm2ShJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271987; c=relaxed/simple;
	bh=+5WIfa1cTbG74ah2/gMk5Y5G5l9wp7C7p78BaSEI0cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VpHWVUv9HNQuYrM6Yee2DAx1C+fmLgtms/jJe/9zWKRjjBhwKSDFZaiOqvp29OAoOQfah433VDs75lq/k36OlI4EGowgIDenEKpoRwrVgBAPKKDwQ/QzVVz+MtwMLoslSYpNMXGUDkV/w14j3Y7yLwA9HG/4sxVtZ6dJ0SemY78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ob1nUAAM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ob1nUAAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D811F00893;
	Wed, 20 May 2026 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271986;
	bh=vS4iz4rZse6XbTnPwVMgqalS3oYcI+kt6rMOGfXvAjs=;
	h=From:To:Cc:Subject:Date;
	b=Ob1nUAAM+KQ1hwg6M2mwhwC86hzivP3nRZa2oGKfXIDh64Ymh+yznMV+Xh79h3oKF
	 qMnVmb7+IxkZcyRsDEcdxs23jp7g+GcI+RtFNUt7KQiETrg2z7cbHdtF2GnX5DVnwq
	 ySdOnxMZ9VABie/5kYLD2lvLD0lkrUzIQn8V3BE5eAQjNxMIKDRCKy3jOzGdQY1q7l
	 3HrNbX6YzKIDfEJr8G7CbIozuRlzbA4/Pefru/hiNGmPXNzlBxh/klCpCaNEkcuaOx
	 Z8CFAmCuIxopnZM2++NiN2XbxE/FXNVlCTMhDLgM8I2SPXffwg+bXOfJ7Se5/cz3Hl
	 1k09Q4qcOK2zA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wPdvD-00000002l2Q-37nQ;
	Wed, 20 May 2026 12:13:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] USB: serial: keyspan: fix missing indat transfer sanity check
Date: Wed, 20 May 2026 12:12:30 +0200
Message-ID: <20260520101230.657426-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing sanity check on the size of usa49wg indat transfers to
avoid parsing stale or uninitialised slab data.

Fixes: 0ca1268e109a ("USB Serial Keyspan: add support for USA-49WG & USA-28XG")
Cc: stable@vger.kernel.org	# 2.6.23
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/keyspan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index 46448843541a..a267bc51afc1 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -1187,6 +1187,10 @@ static void usa49wg_indat_callback(struct urb *urb)
 	len = 0;
 
 	while (i < urb->actual_length) {
+		if (urb->actual_length - i < 3) {
+			dev_warn_ratelimited(&serial->dev, "malformed indat packet\n");
+			break;
+		}
 
 		/* Check port number from message */
 		if (data[i] >= serial->num_ports) {
-- 
2.53.0

