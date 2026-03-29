Received: from mail-m49232.qiye.163.com (mail-m49232.qiye.163.com [45.254.49.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F42D5A01;
	Sun, 29 Mar 2026 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776652; cv=none; b=Ss2kGlUSkbcgvmoeD6/WSFO9kK1sN5J3VquX0HQZq8n9883thPB3XF2mtzHozDe66ddjeqNkvjRlVn9GVKc0c3R0xIqrZDqWbBaovok9JxrpFnM7kZKgyHHq8lf7ycxYOsxjG1ohm8MI6mKFjgKCODrfMiR9bJYSkITcZ8fhlKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776652; c=relaxed/simple;
	bh=z5U/11YNCgx8Gqmuyc3q7ZfnPCuwOZ7yLuIdoN4ieIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRliobt4p7ilHPJSXUerpUoGzoJIbe13L0It0s7jLonydkgjTtcjSboSNHVucc3sCvXrQ3RgFyy7uxDTk+FWIiq+0RLBMf9k2t8X68iH40jACPOARMN5aV9qY/zyUlxdRYsXtECErea91b80VhlqisWbzzywaQJrr/hEuaUVtCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com; spf=pass smtp.mailfrom=autochips.com; arc=none smtp.client-ip=45.254.49.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=autochips.com
Received: from H20F120008.autochips.inc (unknown [223.244.89.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38aeab9a7;
	Sun, 29 Mar 2026 09:34:11 +0800 (GMT+08:00)
From: Yongchao Wu <yongchao.wu@autochips.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yongchao Wu <yongchao.wu@autochips.com>
Subject: [PATCH] usb: cdns3: gadget: fix NULL pointer dereference in ep_queue
Date: Sun, 29 Mar 2026 09:34:04 +0800
Message-ID: <20260329013404.116481-1-yongchao.wu@autochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328143842.57315-1-yongchao.wu@autochips.com>
References: <20260328143842.57315-1-yongchao.wu@autochips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d373a27e703ackunm5c23841e226bcb2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSx0ZVkxLQk9PSh9IGBlJQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUhVSU9PVUNCVUlPTVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG

When the gadget endpoint is disabled or not yet configured, the ep->desc
pointer can be NULL. This leads to a NULL pointer dereference when
__cdns3_gadget_ep_queue() is called, causing a kernel crash.

Add a check to return -ESHUTDOWN if ep->desc is NULL, which is the
standard return code for unconfigured endpoints.

This prevents potential crashes when ep_queue is called on endpoints
that are not ready.

Signed-off-by: Yongchao Wu  <yongchao.wu@autochips.com>
---
 drivers/usb/cdns3/cdns3-gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index d59a60a16..96d2a4c38 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2589,6 +2589,9 @@ static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
 	struct cdns3_request *priv_req;
 	int ret = 0;
 
+	if (!ep->desc)
+		return -ESHUTDOWN;
+
 	request->actual = 0;
 	request->status = -EINPROGRESS;
 	priv_req = to_cdns3_request(request);
-- 
2.43.0

