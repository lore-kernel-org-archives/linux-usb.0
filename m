Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2973B0580
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634179; cv=none; b=N/nYXY1DIqLNH1qvB5duL1dB39W1VDmH9LeB+PdN09arCXpXF53CqKuPCwNamHiMXb8u0c9jbvvWol2gai1HQeLxPrStO3fkJBEPp7j1IS5WFYIna8cvxGnrAbm+4t3aVFH/1MColR3HrYGBtgiKKLxPesTrpCV+lzZWKmzPGPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634179; c=relaxed/simple;
	bh=FVTaWR/ga76Scj9mFZDHQ+jLYrcJNLvhqU/P0N7ZXp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yt5U4dYpBqA5HhGpTitmrlXnzxBJY8VVdEoGuY7tarI0eeGH7D+PSP8O7NiaAlEYvAbdabbCib1OEYyX4VLDbf2zjIEeVVHlfO433hLcCKgiECutB4RX1rUsY3vBMvHU8hcbl71S0K/9mPNJ0bjEKXEa/hhQQ5if8Icpc8By6+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ED4r2LsI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fW1kZKOj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ED4r2LsI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fW1kZKOj"
Date: Thu, 17 Sep 2026 10:36:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789634167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mYmQSvWxf6U3eatPaHkMSWv2Cua8aDYBNZWET07Aa88=;
	b=ED4r2LsIN3BcdHuSx9EaOSR/w0nOVqfmR3Bboah4pyHX4Zg8udOQw7EC0HetDMYe/uLATJ
	DYCbxEd25gid9sZWJf/Pha47fOvXM8ZFohapRMC6riwxgrgYlug09gy0DjaMX5j/BTXYf5
	OrzEtEsWbAeCsxc3rKCKyOQCBqtUSNiaScPMPQ3sQUT4eV+ag3uKuW6SlbspRWxU3M/S94
	hAt8e/UhqD1ktNURapiTL9BkI116ss6+b5lOzdu6++0iqObs832d/9h6ZR25q08c+uNK8+
	QRcc0q2+KhRQ7xxrlLfCsIsxAsRyeAwtqKodkMN+DZejX8NXq89/PK937LXMAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789634167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mYmQSvWxf6U3eatPaHkMSWv2Cua8aDYBNZWET07Aa88=;
	b=fW1kZKOjphB3tAPf354SKHBBT+o1RZHkQjqudNqdN5s4cc522vaB7rw7Y34XKH2Q9SO2Ob
	jd2tDOgTh7SlXNCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-usb@vger.kernel.org
Cc: syzbot <syzbot+de553c19cb054f174a35@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: [PATCH] usb: udc: Make tracing aware that usb_ep_alloc_request() can
 return NULL
Message-ID: <20260917083605.Mhw9QnUN@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The alloc_request callback of the EP can return NULL if it was not able
to allocate a request. This NULL pointer will then be dereferenced by
tracing in order to show details about it.

Let tracing check the req pointer and if NULL just write 0.

Fixes: 5e42d710a108c ("usb: gadget: add tracepoints to the gadget API")
Reported-by: syzbot+de553c19cb054f174a35@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6aab0160.e91c2013.3bdb06.0005.GAE@google.com/
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/usb/gadget/udc/trace.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/trace.h b/drivers/usb/gadget/udc/trace.h
index fa3e6ddf0a128..05533eb1bae0c 100644
--- a/drivers/usb/gadget/udc/trace.h
+++ b/drivers/usb/gadget/udc/trace.h
@@ -239,15 +239,15 @@ DECLARE_EVENT_CLASS(udc_log_req,
 	),
 	TP_fast_assign(
 		__assign_str(name);
-		__entry->length = req->length;
-		__entry->actual = req->actual;
-		__entry->num_sgs = req->num_sgs;
-		__entry->num_mapped_sgs = req->num_mapped_sgs;
-		__entry->stream_id = req->stream_id;
-		__entry->no_interrupt = req->no_interrupt;
-		__entry->zero = req->zero;
-		__entry->short_not_ok = req->short_not_ok;
-		__entry->status = req->status;
+		__entry->length = req ? req->length : 0;
+		__entry->actual = req ? req->actual : 0;
+		__entry->num_sgs = req ? req->num_sgs : 0;
+		__entry->num_mapped_sgs = req ? req->num_mapped_sgs : 0;
+		__entry->stream_id = req ? req->stream_id : 0;
+		__entry->no_interrupt = req ? req->no_interrupt : 0;
+		__entry->zero = req ? req->zero : 0;
+		__entry->short_not_ok = req ? req->short_not_ok : 0;
+		__entry->status = req ? req->status : 0;
 		__entry->ret = ret;
 		__entry->req = req;
 	),
-- 
2.55.0

