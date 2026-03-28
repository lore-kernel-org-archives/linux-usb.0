Received: from mail-m32109.qiye.163.com (mail-m32109.qiye.163.com [220.197.32.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFE29CE1;
	Sat, 28 Mar 2026 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709058; cv=none; b=Vj2uKzgLDU1uQrbUWZUaQTv7MfEzNEOf/WH836NBk29EtC407GbVj+LIMf0wrWDt0HAulf1iq7KqinLHoMi83nWXaiG27JYlIvj3Q22/PWHF9qO0rpz8ujByd6ARzzZJQtFdoGhQ1M482fAldphfEUX81vAlkHVtJEIlT/KbPlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709058; c=relaxed/simple;
	bh=2xGKPRn8ybKFA7Ha2cQt42mt1WGtinA7WLww0ue0DlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Og1N7fZnIBY6AYUptmFoBpthvTEswS9tnKQljsl6JU6jnUAWje28dHPk81iB85uy44ymPES9OgLFwtcHsJ+131SS76VMfkVxB5IrE4yyT6SrWHUF4K1Bni8wgCWbqmnCnqZbytBCWJgqbYdRpFf9P8JVfzoJmT3duHpHrW+1s5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com; spf=pass smtp.mailfrom=autochips.com; arc=none smtp.client-ip=220.197.32.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=autochips.com
Received: from H20F120008.autochips.inc (unknown [223.244.89.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38a953000;
	Sat, 28 Mar 2026 22:38:56 +0800 (GMT+08:00)
From: "yongchao.wu" <yongchao.wu@autochips.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"yongchao.wu" <yongchao.wu@autochips.com>
Subject: [PATCH] usb: cdns3: gadget: fix NULL pointer dereference in ep_queue
Date: Sat, 28 Mar 2026 22:38:42 +0800
Message-ID: <20260328143842.57315-1-yongchao.wu@autochips.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d34e2412a03ackunma03160fa21786b1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEtJVhoaSE9ITksdGBkYH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUhVSU9PVUNCVUlPTVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG

When the gadget endpoint is disabled or not yet configured, the ep->desc
pointer can be NULL. This leads to a NULL pointer dereference when
__cdns3_gadget_ep_queue() is called, causing a kernel crash.

Add a check to return -ESHUTDOWN if ep->desc is NULL, which is the
standard return code for unconfigured endpoints.

This prevents potential crashes when ep_queue is called on endpoints
that are not ready.

Signed-off-by: yongchao.wu  <yongchao.wu@autochips.com>
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

