Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A18843303A;
	Wed, 15 Jul 2026 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115691; cv=none; b=Tvo8ZMNZTLbbW9UWFkOr9SMZbHtKJu8/ni5uL5XxZhqrZ8+sb9PUQIftLDl7lmvFhyYKqjkOY2XI3+GaeMOodYVfzoT3gNE688PFXsL9Lkey9R+Fa5I58eoGjbH1dIGB8Vq8XUf1fLOMPX6EScXFfoIePkJI8iIovL5AhtSnGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115691; c=relaxed/simple;
	bh=AR64wd+qK8vzwlAHFBRMwy2h9ggKDLoXEII4eKRoFuU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ST91vu326wwpZljaejJqkPUaqUgmIZMqHdVvv3Szzej8K/YBB7vba62lDZVVxMhBzhQk+O9SfAy1XFOxZ9F3ugVPHvEZMIuUDbPgNZpJZDCLcj8tYRinRHyQXh3dghME7wln7f/plCCnEGn/9rk3n2wvq9H5x6l+KoCim85YqJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=OV3BmSjh; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="OV3BmSjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1784115690; x=1815651690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nay+qMkcJEGrFs8hEEeT+3bHI5WJSCwwzsIvN6kXWww=;
  b=OV3BmSjh+IALc98KB6HhuueYkaljA7fmu2onqDBWH7ROuH9GM+kQa822
   /kCiPo4qr4m1+nizbJLLBIgC4QwqSjso3Qz0TvWjh/Vp+GdHGOTk17MXX
   5DOXKMTRKdKGjr+KOXajCRLGUeb0kvqWuv7cl6J7m85WzRyCqL6/xsydR
   uMjqF3tyj3zYy6cMNaek0H4nkHpwqIoYyvvhO6yQMKrr2GyGCa58CNly0
   e4hd6wrXnPBndBQA8ag9hc9pOf/j2uXHmWRjcOhzM2gn61Eote1VS6J8R
   +vSOHYkc61eIPMT9yorJNZkvyaP/YMDkPtfoNIk+fbwfhbNYEHGUjc51M
   Q==;
X-CSE-ConnectionGUID: a46Qt3/5RzS3BPxb9gAGGw==
X-CSE-MsgGUID: d3baLR3sSm2f6OTJWsLkzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="116982825"
X-IronPort-AV: E=Sophos;i="6.25,165,1779163200"; 
   d="scan'208";a="116982825"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa1.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:41:22 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 17:11:19 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 17:11:19 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 0B97E8BC04; Wed, 15 Jul 2026 11:41:19 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: [PATCH v5 3/3] usb: hub: send enumeration failure uevent
Date: Wed, 15 Jul 2026 11:40:28 +0000
Message-ID: <20260715114028.3627807-4-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
References: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Enumeration failure is currently only reported via kernel log.

Emit a KOBJ_CHANGE uevent with DEVICE_ENUMERATION_FAILURE=<dev_name>
when enumeration fails in hub_port_connect().

Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
---
 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd3..2f2fd90aca66a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5613,9 +5613,11 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 	if (hub->hdev->parent ||
 			!hcd->driver->port_handed_over ||
 			!(hcd->driver->port_handed_over)(hcd, port1)) {
-		if (status != -ENOTCONN && status != -ENODEV)
+		if (status != -ENOTCONN && status != -ENODEV) {
 			dev_err(&port_dev->dev,
 					"unable to enumerate USB device\n");
+			device_enumeration_failure_notify(&port_dev->dev);
+		}
 	}
 
 done:
-- 
2.19.0

