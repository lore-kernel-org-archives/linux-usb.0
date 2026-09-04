Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF36351C04
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503419; cv=none; b=S6ujyuoU83z+MoIYf/CycjJQBSiPfhc3WhaduiZuKT4RvNUax7TtcPtsuPQ7DaKOT3oMuIUap/abQfXIDcg9ID0wtMqkzYezUP93CaktG/U5J8HaZuTECkoAG6AYIwq7BocFr8QLBciDVknEdWYsNFSm5I6jTUTYL/1ZwzpZrMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503419; c=relaxed/simple;
	bh=rU9GijAnZNSVach+qXSdgMd/Qvt7XVjZRVLzqVSb9Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGoGdtpUI+1TA2fdwRcP7WZypHUzZjUAOEqtSwYuI+HsAuku0yc8fOsbfdAZITO3vAoYFEcWHoUqZUYJOqyDHrUrd4KWgqwtPHWtRkl9JEi7fta9jhRPlnF5XC9r1+X4jpcLWOC88VbQj5rhyL/eit9iIV4pw3bCoRsFIV0FUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZwRFsGx; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZwRFsGx"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc147d86bebso693734a12.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 23:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788503417; x=1789108217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWmGOPT3T1V0QbR4ZU9i41fdA26ZNjTQm+SJiNpfKWo=;
        b=EZwRFsGxaYlCUki/7rpy9xHvhAla7iGiemlleP9iL0PjxFJFps9qgusE9/0bMV9E7z
         gJzwg6R0SXfZ4ui8C9aduMICfrYxRrbnetHA4Wyl6A+wQkRvZJBaosOaSlf/vYofp8Xw
         fDdY9YOHWnxAHgE0Ibx5PlIDkxHiVOz4+FWnSisQFW7faH4A93Wf1VTBiBL7mZGrFG33
         2zT4vOIJ9Vlh3qVy9+g0dsXx8c2y9obw8UxfbXQEWzAEl9zHx1AhdHsn2UBwaj8gACpx
         utyxSNpSp9HWkdifz8PGacF/sLZsBlMFBtFYA0UBY1WpZBPFOxUo6fwmp6uDLxccY1Ue
         WUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788503417; x=1789108217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWmGOPT3T1V0QbR4ZU9i41fdA26ZNjTQm+SJiNpfKWo=;
        b=Jp82YyuSBranySoD+kVBkDQfA365LEHby9kA62HfOI5wg6D0Aq1hqlK5pc39x0Esvm
         FOxzSCI3bITfMljVzZ5PO0lDHYyZcIhV4Y+fwGqFEH24yx0MBKjRvaI8qYUprycEB5A4
         plRNUTERTzOpy1xl4byXKMdpq1yHlXAa8rRWQr3iIGIKX0WKS0lsiWxZDfCZkxDYEUKp
         oJxkyD+A9CL3n81rzKnCpp3bd9whaRmDFOccoCLpDc6h1zXPt1eDaJtWcyC4AfBE/FAG
         DEj334pobkGxGrn7Yzmy2MBCNz8idkOV4jvBWaqBP7gWHrGy6XIcjshXN+KHk/fYtmDe
         MSvw==
X-Gm-Message-State: AFuF++lJiEoHUIR2zPLU1fn40R5LzlX1BCkDIt2irwqsh6IVGFJm7Lzx
	ANqVTJYT5cSxx+NLctZ8wv1IrlVd1adi4PfE5TqzU6uAtyPbPMBZsFhkWKiCb6t9NFuP1A==
X-Gm-Gg: AYBFou0LHieVysMXUQ3yv1Pke8riLwHtJT6ZfYETfB0NBcZk/R0ZrIn1juISthtfnWd
	8zUvQFsptSIddEOqvTXCmOYsPRANiLsDxi8TRUEIdGDBjfrvsqBloH1wj+eO0j7s85QWCLUp2nu
	7bAgDXoWKJqX6LaPgCZ8IUoXpVaC8E04KJc6O8qycX9Pn3wGvFSRMuL/y/on3st2Md4Wccyn5gK
	yepVjxLCwpu+EZfGD5RF2wLbG0YZ8G9d0C+96TKn9B0ebYCEnl3Ah/NTJZ8wlDR6G9f4vrtg1hU
	CxbFPumvcLh0ge0lBcThKMSVJ4MFHwP04VMjzOiZSDczjDLim3V9OZS+pc1mv9+olNDD+94fVbf
	i6QgWKiTlGdOvtqd81gxVVLlYYRwVFfxoR7TZdFLBJb9stRvOElZc3758CZglefNtlERr6TpAhq
	g+5C6YQ12i7xankymiFLa5fAcTNR2nsCyqX5t5Zfpj5XSVA5a2rocqYKgeEd95aXZi4FKYPNlV8
	P1NFRVU2We08dUMp2JwBGpacjKIkwE9zh29W4V1GLu0SShBGu0wPvbi3byYuprRVPw=
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr12637501a91.30.1788503416886;
        Thu, 03 Sep 2026 23:30:16 -0700 (PDT)
Received: from codespaces-1adab9.3gx5x4kts4veljes22u4ri2f3b.ix.internal.cloudapp.net ([23.97.62.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm9005084a91.10.2026.09.03.23.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:30:16 -0700 (PDT)
From: rivaldihormat-debug <rivaldihormat@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rivaldihormat-debug <rivaldihormat@gmail.com>,
	rivaldihormat-debug <rivaldihormat@example.com>
Subject: [PATCH] usb: core: devio: add defensive bounds check for len2 in do_proc_bulk()
Date: Fri,  4 Sep 2026 06:29:58 +0000
Message-ID: <20260904062958.19404-1-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although the USB host controller hardware prevents len2 from exceeding
len1 in normal operation via babble error handling, add an explicit
kernel-side check to improve robustness. This helps prevent unexpected
behavior in virtualized environments where emulation bugs might break
this guarantee.

Clamp len2 to len1 if it exceeds the allocated buffer size and log
a warning message.

Signed-off-by: rivaldihormat-debug <rivaldihormat@example.com>
---
 drivers/usb/core/devio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425480..9d8930853e8f 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1343,6 +1343,10 @@ static int do_proc_bulk(struct usb_dev_state *ps,
 		snoop_urb(dev, NULL, pipe, len2, i, COMPLETE, tbuf, len2);
 
 		if (!i && len2) {
+                        if (len2 > len1) {
+                                dev_warn(&dev->dev, "USB returned more data than expected\n");
+                                len2 = len1;
+                        }
 			if (copy_to_user(bulk->data, tbuf, len2)) {
 				ret = -EFAULT;
 				goto done;
-- 
2.53.0

