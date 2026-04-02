Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1BA1B4224;
	Thu,  2 Apr 2026 02:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096095; cv=none; b=VA1spXh0mQzosVQId0PEPU4p0eJlX5IglgL5a21TuV4At0WqbWkxsOOMl0jOQWedz6QWMRdOSBLATSQK37dUYrUfk9snEARyWl5W7K6iHc8ev8hPrGh8S5wtjk/90i+EzEaYqIqL5Ci6tA1jKqnEVY1haQTVB+Ra3UpsZppiWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096095; c=relaxed/simple;
	bh=b/OXsoo0CVevj2L/jQepFRvWMjRjoNn9amU8TR5hZEI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tU4MWb3CegL0HTevXjTvZx9qMgqmFMkwaUdbgT6x6+UPeld4hUv3qLmberNDd1LJ9RLMsAWlZycGgVq/Pc4zWwGleQFANZg/H3jt8fWyobnrXpfpX5jDpwIrl7LfYXtfO2a5kP9I37jBhBV20xc7ExccNKWGGdOareQVsOC4ZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HX+dOX4L; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="HX+dOX4L"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/AJjsv6osL6nIUXhjXTdfF7UVHGATEdaHDeUN6cVQH8=;
	b=HX+dOX4LDEaPsr1pwu0IwILEh8j5B0CvzaTGv7Ngo4456xSKUJFPlCYrTv4jyaCFcJhSHDKzc
	rUiNcQAPl77hWgcP907yvAy0m+qllQzXEadlISSADtamXRARkD2qhayVvcGk8PDP99N0uJNbgkD
	cPC8+pB+BL+tRji4LeexPRE=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fmQJ03p8zzmV8k;
	Thu,  2 Apr 2026 10:08:32 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 38D1F4056E;
	Thu,  2 Apr 2026 10:14:44 +0800 (CST)
Received: from vm7-217-32-6.huawei.com (7.217.32.6) by
 kwepemk100018.china.huawei.com (7.202.194.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 2 Apr 2026 10:14:43 +0800
From: Tao Xue <xuetao09@huawei.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<caiyadong@huawei.com>, Tao Xue <xuetao09@huawei.com>, <stable@kernel.org>
Subject: [PATCH] usb: core: Fix bandwidth for devices with invalid wBytesPerInterval
Date: Thu, 2 Apr 2026 10:14:00 +0800
Message-ID: <20260402021400.28853-1-xuetao09@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk100018.china.huawei.com (7.202.194.66)

As specified in Section 4.14.2 of the xHCI Specification, the xHC
reserves bandwidth for periodic endpoints according to bInterval and
wBytesPerInterval (Max ESIT Payload).

Some peripherals report an invalid wBytesPerInterval in their device
descriptor, which is either 0 or smaller than the actual data length
transmitted. This issue is observed on ASIX AX88179 series USB 3.0
Ethernet adapters.

These errors may lead to unexpected behavior on certain USB host
controllers, causing USB peripherals to malfunction.

To address the issue, return max(wBytesPerInterval, max_payload) when
calculating bandwidth reservation.

Fixes: 9238f25d5d32 ("USB: xhci: properly set endpoint context fields for periodic eps.")
Cc: <stable@kernel.org>
Signed-off-by: Tao Xue <xuetao09@huawei.com>
---
 drivers/usb/core/usb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index e9a10a33534c..8f2e05a5a015 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1125,6 +1125,8 @@ EXPORT_SYMBOL_GPL(usb_free_noncoherent);
 u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
 				      const struct usb_host_endpoint *ep)
 {
+	u32 max_payload;
+
 	if (!usb_endpoint_xfer_isoc(&ep->desc) &&
 	    !usb_endpoint_xfer_int(&ep->desc))
 		return 0;
@@ -1135,7 +1137,12 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
 			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
 		fallthrough;
 	case USB_SPEED_SUPER:
-		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
+		max_payload = usb_endpoint_maxp(&ep->desc) * (ep->ss_ep_comp.bMaxBurst + 1);
+		if (usb_endpoint_xfer_isoc(&ep->desc))
+			return max_t(u32, max_payload * USB_SS_MULT(ep->ss_ep_comp.bmAttributes),
+					ep->ss_ep_comp.wBytesPerInterval);
+		else
+			return max_t(u32, max_payload, ep->ss_ep_comp.wBytesPerInterval);
 	default:
 		if (usb_endpoint_is_hs_isoc_double(udev, ep))
 			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
-- 
2.17.1

