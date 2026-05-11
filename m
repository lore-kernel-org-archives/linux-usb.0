Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F94136C9EC;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=KS5sDP8PuLxhZACcy3eJjdwZUdHEh/RkLeU+L+mfVccalvRJmQXg/CeM5J9P1ObcJM3/Yt91MxoBjnVcwliaDhbTVia9dCT0YjUhAD6rtqjsLMoCWiLaLe+SO4BDtw1wDWQUTIqrjEG0z0TyLPBao7Ppv+Gx9KzYztQfBaoZ+ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=nT/+KttSo2T3ZYzG5k6s1QrgTaMY8ZUKKQEu7Sm+dvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQ+tMegzh03ypsyqX+oi7b78WDCqQihJg2B7gF1eTfEQY83RxdvZyj2kvzVI9cwJSs7v/WSHyKROaZ9AN5CFCsV5NqMCJfRdJGJtcshfVlKHX5BdyCQRMtDTYpyai27525XT+ucGauR78GU0lDzioeqcPfTWqos3vTmfSBYCumA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uObgrYV1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uObgrYV1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0744CC2BD01;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=nT/+KttSo2T3ZYzG5k6s1QrgTaMY8ZUKKQEu7Sm+dvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uObgrYV1+P17elHf1asJA8kZXQGdMyxfvFoEf8t4xrE05RME443k92gM4s8Yk1Bq3
	 +FCl/bsG/V7cyzjElApeKvdPfjgz5XbXEjQKRs9g3rMmlmqz7orVvCLTPSeH418032
	 BB/o2ORJWlAaCTYpmcTnGqhsaGN2hq6IJgic5HlbCtnMva8qlQ/vJJksn4eU/t3vwb
	 Q2YEep+8cmSCRKwhQimHjp/iYMJph5lqv2BXlO2mgVD0E1IfiK75QRW/+esH6Z7dmx
	 c6Vf7cpjkfTa2l8l6wxS8rASJBeG16wzjeT87GU0ut2a4LNXcX0vPmqWXEwMfXHeHu
	 e4xe1VWcn4Tsg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCY-31IJ;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] USB: serial: add missing atomic includes
Date: Mon, 11 May 2026 09:14:47 +0200
Message-ID: <20260511071448.611875-8-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511071448.611875-1-johan@kernel.org>
References: <20260511071448.611875-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing atomic.h include to the two driver that use it but did
not include it directly.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 1 +
 drivers/usb/serial/mos7720.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 4cf77ead9334..34ccf7820537 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -25,6 +25,7 @@
  *
  */
 
+#include <linux/atomic.h>
 #include <linux/kernel.h>
 #include <linux/jiffies.h>
 #include <linux/errno.h>
diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index bc3b631041a9..104f43a8f4d8 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -17,6 +17,8 @@
  *	Copyright (C) 2000 Inside Out Networks, All rights reserved.
  *	Copyright (C) 2001-2002 Greg Kroah-Hartman <greg@kroah.com>
  */
+
+#include <linux/atomic.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
-- 
2.53.0

