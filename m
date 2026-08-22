Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728C33B6C9
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 04:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787373298; cv=none; b=FlqqlaqYyOBav4qLQznOL9j24ooh3DUNjoPoOpxI+lLmyt8wz6fYipV9KvI27KdG3lLQpzG0DL/VYfZq3ZkhkcVh8QnZhvK2YedoKCPIL+j2MRer2GvKqSGEYXyozmaNmr+//HpdWL5fw7b/x9pqn5U0fp8wM/5j9BwwAYp0ikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787373298; c=relaxed/simple;
	bh=7r5d2EHC2ViKZyH7Mim29rLQzBJFsNYoZSm+l1JWRGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1cmyAfY/8PfLPx3em+U3NdBeXDv4/ggpLA1jEbSl6BmSy4pfam2lVr8rF4mNaws5pr0/FdkYcRSB0OtNZEm6benTS67TgXgXNlO0QmLL6iME4wrVZD2BLU1eiRK5Bzm6EuejQdIOEX1kHUogKAXUY3P1P034hJfArv+YImu4Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqsFeBSj; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqsFeBSj"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7ee4f241f42so2255046a34.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 21:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787373296; x=1787978096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOQb4uVka6uDO7r/EYvABM53/riDdDZiRMz1iRGeONo=;
        b=hqsFeBSj9YdVah2YZDJ4eS+yy2w/ZAYuJIvJgkuJs6OfkPaZT0CwmDoBIgojeDHkX1
         VjOYhfyYYXV7Lmneq//GIR//M+e0zUYxMRwweT2QDs3qESODaaml2+nERboQgu00lmLv
         CfQ+IWIWdx4aHRFeIPxnIfrJ8cqKEnl84Pz5Ec2/+Ek7F2cnbgZiCG+ARdyY+4r4qtY/
         GDkcO3OdhopiDBX7b/Wxp2p9lPdFIPX9Z+MrZuAH2VoLq2RXyO72Bc+Gx7Z95g7Pl4Gj
         TbRiKrUBzHnHtSbYoIrD4dvtUeboqtVAnXmtWxjaid6HVjRWDPr48gHziwlPKOkBrBaJ
         32GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787373296; x=1787978096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOQb4uVka6uDO7r/EYvABM53/riDdDZiRMz1iRGeONo=;
        b=Gksqr0ZiGplmJeyXkuOgD5WOChzAgKk6KDKXqLM/HaaWdvNVJKZKsDiYXMR7LEMrV9
         AvXU81uh5EjSVw6BBPeFm0hFlt6STPfhfp7p1kRHaEQIZa7i0KQAXdYiqlplkpMq9Y3g
         g5s1QRP1y5b4A0e4nzYxadBoRwrmiH+0Tm6XEI4ZNTFdjlm2HzW3Ay6fLcDavY3/u7tr
         qcqmWgnkRy/BLELEiZ3dgSGWHfCJBymcZan31yDSPfdJ735BWphWXHtzhPKW3nnh17XZ
         vjlbgD4C1yB7Gjjz3nnDhwHBaPsQlyRTtbFA4kCRIDlVixReb//O9o5egI13fHpncMIo
         YnBQ==
X-Gm-Message-State: AFuF++nV3ysABffxeAk63QcN6kToWsQXsfPjE4qnbFuMEFNHZA6PXf9X
	1YsYGC+Fau+tPgBvCrJTEL6aC0c1sLr4j0x6Nup9ItRsHJzVQni6Ir265nTpFT5cC54=
X-Gm-Gg: AR+sD129lOYz/59AnxMurEK8sjRixvv6oRkwTcyPfDLjTWEP925GR1GbUU9YaBelouS
	khlr/fb4NbDSsWO3kx34hKQhSXbV1RSb4ZiGNLfOnnKxbghfdLS7tOHsNTh5S1DEWfRTe9KmJkH
	8FdvyKwk4tafS+7bpyQ1eESN0IJ/3rBIZNimVKehVPiBjwWap18amWbT8lQbfNKjOPyWPaiQ6as
	wN3MAKJKYusPn2dI30orhrsQS8GtltlrLHffjBx7V4rOBPEtBni789boEhssVy5esqhh/rV3Njq
	cjlfz9wBaIws50IOVdVtnbjjV3RMG0ETlQ5IRu73bmxXeruRuULIXxJavHC35O12D+FoTbev5m2
	B7gmXBruf5nc23MlvBv0y4RJV8LQHs1mQ0SdMyWFYviEIqF1oax+0gHGEa7vHEynMdDiDZbw4gQ
	9UyHeqXt0r9ns4ILcXnGqxJItiQ08LHLWT0gMbS1WzCNvRNcScUUKuFNYuWYA4DP+BGE8d6VSIu
	wAmzfQmcT0NhS+eCVFH24DLYdedrd30/tvnKLi3Xw3GU29kFEMm
X-Received: by 2002:a17:90b:5823:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-395c4bde19amr9418061a91.2.1787366929166;
        Fri, 21 Aug 2026 19:48:49 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c9128498sm1617918a91.2.2026.08.21.19.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:48:48 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>,
	syzbot+60740c6a17a5b5eb1f5a@syzkaller.appspotmail.com
Subject: [PATCH 1/2] usb: gadget: f_hid: fix memory leak on gstrings attach failure
Date: Sat, 22 Aug 2026 10:48:37 +0800
Message-ID: <20260822024837.2504799-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidg_bind() allocates get_req with usb_ep_alloc_request() before
attaching the gadget strings.  If usb_gstrings_attach() fails, the
function returns without releasing get_req, leaking the request.

Go through the fail path in that case so get_req is released.

Reported-by: syzbot+60740c6a17a5b5eb1f5a@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=60740c6a17a5b5eb1f5a
Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06..0aa14b99d 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1163,8 +1163,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	/* maybe allocate device-global string IDs, and patch descriptors */
 	us = usb_gstrings_attach(c->cdev, ct_func_strings,
 				 ARRAY_SIZE(ct_func_string_defs));
-	if (IS_ERR(us))
-		return PTR_ERR(us);
+	if (IS_ERR(us)) {
+		status = PTR_ERR(us);
+		goto fail;
+	}
 	hidg_interface_desc.iInterface = us[CT_FUNC_HID_IDX].id;
 
 	/* allocate instance-specific interface IDs, and patch descriptors */
-- 
2.43.0

