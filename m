Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43668436BC9
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587592; cv=none; b=l09TKMqeVY8jMul10uciSFtSipqLWpIK9xRAFedfmv+VC4Dpx6a0vIR36BJlPcOsTmV93mNz5On3xYrCi/6IFiF4jyEh1uDepZkvqIf6mB2WxxA4DLCbfCF8H65zIaQ0DIAUmGjIIuNs+ExzdHB3vq7UPjvEfjHf+k/Ijk/g5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587592; c=relaxed/simple;
	bh=KKWtxsa4+JxynoqTU3twhaxB29xf4CJ4YYZF5aGtZHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLGkTGX2rx15EfONUz5b6JdQrZJ+04/w9lYqEqSz7RVU3Kan7dpU62BI1QUNPokcEQmWuMFAnLwpx0DRyLFg5t6/foID0MGUyvZDC71RyscfU/3kUWX2j9KkgNNmnP+dL26B5OdoExnDB4Hr53oCGEhvDXbPsmp98GUzU76uVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GiMiMMWE; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GiMiMMWE"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so12319411cf.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789587583; x=1790192383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLWCt+dlTo+bsva3Fw8pE5vrcV7G5HDlYsoQqT2I0wc=;
        b=GiMiMMWEd5C708KuSjNKTPc3sRMzRWGxgdOtrpJxZSmx+3D3s7A1OVs0kTKm8PJAIG
         TiTZ2TP0HxVhQaF/42xRQtUw2hG5eGoQoddH60q8pqC1ZroIijXyhV+1RWw9C0VVh+UV
         WcyRVVQuiEIFTBjw5c66hVUtpFINPFCHeZ7+q6OZu1MVFQtL+KPvvhF+5xPUWQGXdPkN
         ENnlsU74cN0cPdKYgEAl7LeI1bSu5KB7xIehfJx6krqEWnYLSbtSY82lzxEXtXwhyODn
         fl6sAoZcTg99pA1pfHAmRgOKivJIz26XQALJVaq/alupC+GWP5BbepgHVnsdOYng27pk
         E0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587583; x=1790192383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLWCt+dlTo+bsva3Fw8pE5vrcV7G5HDlYsoQqT2I0wc=;
        b=AiH1cKnTIKdF6ScnNwUsTvqhsMQBUArg0Ga5Mxk8lONOmm8+8GAzX+FOWUW0KSSEt9
         nWp7cEEZ9NMYwQe2Rca46d+fZnF71dlwFXnin+lbFBIMqM70XHJXR4dLirpnQzCA0XcN
         p2b6eEle8MYNm1hOw2I7zuYbubhHIx4fd09gUNMdV325MMCXGLSCvEwS3qpwvprGfxY+
         Wx7H3qyXggXWH5acfl/UdTU4UGJgKInpBVr7WEa/Xict+/yD+d6hR8NSUVCXCfKRl1m5
         BK3p5XU3njMl2rQU4eL7LeJo28n+L78cuJLIgLbNEx+PYliCzk5YgL14sdw9aYgmGS6b
         78vQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2dFMuftmj0SvxK/C/47r2cwwyZBbpZF8BcgvsBV6Vj0a56ROgG452w0YfjadvSYkJsPmvBIpK8Es=@vger.kernel.org
X-Gm-Message-State: AFuF++kY+bIbf9fUgCXHbH+QG2+YrKdwlaYJfIqI1Tv7G5qhjBrH/18y
	7LL6DIkzBXNMt15mNmEZZJUQrIoS0w12bnXbMYkg5+gD8p4mbUr+ii3LEAhu3izvIw==
X-Gm-Gg: AYBFou1lf75fdTLFsSwkrhSOdQzfB5HjUhzYBq83YWJnngMonipH5JIRt7Rh5F7AVYe
	rV5gHEgGZgMFc2/eN2ehTxwM0mVGhu4fnZ9CyAJmFbfafkj6Z+Bhg/qI78u8ClRlAipmF4D3CBB
	FkX8B+O8MM3BTCniN3uY4wNuKW77Rj5C3fKFxW5JryFcC8CYQmM4+cxfyw1tFYn7V4WMp3jGN3N
	gTcjMDE1hnWh+irSxw94ngmz2MYnsudR9/OZWV7xzFjgBlDEUgkSxfEuWTVScdYbh2cgo0HNnlp
	ABALyEtXR1pwxJTzI31eu+f5Owr5Pn8THds+3fLgRswolD2UCuThzHtQa2XDhNAkR0I+i6xuh6a
	NL3TXfembNYWvB2OLZ+1dD6HXqEnLr+WQEELQ1agkOGA6sLgbGJpuZLirp9oF4sDZ4XBa0gtxBL
	/w9EmPYlCXN5yGPps5wutCoKdPNW3ZowfRtRyCAVYl0q4EYqsA1VI8nAwj/BPM9V09mYQ3EaHw
X-Received: by 2002:a05:620a:3182:b0:939:bd4e:b2fd with SMTP id af79cd13be357-93bb791873bmr728894685a.43.1789587583154;
        Wed, 16 Sep 2026 12:39:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81cf2568sm279486985a.36.2026.09.16.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:39:42 -0700 (PDT)
Date: Wed, 16 Sep 2026 15:39:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu>
References: <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
 <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
 <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>

On Wed, Sep 16, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> > Hmmm.  Do you know where the unmount operation was getting stuck?  Was
> > it the usb_gadget_unregister_driver() call inside dev_release()?  I just
> > want to be sure about this.
> 
> In these reruns, I found that the unmount task was blocked in
> synchronize_rcu_expedited(), called from namespace_unlock(), rather than
> in usb_gadget_unregister_driver().
> 
> I reran the PWRITE callback tail test with both patches applied, using a
> resident helper whose main thread invoked umount2() directly. A monitor
> thread in the helper captured the blocked main thread's kernel stack. In
> three runs from fresh boots, the relevant frames were:
> 
>     synchronize_rcu_expedited
>     namespace_unlock
>     path_umount
>     __x64_sys_umount
> 
> In each of those three runs, the same umount2() call returned
> successfully after I released the callback gate.
> 
> USB gadget request completion callbacks run with interrupts disabled, and
> interrupt-disabled regions act as implicit RCU read-side critical
> sections. The observed wait is therefore consistent with the diagnostic
> gate delaying completion of the expedited grace period.
> 
> I also added diagnostic markers around dev_release() and
> usb_gadget_unregister_driver(). The test harness signaled the resident
> helper only after the reproducer had closed ep0. In five clean runs from
> fresh boots with these markers, both usb_gadget_unregister_driver() and
> dev_release() had returned before the resident helper invoked umount2(),
> while ep_aio_complete() was still held immediately after
> iocb->ki_complete().

Okay, that's not good.  We can't expect to rely on an unintended side 
effect.  All the completion handlers should finish before 
usb_gadget_unregister_driver() returns; we need to enforce that.

I believe this misbehavior is caused by an oversight in the dummy-hcd 
driver.  Can you repeat these tests with the patch below applied on top 
of the other two?  It should cause usb_gadget_unregister_driver() to 
wait until ep_aio_complete() returns (the actual wait loop is in 
dummy-hcd's dummy_udc_async_callbacks() routine).

Alan Stern


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

