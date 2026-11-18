Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006843;
	b=dfYPwe/arhJ3tSbDf2ae+r8uXtoX8uO/663S0XR9cauOFd05r2OcqpcCtIgNomx30IUZ
	 Eh8NOuf4pLzegi6fK8St4tb2b9uCIzk7rJ361yPDW5Ct4n/Ds60I6DV3Xn/87Ire2Ks9w
	 Xqiao8Axcrk9w01sMoe1Nw9Pyq18sK/7iuKCtSBEC1EIh5I8EZaXp1s1WxA/INYG5x93M
	 20ysS6vRVuF6yfRRVXl3yxwoI/yCiPn5V5faRZZT17Fio6YLXS3LYCKGR3azYi58aNu8r
	 eATVRNTotuJV9XnxLtKQvEn3PpCdQ7QmMzrsrcrQmoqHA5CTGY9mkSNfuUQtuPA+naA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006843;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=nujWqO1dIR/jlFAz79XBmcFcWq1y1y05Zo55WeKUoq8=;
	b=Zc2Ieby1tsAt+0KyPWkipt9cxiSzEix5gh3Isr92SLumznT1KmIQI0kqJpK5tqRaoB+6
	 ZwJQrbDgnyrMG5BrzH1O+EHzjdauTmFYZiGx6+De/Z7sGzBN+jY26Pvyko+EB7bCApIhs
	 R/oHME6Le5auayfO8gwOaTsLdyGytcFgvjpe8QkhaVQr8UmJW1Wuu+orpNf8/fuEBfMPc
	 FLQIjH8vXCoT0xV/MldqW/DQ+XugFtbdYM19soKRjOI/U6wOetzpIhcChLewXGLACyI2B
	 2khoeBllzNcoOFrYaEKAJntUdTeIGPR0r2Lz3z6xzBvTEQNDichf8nRy5LV1OdYm7pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B463606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 13:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B463606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 962E3154D18FA;
	Wed, 18 Nov 2026 14:00:32 +0100 (CET)
Date: Wed, 18 Nov 2026 14:00:31 +0100
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Neill Kapron <nkapron@google.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, me@samcday.com,
 michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: f_fs: register cancellation handler
 only after request queueing
Message-ID: <20261118140031.2f78df2b@ingpc2.intern.lauterbach.com>
In-Reply-To: <179495726171.2705769.12448849995784836228.b4-reply@b4>
References: <20261110171222.22633-1-ingo.rohloff@lauterbach.com>
	<20261110171222.22633-3-ingo.rohloff@lauterbach.com>
	<179487196868.2938203.4555043762269001898.b4-review@b4>
	<20261117122153.51dd826a@ingpc2.intern.lauterbach.com>
	<179495726171.2705769.12448849995784836228.b4-reply@b4>
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
X-Bm-Transport-Timestamp: 1795006832636

Hello Neill,

Thanks for the explanation!

> with lockdep enabled, we get the following trace on a VM with dummy_hcd 
> and a simple ffs test application:
>
   ========================================================
>   WARNING: possible irq lock inversion dependency detected
>   7.4.0-rc3-g9b73231bde82 #2 Not tainted
>   --------------------------------------------------------
>   kworker/u64:0/13 just changed the state of lock:
>   ffff8881014ebb40 (&io_data->aio_completion_lock){+.+.}-{3:3}, at: ffs_user_copy_worker+0x4b/0x170
>   but this lock was taken by another, SOFTIRQ-safe lock in the past:
>    (&ffs->eps_lock){..-.}-{3:3}
> 
> 
>   and interrupts could create inverse lock ordering between them.
> 
>   other info that might help us debug this:
>    Possible interrupt unsafe locking scenario:
> 
>          CPU0                    CPU1
>          ----                    ----
>     lock(&io_data->aio_completion_lock);
>                                  local_irq_disable();
>                                  lock(&ffs->eps_lock);
>                                  lock(&io_data->aio_completion_lock);
>     <Interrupt>
>       lock(&ffs->eps_lock);

Ah now I understand :-)

I still don't think this can happen, because the
"lock(&io_data->aio_completion_lock);" on CPU0 can't happen
before the "lock(&io_data->aio_completion_lock);" on CPU1,
because the request first has to be scheduled via "usb_ep_queue()"
on CPU1 as far as I can tell.

But this argument sounds rather fragile...

> Switching ffs_user_copy_worker() to spin_lock_irq() / spin_unlock_irq()
> resolves the lockdep warning in testing.

If using the "_irq" variant satisfies lockdep, then it's certainly better
to use the "_irq" variants; after all the whole point of lockdep is
to find these kind of issues.

I will post another V3 patch variant, which will use the "_irq" variants.

with best regards
  Ingo

On Tue, 17 Nov 2026 23:14:21 +0000
Neill Kapron <nkapron@google.com> wrote:

> On 2026-11-17 12:21:53+01:00, Ingo Rohloff wrote:
> > Hello Neill,
> >   
> > > > @@ -887,7 +888,9 @@ static void ffs_user_copy_worker(struct work_struct *work)  
> > >
> > > ffs_epfile_io() grabs the lock while holding ffs->eps_lock in interrupt
> > > context. Therefore, I think this could lead to lock inversion if we
> > > don't call with with spin_lock_irq() and a spin_unlock_irq(). Could you
> > > send a v3 with _irq() or the save/restore equivalents here?  
> > 
> > I can change that to the "_irq()" variants (this should be harmless),
> > but I would like to understand why.
> > 
> > "ffs_epfile_io()" itself does not run in interrupt context.
> > That's also why it uses "spin_lock_irq(&epfile->ffs->eps_lock);",
> > unconditionally blocking IRQs.  
> 
> Hi Ingo,
> 
> Sorry for the confusion- I misinterpreted the lockdep splat. You are
> correct that ffs_epfile_io() does not run in interrupt context, but with
> lockdep enabled, we get the following trace on a VM with dummy_hcd and a
> simple ffs test application):
> 
>   ========================================================
>   WARNING: possible irq lock inversion dependency detected
>   7.4.0-rc3-g9b73231bde82 #2 Not tainted
>   --------------------------------------------------------
>   kworker/u64:0/13 just changed the state of lock:
>   ffff8881014ebb40 (&io_data->aio_completion_lock){+.+.}-{3:3}, at: ffs_user_copy_worker+0x4b/0x170
>   but this lock was taken by another, SOFTIRQ-safe lock in the past:
>    (&ffs->eps_lock){..-.}-{3:3}
> 
> 
>   and interrupts could create inverse lock ordering between them.
> 
>   other info that might help us debug this:
>    Possible interrupt unsafe locking scenario:
> 
>          CPU0                    CPU1
>          ----                    ----
>     lock(&io_data->aio_completion_lock);
>                                  local_irq_disable();
>                                  lock(&ffs->eps_lock);
>                                  lock(&io_data->aio_completion_lock);
>     <Interrupt>
>       lock(&ffs->eps_lock);
> 
>    *** DEADLOCK ***
>   [...]
>   the shortest dependencies between 2nd lock and 1st lock:
>    -> (&ffs->eps_lock){..-.}-{3:3} {  
>       IN-SOFTIRQ-W at:
>                         lock_acquire+0xcf/0x2e0
>                         _raw_spin_lock_irqsave+0x35/0x50
>                         ffs_func_set_alt+0xaf/0x2b0
>                         composite_setup+0xc37/0x2000
>                         configfs_composite_setup+0x73/0xa0
>                         dummy_timer+0xa5c/0xe10
>                         __hrtimer_run_queues+0x146/0x310
>                         hrtimer_run_softirq+0x89/0xf0
>   [...]
>     }
>     ... acquired at:
>      lock_acquire+0xcf/0x2e0
>      _raw_spin_lock+0x2c/0x40
>      ffs_epfile_io+0x652/0x8c0
>      ffs_epfile_read_iter+0x11a/0x1c0
>      aio_read+0x12d/0x210
> 
>   -> (&io_data->aio_completion_lock){+.+.}-{3:3} {  
>      HARDIRQ-ON-W at:
>                       lock_acquire+0xcf/0x2e0
>                       _raw_spin_lock+0x2c/0x40
>                       ffs_user_copy_worker+0x4b/0x170
>                       process_one_work+0x278/0x6e0
>      SOFTIRQ-ON-W at:
>                       lock_acquire+0xcf/0x2e0
>                       _raw_spin_lock+0x2c/0x40
>                       ffs_user_copy_worker+0x4b/0x170
>                       process_one_work+0x278/0x6e0
>   [...]
>    }
> 
> Switching ffs_user_copy_worker() to spin_lock_irq() / spin_unlock_irq()
> resolves the lockdep warning in testing.
> 
> Thanks,
> Neill
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
