Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486E1445ADD
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789940273; cv=none; b=CPIYfkQq6tuxWDWhiYGpYyCGeERAPsgqWwh7KxRKDfnl/HlVg4j39SsYFuxHadSW7Ujy6AUDekRgzyi153hMeG+IezDgg85n+GwLtVJnact6ISszleFmOm3nexcicV5sFKCNMWvQg9DVCpTcvFuTxiEJDFLANqKo4Qh4x+0ym0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789940273; c=relaxed/simple;
	bh=s0Q5tip44trGr38adqM22DGhadgdeNXvLm37DOIyJDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRzf9GrXoZULjHj4iPKm3lojQf2rDH3co2U5NiDlGJPpETeTAm+QHohB6LmU+LwTjvcykATTBT4Y8O0jMWcyAGx4hR8ymX9j5lunnqRQxSWTfAc+CdT4G14LFZwBiX8ThPzVXkcvc8hPjZw9hYyZc2FZavvyoMKKATaQ37sCjik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=d8QkbWS6; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="d8QkbWS6"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109fafd6so210801985a.3
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789940258; x=1790545058; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeHbgpVbK+Deds9/bB15M5SsuCHQ0SNMcqyZTmphE1Q=;
        b=d8QkbWS650S2jQ4VCc0g33ySZ5BdPAR/Mq/AgeDUDcq7jBilVI2EXKVLK7tsMsEjQI
         lTwAlta4Tk533QQ7U7fQHeW5AB/Nya/as+aEn6goKiuixXz4lyfoo0xKKTbGqqeMDB/K
         l0PfIICGDia1JOusF+TXgDR+CE6fWOqpFl+kD1rqyLU3sWvFvy9FTs4TFORJMxX0Wemy
         Jrz1f7pZgSTapSLJpymrWYTNXG1JoU32W0DwxyROlmPbwXKmkfa0tqwEl46Oa/AAUSkO
         Sn8tRcnYUDasgHZbSmSCPHwjLbr7fcrTKtXlMNfPvcTPJajV2RTDm1gD6F/wqy1MswYh
         hlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789940258; x=1790545058;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeHbgpVbK+Deds9/bB15M5SsuCHQ0SNMcqyZTmphE1Q=;
        b=xNktOqwupKT3mvd+0l+cNINuSpzUkiBMi/oPUBDSDpj92jLAvpstd+ne8ttbxx3ZdD
         pTwqMI034zZ37hrjSJKHdFjncAxfdC0hedPcYQ2uTtsgrcnWJvTaqWXlK9z4WqcYqDXD
         odXy70Fr3MsaKNfDCmBosspsDaBVtPXrbXRS2hBsrJ7FuhRa1zyCvBOpa+kAYPKd2OF2
         1+VQL0+Icc2W+IrNlBMJdYUtCvzsgeuyxdq6yKuO4O9jo9BdBF4iUBJWkEy1trYhQoV9
         4ajkPA9D4jwD4FYqq63qHQtxUJpYQ0jvjk66sJq8DWct0OvSBQiKs9apJkl9f6GwCA3C
         GAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxilFfs3fVhZ/DKxy6hAcZccONhk8Z9rjKHuHbjmGewnezHW3WQZw+lSKB/a3ace27Jcsf8Od8nr5I=@vger.kernel.org
X-Gm-Message-State: AFuF++nihdf0lPLcJ78TWBGAs2wkN+Ibmsnke28rL+zXIBZsV7EjnIom
	igaPWDTiN8owZvmiilokAV58AM/LteNNQBW/s45I5aGe7pQIZqxhENntlyxsxoL5RQ==
X-Gm-Gg: AYBFou0lV+dMWMtcxIlRGaGDhzvlPxltoqauVFQB/brTAloKLRWHm1EvDSv8WD5o56w
	4LeNzK4q7HM4VESsGeYRnQks4PMYZVXnA+c25igptYBYPgmdX34FGp/uuzbMRQ7P9XGf1tosjWP
	Wy8XBqVNji2gJ1daQs0GNqLfdJ0lzNQF5M28VeKw9b2t7uLOm/OMQ/zKXb9cyPhMQbJBqq5wDqH
	kkk1dASpT2Qg9ljQzH2Njff2BFS1uBVB05KRm9QlySK07iPeiL/6cLlI1kHnA5edVbhwcwKQuTb
	y0c3GlWt7/T/5BDRVzM3ziGTKwMUOpI4+A0D5DCshyHBEmt9ukbvFIJrE7gjdS6NHHHuMdNNZxH
	CrYIocd+3gpXBc4uirrrzh4wltUgHJCwHiVZWJJCrN8t7MV104fy0T2GH2BEUxMLKVdhzl4h/do
	/2tlbLe6B98uVl1vXQGXoaf7I0MKTfVeOYgs5rwj7HnS5AXkjkr8JdOu2NLpbllkfaARmBdRS+V
	sO4ySUAJw==
X-Received: by 2002:a05:620a:bcb:b0:939:ab90:8f6a with SMTP id af79cd13be357-93bf5558346mr745163785a.18.1789940257815;
        Sun, 20 Sep 2026 14:37:37 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bf0215773sm454451085a.6.2026.09.20.14.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:37:37 -0700 (PDT)
Date: Sun, 20 Sep 2026 17:37:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Minseo Kim <neck3922@gmail.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: gadget: dummy-hcd: Fix wait for outstanding request
 completions
Message-ID: <f23b9e1a-f110-441a-a1d8-95f442ec09d5@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The dummy-hcd driver emulates synchronize_irq() by waiting until its
private callback_usage counter drops to 0 (with the private lock not
held).  This counter is incremented whenever a gadget driver callback
occurs (which requires the private lock to be dropped), but not when a
request completion handler is called.

This is an oversight.  Request completion is triggered by timer
interrupts (emulating device IRQs in a real UDC), and the interrupt
handlers are supposed to have completed when the synchronize_irq()
emulation routine returns -- they aren't supposed to be in the middle
of a completion callback.  If this happens it can lead to a gadget
driver's unbind routine running before all outstanding request
completions have finished, maybe even allowing the gadget driver's
module to be unloaded while a completion handler is still running.

Fix the oversight by incrementing the callback_usage value across
request completion callbacks.

Link: https://lore.kernel.org/linux-usb/7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu/
Fixes: 7dbd8f4cabd9 ("USB: dummy-hcd: Fix erroneous synchronization change")
Tested-by: Minseo Kim <neck3922@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Cc: stable@vger.kernel.org

---

Note: This patch does not apply in its current form to commits prior to
d5e5cd3654d2 ("usb: gadget: dummy_hcd: prevent fifo_req reuse during
giveback"); it will need to be rebased for the -stable trees.

 drivers/usb/gadget/udc/dummy_hcd.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -343,9 +343,11 @@ static void dummy_giveback(struct dummy
 {
 	bool fifo = req == &dum->fifo_req;
 
+	++dum->callback_usage;
 	spin_unlock(&dum->lock);
 	usb_gadget_giveback_request(_ep, &req->req);
 	spin_lock(&dum->lock);
+	--dum->callback_usage;
 	if (fifo)
 		dum->fifo_req_busy = 0;
 }
@@ -759,11 +761,13 @@ static int dummy_queue(struct usb_ep *_e
 		req->req.complete = fifo_complete;
 
 		list_add_tail(&req->queue, &ep->queue);
+		++dum->callback_usage;
 		spin_unlock(&dum->lock);
 		_req->actual = _req->length;
 		_req->status = 0;
 		usb_gadget_giveback_request(_ep, _req);
 		spin_lock(&dum->lock);
+		--dum->callback_usage;
 	}  else
 		list_add_tail(&req->queue, &ep->queue);
 	spin_unlock_irqrestore(&dum->lock, flags);
