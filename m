Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914523;
	b=iy4o90pKNWoeW04LFSJdjHNTx4EmzO+AwqZIZjGDo8p4YWvczgqkiOM8LQIl3OvB3aTr
	 O5pzXbUXTeWsL3RHkGL6oPW0VVVTRqZi3bcHk+sFrbgHzkQrp7oQzh/SkWiO1oIQNtin/
	 XPDOBpHg1/C3zUvMeXgOl3t1Ay2Y3hQVuhwCTYSA8UFKghFvOeAkJtLEzSnbsxp58fYXR
	 0//FNx8ylRsyxKBd0YPoH2ZRxWW7IgkdaClHWR+G2Psb2USVcy5dSdYl2zy4tFY+ffXsi
	 u0FovZllZc5/SXWtA7S6c5yYFiLjABmWTOP4Bufu0yvTM/tvq/xhqZUQgEILR9P9TBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914523;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=1VP7HSJazIripIGlS6comNKAjpk2pr2ij7iTfrF+Gmg=;
	b=mM6IgAaoqscDjpqOxm3AKCQmEpK9zYL/n8aJBE45Redk8z4AxSVPNCRV6bckB6Je9nx/
	 bmrk7YUf+csUwoiQXijg0AEpERLpKPP2vSmoqmJHij2y8Yntm/0NqGF9pvc36fudX/0J+
	 Yckh5I2G44QMO+HH/Xprj1bRbCdXCh4aIPdoodSlmG3xjo1RmGRJAjkfWpkmooem/e911
	 yfZXnhwvo3DcDiKvJf4EhkIzFP2rZKY37TC5sqcSAAmL3Ijy7XcoIDkBsp2LR5dds9F08
	 C6ix2lBiUYH5I9t9PU1+LMcJIsKA/4Hlg2xTxQb7hmlXjuLJ/cFObbNqB+2v65oYJDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BB4606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 0B8022140BF42;
	Tue, 17 Nov 2026 12:21:54 +0100 (CET)
Date: Tue, 17 Nov 2026 12:21:53 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Neill Kapron <nkapron@google.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, me@samcday.com,
 michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: f_fs: register cancellation handler
 only after request queueing
Message-ID: <20261117122153.51dd826a@ingpc2.intern.lauterbach.com>
In-Reply-To: <179487196868.2938203.4555043762269001898.b4-review@b4>
References: <20261110171222.22633-1-ingo.rohloff@lauterbach.com>
	<20261110171222.22633-3-ingo.rohloff@lauterbach.com>
	<179487196868.2938203.4555043762269001898.b4-review@b4>
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
X-Bm-Transport-Timestamp: 1794914514061

Hello Neill,


> > @@ -887,7 +888,9 @@ static void ffs_user_copy_worker(struct work_struct *work)
> >  		mmdrop(io_data->mm);
> >  	}
> >  
> > +	spin_lock(&io_data->aio_completion_lock);
> >  	io_data->kiocb->ki_complete(io_data->kiocb, ret);
> > +	spin_unlock(&io_data->aio_completion_lock);  
>
> ffs_epfile_io() grabs the lock while holding ffs->eps_lock in interrupt
> context. Therefore, I think this could lead to lock inversion if we
> don't call with with spin_lock_irq() and a spin_unlock_irq(). Could you
> send a v3 with _irq() or the save/restore equivalents here?

I can change that to the "_irq()" variants (this should be harmless),
but I would like to understand why.

"ffs_epfile_io()" itself does not run in interrupt context.
That's also why it uses "spin_lock_irq(&epfile->ffs->eps_lock);",
unconditionally blocking IRQs.

The code part in "ffs_epfile_io()", which calls
"spin_lock(&io_data->aio_completion_lock);" runs with local interrupts disabled,
which also means it cannot be interrupted, which in turn means it will reach
"spin_unlock(&io_data->aio_completion_lock);" un-interrupted.


"ffs_user_copy_worker()" is scheduled via a regular work queue.
As far as I understand this means it's also not running in interrupt context.
So the potential danger here is, that in the code part:

	spin_lock(&io_data->aio_completion_lock);
  	io_data->kiocb->ki_complete(io_data->kiocb, ret);
	spin_unlock(&io_data->aio_completion_lock);

An interrupt happens after the "spin_lock" has been executed (so the code
above is interrupted) and the code for the interrupt also wants to grab 
"&io_data->aio_completion_lock".

But there is no interrupt code which uses "&io_data->aio_completion_lock".
As I said: ffs_epfile_io() is not running in interrupt context.

There is also a second reason why I can't see how there might be a problem:
"ffs_user_copy_worker()" can only run, once the request to the USB Controller
has been scheduled via

    ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);

in the "ffs_epfile_io()" function. But right before this happens
"ffs_epfile_io()" grabs "&io_data->aio_completion_lock".

Meaning when "ffs_user_copy_worker()" reaches
"spin_lock(&io_data->aio_completion_lock)", there are only two possibilities:

1) "&io_data->aio_completion_lock" is still taken by "ffs_epfile_io()"
   => That's the whole reason why this lock exists:
   Preventing "io_data->kiocb->ki_complete(io_data->kiocb, ret);" to run
   before "ffs_epfile_io()" has called 
   "kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);"

2) "&io_data->aio_completion_lock" has already been released.
   In this case the lock will not be taken a second time by "ffs_epfile_io()",
   so there is no problem.

with best regards
  Ingo


On Mon, 16 Nov 2026 23:32:48 +0000
Neill Kapron <nkapron@google.com> wrote:

> > Call kiocb_set_cancel_fn() only after usb_ep_queue() completes
> > successfully.
> > 
> > This also undoes commit e78dcb1f7ec2 ("usb: gadget: f_fs: Fix
> > Use-After-Free in AIO error path"): The described error is avoided by
> > making sure the cancellation handler is only registered, if there is
> > something to cancel.
> > 
> > Registering the cancellation handler adds the kiocb to the context's
> > active request list (active_reqs in aio.c).  If usb_ep_queue() fails, the
> > request was never actually submitted to the hardware, which means the
> > request is not active.  The aio framework already deals with calling the
> > completion function ki_complete() automatically if you do not return
> > -EIOCBQUEUED.
> > 
> > Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>  
> 
> Thanks Ingo, this is cleaner than the -EIOCBQUEUED hack in my original
> approach. Can you add Fixes: and Cc: stable tags on a v3 addressing the
> feedback below?
> 
> > ---
> >  drivers/usb/gadget/function/f_fs.c | 70 +++++++++++++++---------------
> >  1 file changed, 34 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index d3fd1dfcd454..135c2979f737 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -264,6 +264,7 @@ struct ffs_io_data {
> >  
> >  	int status;
> >  	struct completion done;
> > +	spinlock_t aio_completion_lock;
> >  };
> >  
> >  struct ffs_desc_helper {
> > @@ -887,7 +888,9 @@ static void ffs_user_copy_worker(struct work_struct *work)
> >  		mmdrop(io_data->mm);
> >  	}
> >  
> > +	spin_lock(&io_data->aio_completion_lock);
> >  	io_data->kiocb->ki_complete(io_data->kiocb, ret);
> > +	spin_unlock(&io_data->aio_completion_lock);  
> 
> ffs_epfile_io() grabs the lock while holding ffs->eps_lock in interrupt
> context. Therefore, I think this could lead to lock inversion if we
> don't call with with spin_lock_irq() and a spin_unlock_irq(). Could you
> send a v3 with _irq() or the save/restore equivalents here?
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
