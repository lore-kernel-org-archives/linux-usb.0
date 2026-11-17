Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957263;
	b=V756H3HVULTvFy+KB8dMwHlwjKKwn5pW6oivfnX1t9O7yolniYuaM7xRPoqoCVWN3q55
	 k69Bndv5Ye5MYB+bOubkKHrMiEmLzterUz2r9zmE8moVJnYx2iKN9PjaUQkB/pqiqwgzu
	 uiqGvY9xnY7zKKU+/L1QcV2Ia4MCHamPCEiX8a8jj/q80MAVzSPbEI98cZXemNE5SibfD
	 Ag1wukgl56IuIoTBWYBVxoXEHbrjYgNmjwx+gGYxgOjVkF/Ik9qlwSB0ev256uIV8kyQN
	 Gob7udBBI1YcYU8V+VgnvmSaPUMhsWRcYQcd4oDOQnr61f8teIAyZMVtlTto61D6MXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lnbQACr+d2NqRZ2mg//1oc/Jkgsot4vdXLu3OaZY4k4=;
	b=xPO8gCIRDCY9isD36bY83UD3SxomMRxn6WRFQpeLcNzjxI/LiCtZckKFrKdQs7/Z0whI
	 X/ApuWXFkuY0kgg3b49vDI9dDcGFgZjI8UQjNxyhc4Fa+oGBUBV338mgpFUJCEXoBY4AO
	 MYaBCLKHTgIHe8r1H5T5YIAsDORfPgMwdYLWv2/11UnaSTn8uGeOc8BAmV+JKSoHuVQhO
	 CMnAnncdrA+Zo5J0d3QqhxJSPLl/+gtxEsZEv0KXUAGfkzGsrkEzp62Z9atWJWPCVTOgK
	 pY9yOZtleTU8anu5y8Y7GPevphPWlsN8Xbm6efuzRg8eMlGoZ7XOE5LNLgRNjD4ADxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ARrxKJME;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAEC606A898
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 23:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAEC606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ARrxKJME
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so1871345a91.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 15:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794957263; x=1795562063; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnbQACr+d2NqRZ2mg//1oc/Jkgsot4vdXLu3OaZY4k4=;
        b=ARrxKJMECbwQr6FW/ZSlYt716V37zewMXjmMOOPIjtTiKnn0Cxeld01sh6ZV0ce01t
         CJEYBe38Ohw3DMX0MpvY1hWvwmT6qBtIIlVHIbGqbGt9XgwN1TWrXBHzgiHfOX/fQx9q
         UKdmD/NDQIrKlHxlWIlUzjDW1UN3YJGmL3Oti1juCsevgT/jwgGXFUOs8H5qCdLqn+rH
         /9vd0X/780qBlD0Wh3ElayBhGoP6XG+CKu169RE8hh73B7eMk5b6OnJTFqsRiqEADluP
         Z6cOSebqettwCNy0snRzPiS+jH1pnA8E+4ySRXJJvavmSyqMkXKgDcTfD3iISbSGdHJB
         CdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957263; x=1795562063;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnbQACr+d2NqRZ2mg//1oc/Jkgsot4vdXLu3OaZY4k4=;
        b=dLjX6D4rATw53fnZJOwBv3ILt8zmtXXJwdeUdOKYEHEPbzgMxStDI2visgXF8mByHo
         OQQiEezq5In/2G27If/9rgZZ9ZeGKTjP/del/56do7ME263UhUT1vtQOYBqx/Gpin2M4
         SkyzQOw25uz8UPt4Arwm8LKHQ6vo7Ei0QGO+dDHnWKGT+oc/harbU48bO0l3nAMeJCFf
         sTjcu9UtL7QbRL0HolqtljnxmUirJ3pNnxyKR2hFuMeRR/sKxSmntq7uKiBElU8mRLnH
         VQ10U81WWKBX/vXo/kh82YmD0QXWn49O9BZQRsa1HEzl4B98jg0a5TQSsQ75vym/aWUm
         eF1Q==
X-Forwarded-Encrypted: i=1; AL+hErHDaYM+vBvvoL+zXZty39ppouD/iICG+DP3fy4wXHUy69WOY1HKUHL9c2nvvYKIof3b3JvpLaXWy3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K8yK/FBvyTcitT58wLp8hJ42rnxKKgAtBLByrMsEjAumLhHw5
	FIjX4paqNbV7gcjFPfQ2eTifgkKkPtMyU38BRVTss1E0qtaDSgSi2IvOKhKs0vp5HkKFg9ay2Iq
	iEr06zDIdUw==
X-Received: from pjbgy17.prod.google.com ([2002:a17:90a:df51:b0:3a6:f87a:f3e1])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cf:b0:3b0:9409:6969
 with SMTP id 98e67ed59e1d1-3b3d07d4596mr555196a91.19.1794957262632; Tue, 17
 Nov 2026 15:14:22 -0800 (PST)
Date: Tue, 17 Nov 2026 23:14:21 +0000
In-Reply-To: <20261117122153.51dd826a@ingpc2.intern.lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110171222.22633-1-ingo.rohloff@lauterbach.com>
 <20261110171222.22633-3-ingo.rohloff@lauterbach.com> <179487196868.2938203.4555043762269001898.b4-review@b4>
 <20261117122153.51dd826a@ingpc2.intern.lauterbach.com>
X-Mailer: b4 0.17-dev
Message-ID: <179495726171.2705769.12448849995784836228.b4-reply@b4>
Subject: Re: [PATCH v2 2/2] usb: gadget: f_fs: register cancellation handler
 only after request queueing
From: Neill Kapron <nkapron@google.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: Neill Kapron <nkapron@google.com>, gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, 
	me@samcday.com, michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On 2026-11-17 12:21:53+01:00, Ingo Rohloff wrote:
> Hello Neill,
> 
> > > @@ -887,7 +888,9 @@ static void ffs_user_copy_worker(struct work_struct *work)
> >
> > ffs_epfile_io() grabs the lock while holding ffs->eps_lock in interrupt
> > context. Therefore, I think this could lead to lock inversion if we
> > don't call with with spin_lock_irq() and a spin_unlock_irq(). Could you
> > send a v3 with _irq() or the save/restore equivalents here?
> 
> I can change that to the "_irq()" variants (this should be harmless),
> but I would like to understand why.
> 
> "ffs_epfile_io()" itself does not run in interrupt context.
> That's also why it uses "spin_lock_irq(&epfile->ffs->eps_lock);",
> unconditionally blocking IRQs.

Hi Ingo,

Sorry for the confusion- I misinterpreted the lockdep splat. You are
correct that ffs_epfile_io() does not run in interrupt context, but with
lockdep enabled, we get the following trace on a VM with dummy_hcd and a
simple ffs test application):

  ========================================================
  WARNING: possible irq lock inversion dependency detected
  7.4.0-rc3-g9b73231bde82 #2 Not tainted
  --------------------------------------------------------
  kworker/u64:0/13 just changed the state of lock:
  ffff8881014ebb40 (&io_data->aio_completion_lock){+.+.}-{3:3}, at: ffs_user_copy_worker+0x4b/0x170
  but this lock was taken by another, SOFTIRQ-safe lock in the past:
   (&ffs->eps_lock){..-.}-{3:3}


  and interrupts could create inverse lock ordering between them.

  other info that might help us debug this:
   Possible interrupt unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&io_data->aio_completion_lock);
                                 local_irq_disable();
                                 lock(&ffs->eps_lock);
                                 lock(&io_data->aio_completion_lock);
    <Interrupt>
      lock(&ffs->eps_lock);

   *** DEADLOCK ***
  [...]
  the shortest dependencies between 2nd lock and 1st lock:
   -> (&ffs->eps_lock){..-.}-{3:3} {
      IN-SOFTIRQ-W at:
                        lock_acquire+0xcf/0x2e0
                        _raw_spin_lock_irqsave+0x35/0x50
                        ffs_func_set_alt+0xaf/0x2b0
                        composite_setup+0xc37/0x2000
                        configfs_composite_setup+0x73/0xa0
                        dummy_timer+0xa5c/0xe10
                        __hrtimer_run_queues+0x146/0x310
                        hrtimer_run_softirq+0x89/0xf0
  [...]
    }
    ... acquired at:
     lock_acquire+0xcf/0x2e0
     _raw_spin_lock+0x2c/0x40
     ffs_epfile_io+0x652/0x8c0
     ffs_epfile_read_iter+0x11a/0x1c0
     aio_read+0x12d/0x210

  -> (&io_data->aio_completion_lock){+.+.}-{3:3} {
     HARDIRQ-ON-W at:
                      lock_acquire+0xcf/0x2e0
                      _raw_spin_lock+0x2c/0x40
                      ffs_user_copy_worker+0x4b/0x170
                      process_one_work+0x278/0x6e0
     SOFTIRQ-ON-W at:
                      lock_acquire+0xcf/0x2e0
                      _raw_spin_lock+0x2c/0x40
                      ffs_user_copy_worker+0x4b/0x170
                      process_one_work+0x278/0x6e0
  [...]
   }

Switching ffs_user_copy_worker() to spin_lock_irq() / spin_unlock_irq()
resolves the lockdep warning in testing.

Thanks,
Neill

-- 
Neill Kapron <nkapron@google.com>
