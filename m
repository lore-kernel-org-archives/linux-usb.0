Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D56388885
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798556; cv=none; b=scihwaxXZH/VPSGqMkD39L4rJUQ+C4e5pRiIIuRIm03Z87J9KENtpibw/VjaQtVhkUg6o6TSleCM6yGA3Uzpe/VbGP+TUMKkhXe5HC6B2vNqs7de/tOAFrHsiCMwZOh0mSFNRZazhJoYCkDXe+gHAUptFGwjZkVtOWntGZ60zh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798556; c=relaxed/simple;
	bh=FVTaWR/ga76Scj9mFZDHQ+jLYrcJNLvhqU/P0N7ZXp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VHtAML91gOg6VTFwngf6OmDnuAPUiO10kOSQMhJGCoGlAJGklOYeksEhOiEH9miAc/XqDInOQ5VKnHkAqnSClJmdvEWT1JABZ5tymkQd137cPea3aX47qDIaZTHP8Sw90yN2B5nxXkBEl6ojlb3DKBKj494NPZ9quFLHtyr1uMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DhkAwnb9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oIqRODAK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DhkAwnb9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oIqRODAK"
Date: Mon, 12 Oct 2026 11:49:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791798552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mYmQSvWxf6U3eatPaHkMSWv2Cua8aDYBNZWET07Aa88=;
	b=DhkAwnb93ddepst8aI48GWmH0JU9oYAgUlufj5TotVvkYoyDCwb66A4Dp5+9A2zZpEmpPp
	IT/BO3KUANWkC72lq7k+YvAhV4hc1ioBROXlR11TUmOtYdNFfMfaPrgwrYdSO/r4SbK7MM
	PqHoJexbwcfoPMGzZyFvxtnKvd9rAZqwiVtKCcxPkexHKEmDnONIE6AmeFXNTPjhNDh6Kl
	zOhaYjS3SQSzUBh0mtKOrZ7fYCo4MTopNMygel/aSF7A5Jdef7a8U9VmroHG3N/5nBM6RA
	T/Rpv8NKCvOyB/e9e0gpcu6Xbs/oGQB81v29T3r1+zTSr8wWx/5jaIr1+zEtSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791798552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mYmQSvWxf6U3eatPaHkMSWv2Cua8aDYBNZWET07Aa88=;
	b=oIqRODAKEExoygjXho6DbWjZ3xTYcLI6zOGCqpi84UMY9FHe4I6Pj4f1j5liBFu666ZX1Z
	pWlc+pJATBys+aAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-usb@vger.kernel.org
Cc: syzbot <syzbot+de553c19cb054f174a35@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: [PATCH REPOST] usb: udc: Make tracing aware that
 usb_ep_alloc_request() can return NULL
Message-ID: <20261012094911.wHPc_9lJ@linutronix.de>
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

