Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F547390204;
	Sat, 20 Jun 2026 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781957230; cv=none; b=ZUOr4YPnZg34TDWiMIeyZJsKQ+dxcn/hrqgtY5/qKlo1/580pquGvQB/CJp25jw2DsIXwNSROtDtWujBe+qmNuzfTFZ4s3NBsOs1qp7Kn3zhZMIx7ywnbcNOwlpVyMzou5YGyYTw9SzaPmnKP3yo6mgwVREzXW8PCt4lZozYHtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781957230; c=relaxed/simple;
	bh=rGIqfzRZGXtaMLH9oTBV6qozmK1WhvuQO0GFO1VmVpA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=omZ/9wPf1fUd13OAL3W6/S1EhxxUkyMpe5BQ/hRcJD2SmxUZI9ArP+OxcjYF7QKUXHYOW4C3Wp961Pv8Z2HJuAqItrbD+yh4juWaiFcRngU2gCh7yKxDVusrw2UDtmfoqfssycgEbWsFoHYhpDkkFLYD37jN7fSSoVBKJ7OhkCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nWsolaHb; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nWsolaHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+K
	TI0mDZMF3AYyK23FmAyqNncU+sjW5XAXd7jr2Trm4=; b=nWsolaHbpdr7QNCQT2
	vitVIKVmkd1qooYJJyWIllifZFvgE8AaDV+uEZ8aqf8Pf9Tz9IjWkq5QycW5AQQY
	pdksl2X2Ztb/2kCJQaIIsIQUsPGlb0I3USNVHWRgVXL6uw0TLG7xhk3xw0d9S2zX
	qqfEjMUQz5yznY3D0lp7DMXKw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3ROVIgjZqsf9PEw--.43408S2;
	Sat, 20 Jun 2026 20:06:33 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: kees@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] usb: fsl_qe_udc: check qe_alloc_request() failure in ch9getstatus()
Date: Sat, 20 Jun 2026 20:06:31 +0800
Message-Id: <20260620120631.2894977-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3ROVIgjZqsf9PEw--.43408S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw43XryDtrWrKw43Gr4rKrg_yoW8GrW3pF
	W5JrWjyFW8Zr4vya1UJr4kZa45Ca97Cry7KrWIq3yS9FnxJw4kCay5Kry0qr4xAFW8Gr42
	gFsYgrnxAw47KrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRqZXUUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxQnaSWo2gkkr-gAA3d

qe_alloc_request() may return NULL on allocation failure. ch9getstatus()
passes the return value directly to container_of() and then immediately
dereferences the resulting qe_req pointer. Check the allocation result
before using it and stall the control request on failure.

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/usb/gadget/udc/fsl_qe_udc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index bf87285ad13c..603c77ff129f 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -1945,6 +1945,7 @@ static void ch9getstatus(struct qe_udc *udc, u8 request_type, u16 value,
 			u16 index, u16 length)
 {
 	u16 usb_status = 0;
+	struct usb_request *usb_req;
 	struct qe_req *req;
 	struct qe_ep *ep;
 	int status = 0;
@@ -1983,8 +1984,11 @@ static void ch9getstatus(struct qe_udc *udc, u8 request_type, u16 value,
 		}
 	}
 
-	req = container_of(qe_alloc_request(&ep->ep, GFP_KERNEL),
-					struct qe_req, req);
+	usb_req = qe_alloc_request(&ep->ep, GFP_KERNEL);
+	if (!usb_req)
+		goto stall;
+
+	req = container_of(usb_req, struct qe_req, req);
 	req->req.length = 2;
 	req->req.buf = udc->statusbuf;
 	*(u16 *)req->req.buf = cpu_to_le16(usb_status);
-- 
2.25.1

