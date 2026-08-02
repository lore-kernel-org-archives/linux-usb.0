Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCCD356751;
	Sun,  2 Aug 2026 23:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713549; cv=none; b=oYzMFNBz1KTB7TTcMzgdCXd/3zy3iyePnw4We3lEltzujXLF0JA3f/dMlzj1wHzkBxnXrylEZttO3q2IWwE9Tu34f3pW+LCHh24Nb6jQ/mfGCB/rIp+c0Yb4B4emxPX6IqnReoMsUrtWUelC9+M9c7V1r2uim/ADakcezfn79j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713549; c=relaxed/simple;
	bh=4przBRhh1cRZD7KStSGaXhl6zXz+0M25B9IiIkd2nfk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pqxgzd3vx/w0NW0mHq3tGDQ+X4boq4EXglpck6wVjwVXhEyr0QfY3OT5Uqkj0iqHMWyeHcgcJIPOUUvSYwTuGYr3Xq3WdSOOZ82+kok3Tgt1zO3SYCsFFn+hDEXLQu5DK3YiF98u7RvcWgsdS/AqoHSd1Qxpac6ZxN0V2gGYo2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=ElFLmrO1; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="ElFLmrO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1785713546; x=1817249546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xs7KEoQug94DNSAZiYnsFgZIMPypF3GOMUS39LPoXDA=;
  b=ElFLmrO1wgU+Q0zPAF5/Xk1S32PcRdNuS+36Njy/tqHRn7asIa9jfXuw
   2T9Q3QYAoa8q1fskpT1vH4kM1unrxYTttKjULR45FIMSqdJKxEw3OM8by
   8ZD3cxsajjKGOgHpntMa7Q6NqWXRq+c3OJVx710CcWZzHZSfk/QqAk1rf
   UhPWgmJFEqMI69R0SFWnECw0c1mlIye+zjEGD0sH/YkeKHb4+nY/peozk
   rDWDOt69D7VLEsl8z2wtT0vXg1fc8cvWXkDzp1rrCiZd4tWk77+F0CHbE
   PSPf4U2i8Xc3X8+fStpGUEgtERJYUHuWEYtKUuFAqeJh0nrJ76kzwHwjN
   w==;
X-CSE-ConnectionGUID: wjzAAacYRf6GRKZ1sEQx0A==
X-CSE-MsgGUID: zZ8mAfExR42fs8uJLe7GQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="118025935"
X-IronPort-AV: E=Sophos;i="6.25,201,1779163200"; 
   d="scan'208";a="118025935"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB10.ad.harman.com) ([199.27.113.4])
  by esa1.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 19:31:16 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB10.ad.harman.com (10.92.6.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 3 Aug 2026 05:01:12 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Mon, 3 Aug 2026 05:01:12 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 6DEB680059; Sun,  2 Aug 2026 23:31:12 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: [PATCH v6 3/3] usb: hub: send enumeration failure uevent
Date: Sun, 2 Aug 2026 23:31:08 +0000
Message-ID: <20260802233108.70950-4-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20260802233108.70950-1-Akshay.Gujar@harman.com>
References: <20260802233108.70950-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Emit a structured uevent when USB device enumeration fails in
hub_port_connect(), supplementing the existing error log with a
notification userspace can act on.

The event is emitted from the port's parent, the hub interface, because
usb_port devices have neither a bus nor a class and dev_uevent_filter()
drops any uevent sent from them. The failing port is named in the
payload.

Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
---
 drivers/usb/core/hub.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd3..78275dd702ceb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5613,9 +5613,21 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 	if (hub->hdev->parent ||
 			!hcd->driver->port_handed_over ||
 			!(hcd->driver->port_handed_over)(hcd, port1)) {
-		if (status != -ENOTCONN && status != -ENODEV)
+		if (status != -ENOTCONN && status != -ENODEV) {
+			int ret;
 			dev_err(&port_dev->dev,
 					"unable to enumerate USB device\n");
+
+			/* usb_port has no bus or class, so uevents from it
+			 * are dropped; emit from the hub interface instead.
+			 */
+			ret = device_enumeration_failure_notify(port_dev->dev.parent,
+								dev_name(&port_dev->dev));
+			if (ret)
+				dev_warn(&port_dev->dev,
+					 "failed to send enumeration failure uevent: %d\n",
+					 ret);
+		}
 	}
 
 done:
-- 
2.19.0

