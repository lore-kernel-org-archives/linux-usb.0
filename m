Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B336AB77;
	Wed, 20 May 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272284; cv=none; b=K4RIH1/sAjHmi+pGZJpscK56omeAoWI5SY9LeW8GL/e7yLLVmkpANpY+CuqsCbJ6tEmIdPLDluUPDANgc6bxsdDb0/wfC4scVxla6orC1heQfSrQxlsoyg//kVM6y/g+28ElBtNSYfYIX4pNDqMn/7ZX7VARtVGsKisdTbp7w1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272284; c=relaxed/simple;
	bh=xzcIK/vt1VfL1zVXd+CcwysN9S2qA8aLG+kLHOD3cug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMwWO6fYMMj6J26fw5wT4rcs9wGDfxGTI/AYXEoQqA3H7Gx1xK/BVUNl24FucL0GTTZfSqBkCeFTa2BT+13fthN2y+vjOr3SAhf21bPf/lQJMslb0XPWdcyY6BYk3LbXV7Da9NSluAbgXUAldj7XTWqWbAUjcjWsSOWyKQNW7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPjcwNsd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPjcwNsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0221F000E9;
	Wed, 20 May 2026 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779272279;
	bh=R95sgSzvjdjbDAkJxKcGC/Dc7RY1T13WwtdmqmOOo5Q=;
	h=From:To:Cc:Subject:Date;
	b=NPjcwNsdGtl2U9ka1uhh5Qbsbjj7gxvsvq0kuw9lWmx3JK/0r5FAVtLKqvsE51sO+
	 Q1CG1EXjbYyajX/ImKqd0K0NaqXcO7piQ+lkqJGdI9cDnszg82CVRIleMwXV7xbmjU
	 0qxER6u86sHzzQdplkqoMRqMSknmbp4WMOAV7Ua6pBey+KnqWOdk1dxWSlWgaOd5J7
	 FenHsgh5GvpeEeU9+D0xfwqwBaPUXoRMPEhPlcl7Bllwi+/qlvBx88mNuzPeoGmHPF
	 s0g4U4MNep6ZDI3h5Z85gMUtXsG9wNMsG9bJYHHXnrnSXZjTpPdx1e0tder/5H1QRg
	 N9kJuNDK8es3w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wPdzx-00000002lAA-2vgq;
	Wed, 20 May 2026 12:17:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] USB: serial: mct_u232: fix missing interrupt-in transfer sanity check
Date: Wed, 20 May 2026 12:17:50 +0200
Message-ID: <20260520101750.657933-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing sanity check on the size of interrupt-in transfers to
avoid parsing stale or uninitialised slab data (and leaking it to user
space).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mct_u232.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/serial/mct_u232.c b/drivers/usb/serial/mct_u232.c
index ca1530da6e77..163161881d2d 100644
--- a/drivers/usb/serial/mct_u232.c
+++ b/drivers/usb/serial/mct_u232.c
@@ -544,6 +544,11 @@ static void mct_u232_read_int_callback(struct urb *urb)
 		goto exit;
 	}
 
+	if (urb->actual_length < 2) {
+		dev_warn_ratelimited(&port->dev, "short interrupt-in packet\n");
+		goto exit;
+	}
+
 	/*
 	 * The interrupt-in pipe signals exceptional conditions (modem line
 	 * signal changes and errors). data[0] holds MSR, data[1] holds LSR.
-- 
2.53.0

