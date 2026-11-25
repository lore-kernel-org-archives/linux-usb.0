Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645381;
	b=tmiG8B9/5yLnRHbS7YheNBw/1kpfeNPmodBJFtKFlN1MLYLFbiKGDzhZCyBiH6HYq5+/
	 I46Mj6LAcka+J/OTzOjIvl4UJyq3lp8G7W3pLpg65cFORZy/VAyuRtQ5cdHYReHklu6A4
	 /PIghJCqNweObDvPXGlb/3YecbdaiVw2N9OyP8Ju4Ky3KLd3fU+fohklHMvypTEUpyn1B
	 Kj3VZ0yUhkmaR1r64KbmjyDmXGCNzyrxEHRpiK8KAbatN7uvA+77PJwUdAzWAeaQx4MUV
	 747oO2g0DNw9HJrn5sQNj2/Lzh0yO71fdbxSsX1MCV7mD7PdT43W/OvabtAblMkEm3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
	b=NhECGL6J6htGgYdrXmUe2TQCaeTEHkA9HGJHwVR/grSwwBLOGqNay6W27CGgYpV/TQcD
	 nwO8Wtf4BxVOA4hElYGeFJbqCdTnBCdSvJRC+YJeVrnYq0JrzQTzMYsu0NRvw4U91WJWP
	 iBKVRzcicjal4vnVQ8jYfpANgaxADCVMv898U1LPROBm9yZ+7YbQ/5sJHww1hF5/bae4O
	 RhtKKNGN7FYIb7biAIYJu1EXQWQaUHGt0hKGmKjCnBGc0ZGZxKO2RBqj9rU7AHoz0ySLQ
	 UVsOoHS6OKIj7J0l6VlcjAi4hoJJyBz0/UlOuwkdt+EaVcgEY2uSxL7D+DjkXE9C9xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CL6KyJDJ;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF81606A332
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF81606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CL6KyJDJ
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7334748eec.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645380; x=1796250180; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
        b=CL6KyJDJvrxgWGfXy5oUei2+yEspwD2M+cVwOJtfh6sS0+4NU3cs8mcjUgi6UtpLH9
         0oaj7LsK08s7gNoJrvM7d5NkgPbrjDMwre7h2Cl+dkvGNUPH2Hl4PN9IAS2tLQgpniat
         qy07Qbw+zGZHvQD1xfC3WSAQDq10KyM/3hE+vCDobQpYxvoFrhKT4E4rWjTmJjHS+1d5
         FLlLAnTIGwTCyOftz3qonltx1CZoZAaKWcPMBcwsmHPlGgy3k06CKMjBGKtvh6paZ2Ki
         doxZ5umHhx/ZUDPPSjlw2jqIMdJGb/ufsLv3B4oisuoV3n6Af7CSlunSATGTNqCsPCi6
         thzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645380; x=1796250180;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
        b=BO7A/BgzMFQfZ5mhk85dNCi6ttpKlPBulp98Bcorn1g/ggowz5ccXonkfNVK19MIPD
         mOJMseX2hQ1k6Xa/naxyDBeyDW5PQcCp4agmaUl8o6siGUKok2ENPlahzlx8zFNrWbiT
         VPGLIas68guNc9fwhaJe9KWwQGGvIkGnp10dBdDrQM6tHO5obd2FjPy//I6E82lt3VuX
         obnzmg59/NgTNUdBI4aYTbvpJMsRJ63SPqhtcBQBppB9ait2uAEzkqbpEOXFeVWN4zLI
         XBKatsw/1PKReiVDPfZ/hj6HvMjlIQXenj2j3FyyHqbSDyf/SJz87XJDLnK7oZyIqut1
         dQ4Q==
X-Gm-Message-State: APuU4Z+6zafGtX4No4jxdqWItjwMf6yiRi83XSDIGOoRIPWUym0/j1O+
	o1P/4YohlDEMPLbOp6Y3fDdfgTR/6vyIl9btG07GShvLLnfincMMXCFXzZfMtakVU0ym2etAnhq
	AhA==
X-Received: from dlgx13-n2.prod.google.com ([2002:a05:701a:cccd:20b0:1b5:26be:e863])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f01:b0:1b2:490b:6fdd
 with SMTP id a92af1059eb24-1b5568aeb2bmr16509476c88.24.1795645379375; Wed, 25
 Nov 2026 14:22:59 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222212.1434148-1-elkin@google.com>
Subject: [PATCH] usb: chipidea: udc: clean up bounce buffer and DMA mapping on
 enqueue error
From: Elkin Cruz <elkin@google.com>
To: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In _hardware_enqueue(), sglist_do_bounce() allocates a bounce buffer and
scatterlist table in hwreq->sgt and swaps hwreq->req.sg and
hwreq->req.num_sgs to point at the bounce table. If
usb_gadget_map_request_by_dev(), prepare_td_for_sg() /
prepare_td_for_non_sg(), or hw_ep_prime() subsequently fails,
_hardware_enqueue() returned without unwinding the bounce table, DMA
mapping, or allocated TD nodes. Because failed requests are never added
to hwep->qh.queue, _hardware_dequeue() and _ep_nuke() never clean them
up, leaking the bounce buffer and leaving hwreq->req.sg corrupted.

When hw_ep_prime() fails, flush the endpoint and restore TD_TERMINATE in
the queue head and any linked predecessor TD before freeing allocated TD
nodes, unmapping the request, and calling sglist_do_debounce(hwreq,
false).

Fixes: edfcc455c85c ("usb: chipidea: udc: create bounce buffer for problem sglist entries if possible")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/usb/chipidea/udc.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 98658b65b936..dad7087fc0cf 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -681,6 +681,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	struct ci_hdrc *ci = hwep->ci;
 	int ret = 0;
 	struct td_node *firstnode, *lastnode;
+	struct td_node *prevlastnode = NULL;
 	unsigned int bounced_size;
 	struct scatterlist *sg;
 
@@ -705,7 +706,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
 					    &hwreq->req, hwep->dir);
 	if (ret)
-		return ret;
+		goto err_debounce;
 
 	if (hwreq->sgt.sgl) {
 		/* We've mapped a bigger buffer, now recover the actual size */
@@ -719,7 +720,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		ret = prepare_td_for_non_sg(hwep, hwreq);
 
 	if (ret)
-		return ret;
+		goto err_unmap;
 
 	lastnode = list_entry(hwreq->tds.prev,
 		struct td_node, td);
@@ -740,7 +741,6 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		struct ci_hw_req *hwreqprev;
 		int n = hw_ep_bit(hwep->num, hwep->dir);
 		int tmp_stat;
-		struct td_node *prevlastnode;
 		u32 next = firstnode->dma & TD_ADDR_MASK;
 
 		hwreqprev = list_entry(hwep->qh.queue.prev,
@@ -790,8 +790,31 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 
 	ret = hw_ep_prime(ci, hwep->num, hwep->dir,
 			   hwep->type == USB_ENDPOINT_XFER_CONTROL);
+	if (ret) {
+		hw_ep_flush(ci, hwep->num, hwep->dir);
+		hwep->qh.ptr->td.next = cpu_to_le32(TD_TERMINATE);
+		if (prevlastnode)
+			prevlastnode->ptr->next = cpu_to_le32(TD_TERMINATE);
+		/* Ensure dQH/dTD link termination is visible before freeing TDs */
+		wmb();
+		goto err_unmap;
+	}
 done:
 	return ret;
+
+err_unmap:
+	list_for_each_entry_safe(firstnode, lastnode, &hwreq->tds, td) {
+		dma_pool_free(hwep->td_pool, firstnode->ptr, firstnode->dma);
+		list_del_init(&firstnode->td);
+		firstnode->ptr = NULL;
+		kfree(firstnode);
+	}
+	usb_gadget_unmap_request_by_dev(ci->dev->parent,
+					&hwreq->req, hwep->dir);
+err_debounce:
+	if (hwreq->sgt.sgl)
+		sglist_do_debounce(hwreq, false);
+	return ret;
 }
 
 /**
-- 
2.56.1.839.g22a8290db9-goog

