Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483724;
	b=CswfEM2Fj3XqDGcEsMxEE4wYKvGt8vMMMppEI6IT48sxwOzQrkDm0159afiEjxgJ5DWA
	 dV8lFl6CQU2lHCwN+r+Khsjqc55ZlV+H+qWK+8M66xxm7IhxYKtqxmRvZY4djvI8sxiQx
	 mC/hlGajYuVhYMf5Vwg0bCTYmSgnc8vHHPuHExqj9x8uGfmQEhOuaFeM4Q1ws8TtJpZXr
	 Ym1wM36pSzvW0vZwtvxwN9s/ZEpT4EFWvF8nL1QG0G2Mu8JeWs9FkgouIINUO596wpjG0
	 gVloWzISHHBfZpRoexQ6bDIxK8ogyIXW3z8IVrzJJIieoD3wc7woSJeDj5CbTcdof8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gsmrT1Kg0rxxGoc36p22ViQ2rJPlJwTOuRCru3tpkAk=;
	b=m9kG/aaR3xL8lxANudOYVWZ7dQcvjJLdWU5C/YG3o7QCMTD2fj2CHXzKH2oTz9CuF46Q
	 Di8ZUxhQCjIYXXjTZu/Rp7C2dKGPvXK8rICWp5GXOmAQck2hnQTNBtS1XyZVJsY3YjjUU
	 3btWVt9lS89LqOH9hcdf9z/C4gOxwdig8bfPDujfdtAP52zSasL+wXSktiDNtKWUpK+5Y
	 sKuIy14qY/i8g146OgeUP/XiCujRhKlZ0y5sllgJpvb7UgjYy9sVBIgXTKpJtvwhb7B1k
	 kg9i8WlbwDbmDZds8rlqre+kLK7QT1+JIAKisvfJK8Y9VIIjf3ICdmjTkfrVlBcIJXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyyebHOd;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F47606A32C
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 01:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F47606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyyebHOd
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc758830601so3057133a12.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 17:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483723; x=1796088523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsmrT1Kg0rxxGoc36p22ViQ2rJPlJwTOuRCru3tpkAk=;
        b=pyyebHOdCbBRcqF32gHWfW7RT039/UxtIUyZxamidXzRK+iSjdTwMG44X7w/Tx1sKk
         0uweSFGpEzolUASUPkNndXdPNZYjLOaPj2rtqniZno3LkQVs38nzSrLPhExRvcX49OpW
         FGlrzswJ9izWUPnZ5hKSrxZpsj5IiBxdG+3iTqpXulkWapXt30oTY0lqWD8UPXGJZ9X1
         3W9t6EpQTg8u9MaOvungQT0JismsJM3gbhsmscXzzTJncoaJAHq9AaXTslXLx0lN0sk0
         qCE8n7Mr+YKf276O4Kb+3FsKSCI0T9bxk56EC7hFa663mmQjsi4EEUIDz/kzWpHmbQAi
         Qv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483723; x=1796088523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsmrT1Kg0rxxGoc36p22ViQ2rJPlJwTOuRCru3tpkAk=;
        b=H1Ae/crT4rlZaTtC+QktPcwcdKiiIgWE89ERbWzDkFb/EJUhpePHh2kxkc8oevhkJO
         ZrsaPpPnv34cuRTFH1KfH5PovgAn0JTMZVBx/SoxsVk3yCg7VyDN0XcjZzH/+e2l7nj9
         oiOXy5KImeq2Lskst7ggMa8BxuJ88PzLUbAk3JXQxvBcrWRA+4FFtw74BLL7vvkx/Cii
         hFXX4bV2pqdacFv4PXwzg/1TZS1eMeJzyjQWp5AYdMWcctStsIWJtO7ZTTIi/nd5F65m
         FoXuu9hPep+f+eS8NyV7hpZH7gTQWIfS7JW//GJ4QSz16qxi1KcZdxLE/SvGu4vUHNyJ
         EG3A==
X-Gm-Message-State: APuU4Z8oNurIIwCmFOd4WNssxr5G7UZ24LfB33sKw773jWAts1EDHx3L
	eVoB92kuJ8VfTTrD/D8CLFikw4aqIkQS12765rlykgoFCueiIagtHSqvToE+UgezO1U=
X-Gm-Gg: AZFdTZcTGd0JPrxT78BE2KB7fvZh6ZGapmc2D43k0PHAcG5zm7c3T8CjLFJD+HGDPtd
	jxNuQ08p0T+W+vCfhG8xRd4fxfwNZjd/5NiuWh62rk5EM0Lc+bnL9Hb//btNQN4EhY8WHnT7BJ3
	M0TmB0YsQsXco28faoFIMFXhELTnJXAKQAROxPgh7FRloLHes7pOPETnY404K1lGNf7VlXP1Ak6
	9uJYyeLQPiVcLc6KdmZaXcTpls8hLBHMA8am1ygT5+90ZF1DIYqH2TOfW360JCS8h5oMqgAMmNI
	wJcp4+5pfz5j2DDq0r6d9zhai40PRHkpUOQV4JWXNCHJWGneGpxc3F3naTwUUgKuqKZI+iHBPlT
	a/uCjjPKpVVNwRrEsZ9bDcDdXar4nZGVPo8qjRjLcgdQkmYwQIZJ4KiRnmZiZxGso09jBBps3C8
	KkhBNnz9F8zDrGyOKG0Le5ywi5Wa9vLD3WoGHxyMHBTHBRfi3+6nWoT8TOTOj0QAeiuj7gqGcO3
	PLe+yDcxLDcV1Y3Pn8/oiHKhZZ94whzxzcAdCMHxRiVzn2Wr/tRTd1o2zqOnJRnB/Xo8xu9BDz3
	yV57eYx3G7uF9G+3Aw5Ks1YgBNrVtGyl20AQ
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id 98e67ed59e1d1-3b41c8fa9c8mr11382841a91.23.1795483722909;
        Mon, 23 Nov 2026 17:28:42 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm3954665a91.5.2026.11.23.17.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:42 -0800 (PST)
From: hanzhijian1991@gmail.com
To: linux-usb@vger.kernel.org
Cc: andreyknvl@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Subject: [PATCH v3] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Tue, 24 Nov 2026 09:28:37 +0800
Message-ID: <20261124012837.2071714-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhijian Han <hanzhijian1991@gmail.com>

gadget_bind() allocates an ep0 request and stores it in dev->req.  If
raw_queue_event() fails to queue the connect event, the function
returns without releasing the request, leaking it.

Release the request before returning in that case.

Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v3:
- Move the changelog below the --- separator and drop the duplicated
  entry, as requested by Greg KH.

Changes in v2:
- Fix author name and add missing Signed-off-by (full name), as
  requested by Greg KH.

---
 drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..33d70b552b6d 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -316,6 +316,8 @@ static int gadget_bind(struct usb_gadget *gadget,
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
 	if (ret < 0) {
 		dev_err(&gadget->dev, "failed to queue connect event\n");
+		usb_ep_free_request(gadget->ep0, dev->req);
+		dev->req = NULL;
 		set_gadget_data(gadget, NULL);
 		return ret;
 	}
-- 
2.43.0

