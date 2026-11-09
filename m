Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241201;
	b=cPoOZQav5D3646f1KETOAksFJCvqa7J0OycvTIXShUgryG02cB++SO8VtObDj2X5wCfr
	 Tzu10UOMle1Y2RZZ6ImPlfGdTDu7HtxcEEWTiutcIfelw7SLxtAJElUpkxTORewjkx/VU
	 UZRZbvzVMtmp0cPRSBLuFIAG8vN3i3kA7GdSgOjqxJih+b7zakew9VetZ7k6/Fz5zVtfo
	 AXHhHzrth0ezA3xAV/QCMnQ6RAs/YCQwnNrvsH14lPmzXcSdWN7RPYmhb0S1LSeCK7D/J
	 LJa1xlCKhz1Q6ETBZKuvh7/bCix4bA4CirKzG/6K34I2v3cwmEtJcxCuNPJ87rW2faA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241201;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=GzvmJ1ANBGc7M0nBA/Blki2Tx+LwsBmOg3kTL/32+TY=;
	b=g3nvZFm7b/N+pktKo7LC5+tcPkfZFn2dpwCPAf+S1pBZrKgireztTh4JhlWhZsxBXJOy
	 j24GUmtlxIcJku4722ZKSJpCW0qYenpkjwrO6gx5O38w06wbrHGORxYrsxcMiv42jMBcl
	 /utTxvzIjX+5UCzckmllTadcg36zUN6QLHBrlqOg+6EHEMwfJX+evFwHi66IqizX8elLc
	 aWHjbGqgvz7JVJ3RcKsCRae8kNKSgC3Yr2Nu479z9snWT/PUxJgQ3MxROqr/AfVugmFwu
	 TiO/ewB/TmiCIL0r6U8V7dHlHPKUgv+JeNshYuTZIu5THLgXNxTfuLe6l6Dff5S0lHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFD0606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 16:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 88AAA14643215;
	Mon, 09 Nov 2026 17:19:57 +0100 (CET)
Date: Mon, 9 Nov 2026 17:19:57 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Neill Kapron <nkapron@google.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, me@samcday.com,
 michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: gadget: f_fs: register cancellation handler
 only after request queueing
Message-ID: <20261109171957.2cf2bcbb@ingpc2.intern.lauterbach.com>
In-Reply-To: <20261109123140.7e57597b@ingpc2.intern.lauterbach.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
	<20260901120908.14386-3-ingo.rohloff@lauterbach.com>
	<au5ZFAei8LcpYNgY@google.com>
	<20261109123140.7e57597b@ingpc2.intern.lauterbach.com>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-unknown-linux-gnu)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1794241197590

Hello Neill,

> On Fri, 6 Nov 2026 22:47:48 +0000
> Neill Kapron <nkapron@google.com> wrote:
> 
> > On Tue, Sep 01, 2026 at 02:09:07PM +0200, Ingo Rohloff wrote:  
> > > Call kiocb_set_cancel_fn() only after usb_ep_queue() completes
> > > successfully.
> > > ...  
> >
> > Unfortunately, I don't think this is safe. The cancel handler has to be
> > set before the request is queued.  
> ...
> You should **NOT** call "kiocb_set_cancel_fn(...)",
> before the request is successfully queued via "usb_ep_queue()".

I just had another look at the code and I am even more convinced than
before that commit  ("usb: gadget: f_fs: Fix Use-After-Free in
AIO error path") is wrong. Especially this code part

	if (res == -EIOCBQUEUED)
		return res;
	/* Comment by Ingo: Code here menans there was an error */
	if (p->aio) {
		kiocb->ki_complete(kiocb, res);
		mmdrop(p->mm);
		kfree(p);
		return -EIOCBQUEUED;
	}

Returning "-EIOCBQUEUED" when in fact nothing has been queued
(because of an error) doesn't make any sense to me.

As far as I can tell, the whole point of returning "-EIOCBQUEUED" is  to tell
aio.c that something is "in progress"; which is exactly  the opposite of
what's happening here.

Returning -EIOCBQUEUED is just a hack here, to prevent
"aio_rw_done(...)" (in aio.c) from calling "kiocb->ki_complete(...)" after 
ffs_epfile_write_iter/ffs_epfile_read_iter
has returned.

with best regards
  Ingo

On Mon, 9 Nov 2026 12:31:40 +0100
Ingo Rohloff <ingo.rohloff@lauterbach.com> wrote:

> Hello Neill,
> 
> On Fri, 6 Nov 2026 22:47:48 +0000
> Neill Kapron <nkapron@google.com> wrote:
> 
> > On Tue, Sep 01, 2026 at 02:09:07PM +0200, Ingo Rohloff wrote:  
> > > Call kiocb_set_cancel_fn() only after usb_ep_queue() completes
> > > successfully.
> > > ...  
> >
> > Unfortunately, I don't think this is safe. The cancel handler has to be
> > set before the request is queued.   
> 
> Why do you think, that the cancel handler has to be set before 
> the request is queued?
> 
> I can't find any reason for this.
> 
> I will describe this in terms of an AIO write (read is the same),
> referring to the current kernel (without my patch):
> 
> The request enters the kernel via
> SYSCALL_DEFINE3(io_submit
> ...
>   io_submit_one(ctx, user_iocb, false);
>     __io_submit_one(ctx, &iocb, user_iocb, req, compat);   
>       ...
>         case IOCB_CMD_PWRITE:
>           return aio_write(&req->rw, iocb, false, compat);
>       aio_write
>           ...
>           aio_rw_done(req, file->f_op->write_iter(req, &iter));
>             file->f_op->write_iter == ffs_epfile_write_iter
>         ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
>             kiocb_set_cancel_fn(...)
>             ffs_epfile_io(...)
>               ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
> 
> 
> I can't see why you should need to call "kiocb_set_cancel_fn(...)"
> before you call "usb_ep_queue()".
> In fact I think that's exactly wrong:
> You should **NOT** call "kiocb_set_cancel_fn(...)",
> before the request is successfully queued via "usb_ep_queue()".
> 
> Unfortunately f_fs.c seems the only place where "kiocb_set_cancel_fn()"
> is used, so there is no other code to compare to.
> 
> If "usb_ep_queue()" fails, then "ffs_epfile_io()"
> will **NOT** return -EIOCBQUEUED.
> 
> This in turn means the code in "aio_rw_done(...)"
> will call "req->ki_complete(req, ret)", because that's
> what "aio_rw_done(...)" does, if you **DO NOT** return -EIOCBQUEUED.
> 
> As far as I can tell, this is exactly what we want:
> The request is completed with an error,
> which indicates that the request was not queued.
> 
> Because the request is completed, why should you ever
> set a cancel handler for it?
> So why should you call kiocb_set_cancel_fn before the
> request is queued successfully?
> 
> with best regards
>   Ingo
> 



-- 

-------------------------------------------------------------------------
Dipl.-Inform.
Ingo ROHLOFF
Senior Staff Engineer
phone +49 8102 9876-142 - ingo.rohloff@lauterbach.com

Lauterbach Engineering GmbH & Co. KG
Altlaufstrasse 40, 85635 Hoehenkirchen-Siegertsbrunn, GERMANY
www.lauterbach.com

Registered Office: Hoehenkirchen-Siegertsbrunn, Germany,
Local Court: Munich, HRA 87406, VAT ID: DE246770537, 
Managing Directors: Stephan Lauterbach, Dr. Thomas Ullmann

-------------------------------------------------------------------------
