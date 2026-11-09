Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223904;
	b=JQ87nUZhtyTdScz8cCZ2ywwe6301ArjgNrcxn/5VBHIOY/psVPmUBdIPPlK1U8bhSBCe
	 nqE2D1OBGqiz5/nQrEnjbMlr1OEl0l22X1KYUB9FGGhbcf37a49yphnQpRXh5OPrFHFCe
	 VArJPa0TaQGR7om+OXRCHIb3XlYQBgz+EwaGG9jSKmgVXOkbAaVFGbuSF+f8/uXdZsE6I
	 TdIiFY/WHGdNH5q19dLj1TGx4XQxkRYpwEtxvY2u1ncXWlrzipVGMgTWxA+5T/vgb7Lqh
	 OCwRsJiDdiXDARSFzQZBrB0Cr47kJ4eM5k3kJRDkPrXwSzvvV1yNwRT2qje+t4JFsaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223904;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=cx4WmsYLbglr0McGkrzYXvDkGp+KjAolGaIY8vtD+aM=;
	b=oharETP79lPQF5pm40CA3c/Cd0uvOvFJVUGwcZ5fxJ3HNpgypP3FlL0hXvN8Qp6EJIjL
	 fXe8f80rRK9yxbEnN/DjmM+W6q361C9dzV8S+WWbfmjVF1fETjn7uzZXKQXpbK2e6XmuL
	 MpPJ/YetyqP2Kn1pk8JOjBkBW/P/mU9EFmBk3+zdxHO69eVZhWRdelfjlnZhlq77GV5xB
	 069WFll8mIekGhI2jk7EWhWoTF0dPiG+aQPIUIChoBAQPQBmS0lswfMipKZwYxX1C0EJe
	 kuzp8mj2/3/BVJpgukXsoWTMnKEfGnkLyhkuaxHGaBFHxqo9NcaZnpIMDPRB8tnspPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6C5606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 11:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 900B41464F2E9;
	Mon, 09 Nov 2026 12:31:40 +0100 (CET)
Date: Mon, 9 Nov 2026 12:31:40 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Neill Kapron <nkapron@google.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, me@samcday.com,
 michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: gadget: f_fs: register cancellation handler
 only after request queueing
Message-ID: <20261109123140.7e57597b@ingpc2.intern.lauterbach.com>
In-Reply-To: <au5ZFAei8LcpYNgY@google.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
	<20260901120908.14386-3-ingo.rohloff@lauterbach.com>
	<au5ZFAei8LcpYNgY@google.com>
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
X-Bm-Transport-Timestamp: 1794223900647

Hello Neill,

On Fri, 6 Nov 2026 22:47:48 +0000
Neill Kapron <nkapron@google.com> wrote:

> On Tue, Sep 01, 2026 at 02:09:07PM +0200, Ingo Rohloff wrote:
> > Call kiocb_set_cancel_fn() only after usb_ep_queue() completes
> > successfully.
> > ...
>
> Unfortunately, I don't think this is safe. The cancel handler has to be
> set before the request is queued. 

Why do you think, that the cancel handler has to be set before 
the request is queued?

I can't find any reason for this.

I will describe this in terms of an AIO write (read is the same),
referring to the current kernel (without my patch):

The request enters the kernel via
SYSCALL_DEFINE3(io_submit
...
  io_submit_one(ctx, user_iocb, false);
    __io_submit_one(ctx, &iocb, user_iocb, req, compat);   
      ...
        case IOCB_CMD_PWRITE:
          return aio_write(&req->rw, iocb, false, compat);
      aio_write
          ...
          aio_rw_done(req, file->f_op->write_iter(req, &iter));
            file->f_op->write_iter == ffs_epfile_write_iter
        ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
            kiocb_set_cancel_fn(...)
            ffs_epfile_io(...)
              ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);


I can't see why you should need to call "kiocb_set_cancel_fn(...)"
before you call "usb_ep_queue()".
In fact I think that's exactly wrong:
You should **NOT** call "kiocb_set_cancel_fn(...)",
before the request is successfully queued via "usb_ep_queue()".

Unfortunately f_fs.c seems the only place where "kiocb_set_cancel_fn()"
is used, so there is no other code to compare to.

If "usb_ep_queue()" fails, then "ffs_epfile_io()"
will **NOT** return -EIOCBQUEUED.

This in turn means the code in "aio_rw_done(...)"
will call "req->ki_complete(req, ret)", because that's
what "aio_rw_done(...)" does, if you **DO NOT** return -EIOCBQUEUED.

As far as I can tell, this is exactly what we want:
The request is completed with an error,
which indicates that the request was not queued.

Because the request is completed, why should you ever
set a cancel handler for it?
So why should you call kiocb_set_cancel_fn before the
request is queued successfully?

with best regards
  Ingo

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
