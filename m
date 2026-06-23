Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C354E3D8103;
	Tue, 23 Jun 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227347; cv=none; b=c++AcYOyTqPd/XfZSaPE8cXl9BIbpFVbY+IH2NBjGZthjWgg9We5VaKz22Wdlu+98H5x7yaKafNoQZSk3lHYxHEPPlP7keo7Nzub76Hxh4LszOuRsnux6omODy98+ibH/9Y6ifBnsTLHpeAmkEfUUWNx5XZUwV+8SM6lSRMXmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227347; c=relaxed/simple;
	bh=Tzrl9qwzHCG86TfN8S6sCWtPgtE81tZVjUITHStu8PU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRQc4h5dq5j5V2YuvEH2CrxX9Ec7n4SrWdNj6pEvFu/lKXB7TRZs32ZGGZ3XbeCyF7SzdzpIigLdAUBhwHroQROFJVS0me+MSdGD4TbHEMaQgFqOKEfS73U7nS6uGYx15mHxhKzMHQkMExtsc144rRNjQrIc4t0my7on+EB/D4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZv4mJkk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZv4mJkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14F61F0155F;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=MJhxPoLFwsZyRN6nAzinfGvOh5ndx5aO71uB+pN1eUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GZv4mJkk0UurPpvgdTCW8d3Be13lwcB9/matAmXcF2Sm6w8iv7545Bv1rwaeU6rTa
	 VeKBO3rrDql4NpyGQtC+DmXEtnHI1ZB93/qA+Gq/a/gLZL5f3dTfozpyW3kTq/SU/w
	 RmPHT0b9OpOFwQCP8SBREXYbsou47++HIjGl5EPUWoxUjxLORBpuup3nCiWVHe1Xo3
	 00jtHr3A/jHYDxOwe69vIUsc1+OLuLoKhaXqxAcDdv0Ndjz5G7uE7OIpItkwcPeaUS
	 fXUTHGnJozcroocikkv1OLzQpnU+WCX4keLEG5o523LVqxdIxMYAJHG+QFSRhqGu6L
	 7hHbKjQgyVl1Q==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuP-1daz;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 09/12] USB: serial: digi_acceleport: drop unused in-buf define
Date: Tue, 23 Jun 2026 17:08:23 +0200
Message-ID: <20260623150826.314727-10-johan@kernel.org>
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

Drop the in-buf size define which has not been used since the port
buffers were removed by commit 5fea2a4dabdf ("USB: digi_acceleport
further buffer clean up").

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index e4ab41d9f3a5..8c21c669c1a2 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -32,10 +32,6 @@
 /* so we can be sure to send the full buffer in one urb */
 #define DIGI_OUT_BUF_SIZE		8
 
-/* port input buffer length -- must be >= transfer buffer length - 3 */
-/* so we can be sure to hold at least one full buffer from one urb */
-#define DIGI_IN_BUF_SIZE		64
-
 /* retry timeout while sleeping */
 #define DIGI_RETRY_TIMEOUT		(HZ/10)
 
-- 
2.53.0

