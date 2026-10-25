Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792914909;
	b=D4Kt1q9K2gPpWeGcf1l4PzsRRRdgNdWYgyFlN62K15BZXQ6zCmcbeu8RSwpa4Vbuv/1A
	 tZufpvA4RvSfLF92sP6ZtpPcbYwdMRD5Rm/ODDvWvq6QPDoETT2Do2CAQhbcmic+8a9BO
	 pLp6QNr3P8e1PmzyQ/EFACtMdVP4Z8Q5a4wBxNGmKHgGNduULOEHB1QVy0RDt7tn84TqA
	 040Pm2ssgWDS/GnSVmLnqqoXrLotAM6pDS1zNGvQUuCjBGc6qPvtyXbJqV1j9gWyIU2mX
	 jCjCmOQD1qQeFJPhSZ9sLi8nOXre4/zZ2leNA8Ljf1We5HPum4W7+qY43+kKYJTrHNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1C9QfDVmHgok+qT1OfDFTuzpTeVw9bwEFddfhgEu72E=;
	b=1OX5NHBqVOWJ8Vbrm9NfCcDFX9nsQXi8URuajmpjG/1DcsaSHJuRjzlReKG1NzuA1c99
	 8oadTK7GyByiO2iPK87F3voGFhhadDSM1XNSGnZBFBCYtOMXqQLZ/S8gVYe54sb/USeT6
	 UVmJlxHuAIoOZAgwGeDYPufsmvftIavStZ9hKNaTfjRSUn3DZdzP1faQaS0PGRNyk3PHr
	 jn5Mswd44ihsNTrTJhGRmdp+eY3Q8yM3P+Lm+wPHwW0NDuKVD6upWKr/YrKxyIny4/+Xm
	 ZfjtTLBEbos55uWOZ57PqdvMCImK6ITFMgDEV51Qs141DPYOSZViCov4bkaJSj4Ok+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bbt87hXo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C791606A31D
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 07:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C791606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bbt87hXo
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so2002601e87.2
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 00:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792914907; cv=none;
        d=google.com; s=arc-20260327;
        b=DZoLKNaR8bZN4xDHuuTqc89PNDeiKkYVEp9oJL/7fJ9Ip0/Fc3641BhoWCrwTT/ClW
         +nJS/wkUocH76Fz+rcjjGFcC3vUwBx/O9ftr3zdA5hS7fsGEBkkzicaFrs8eRp1GXqYC
         kzgpjqwH51C5joVTtd4Ukc7iEiUpuiR5RDHsbDY954DdB85wylsWAMgyKAP4Ae0RljfG
         ZZ6ImtJ+GDbhus5f3wHvJNeLh3/gefqlXCTKpQo56ADdIZRR/U5zkFzjK6976eHSKdxO
         NcuIvc3w7LZGAR7p+aYnbwbR0kiFZtGQMiJjG5+VrnaUW1Oe0GvlCoproRivH+7h9Vs0
         bl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1C9QfDVmHgok+qT1OfDFTuzpTeVw9bwEFddfhgEu72E=;
        fh=LjD01hB7zCBGwpxLECt4plWZiQASCupZyJkCMfrO7GQ=;
        b=BDbMtPI9eOKCKtkutDRs/BN8b/a4Aa6vHqPSCvNxSZgJ5hYhrSCZ27a5VHNk4RQuDg
         D1wKDCJA4rVgLZ8safa4XrHgoRHCdJ+PeLl5GHX1yaT4bnK8+B39nQDsG9TrwlHCbYLF
         jnevhx1CroMNucCVTuucOoZXovs2AeGqWFrtf7unn2vEya7DcO0OwZNwv/6Wzzc24RHw
         3pUQ2mJRV7J/Dj08qGGK6VU0qeBTaxjBb9cPpyrIPsVICg5aFXQXp0FbTzmQOBNeWstl
         J7dq4qBJD2rUQ2e1oSnonMiDOoh2Y9BsYB4pztiATkr5Ia4o2rFztkJWtIFFnKnHt07Q
         jNhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792914907; x=1793519707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1C9QfDVmHgok+qT1OfDFTuzpTeVw9bwEFddfhgEu72E=;
        b=Bbt87hXowZN8elRvcAmDb7wQSZa9iJUaSANBPRcVJjzQXb0Nehag9g/6N6eBayyhS4
         Rtynktspj6RRlVAhelZj+DHlzXc9fukq2+P0OQ55/UXkfmuXkztZWhnEtPJKOp9G4Q3d
         pknwmwLrxn/9eapt7BdGw3ZqhEnNbwB1x748s80/ZSSpvcnlq4p31QMIvMWWxEui/Ifl
         nDrIIWtvQPrw/n0K3rumxithZbZs0LGXsnnlRfyxXPoNiBmsUpm2Hv1OXq1CCUFeuyKC
         0wduk/NXLyWxZJ+/3ZtVIx0DmBn0QSYg1y5tRYC4zqkRKrQxYFusZdw0iUPA/VYC3Yqe
         qW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792914907; x=1793519707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C9QfDVmHgok+qT1OfDFTuzpTeVw9bwEFddfhgEu72E=;
        b=1RZB0TfxHUGC61P/pugCcbqHOWvHug8PHBfw5UoB+zGMUOAxx81hfR/3+Exd+yyx6m
         E0dxTEOK+TUeWNq3TOEIozX1Pp909AIYq2EFfUSDgRBmtgfjmgYUyHwL7Y+uSKeDt5et
         k4iQsGrehe/nTRADOx7gYGhvL5AgM5W2UnK0AjgxOPtpRsB/Whj8Q99VE3iOCCAE1mRh
         rfqkNHEE1QiiJUl4coM+RSEc+6NXct+6C+NafxLgudKuzXR7L2qz+kU6QBN/uciG/6m7
         G8DEScatoZX5U3pD5YTWujcm/SGG/fcuPrET4x6V4cNiN6TRYtchv2Hv9U4mltYFyXEp
         Hybw==
X-Forwarded-Encrypted: i=1; AKwUvBwuugNmu4q32ozTrW/eh/EgTb8NxTuJHh8GUWXEPN8vfGMZcoAvpNAqt0ow5C6VKNGTgqiAAlQmF4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOElbCzU1UPvZomYuTeK04WCkQGGMxR3195s3/uquYbt+cwk7o
	E5VauDWuYlf3f5l1O400BVUgWtbcMhbeU8xgnyTbAqCef8oY8W6T0FpXMdaWIZf5G2SsRgqIMnP
	P0/DJCefyyrY2Dq8P3nHUwVimfizCumA=
X-Gm-Gg: AYBFou1yOfvrkfdE/1/9O1UGgfg2gR0abK1hnabuhvKUQ9cOePxnmRzl20Ni9+MwEJ+
	RxqqL7zCWvy23L0mRHisMJChh4SR2tgbq3PoXrRy+ZlM9JTqx+kdj8N+y6BvVs0y0KWckqtsMVK
	mUSiKjUTrRaJC3jmZTa4tuHZuai6ck1OqEFyC+MTSJAjv/5kDpwLypNGi8CVRSd8F8JaghX8iuE
	MgyWdE2zovl9ACTmFX/2cviitEmXn0+5nsWGOdStr6UA2zOLkRrhYy4rbLthHA+5XmMtImIT1lv
	sTNemFJZusuLYHEnVc4pT3WZLSrm5TAbvPEDLXuSeHyCPZekYtVqv1MzpVdF5IZzo2nIHPSvQLl
	NpKX+E50URFnbBXt8EfMrPxLvOYfspsqTQHCiIpryJv5IHELNviZaghXggKsLeGnKuFbIWpKgEf
	0A4ng=
X-Received: by 2002:a2e:be0c:0:b0:3a9:a315:a655 with SMTP id
 38308e7fff4ca-3ac6fdc374cmr10772241fa.29.1792914907262; Sun, 25 Oct 2026
 00:55:07 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com> <20261025000643.425c57ca.michal.pecio@gmail.com>
In-Reply-To: <20261025000643.425c57ca.michal.pecio@gmail.com>
From: IgorpetinDev <igorpetindev@gmail.com>
Date: Sun, 25 Oct 2026 10:54:57 +0300
X-Gm-Features: AclHuK8My_8J_d3dvNxWsyAG1OCwp6uakZV7lV0PtlTzoB6Gres-9UtzHSF4BC4
Message-ID: <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

> No such domain?
> Looks like you trusted an LLM ;)

good catch, that was just a clumsy typo on my part: I accidentally typed
appspotmail.com instead of appspot.com in the closes tag, anyway - the syzb=
ot ID
itself is valid. If Greg or Alan prefer a v4 to fix the URL typo, I'll
gladly resend it, or it can be fixed up when applying.

> Dupe?

I wasn't aware of your patch from august; I simply saw an open and
unresolved syzbot report and decided to address it.

Regarding cancel_work_sync() vs. flush_work() and usb_remove_hcd() vs.
usb_stop_hcd(): these changes were specifically suggested by Alan Stern
during the review of v1 and v2, which is why v3 was shaped this way and
subsequently received his reviewed-by tag.

I'll defer to Alan and Greg on how they wish to proceed and which
approach they prefer to take.

Thanks,
Igor

On Sun, Oct 25, 2026 at 1:06=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> Dupe?
>
> https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gm=
ail.com/
>
> On Sat, 24 Oct 2026 18:56:14 +0300, Igor Putko wrote:
> > When an HCD is stopped/removed (either during module unload, driver
> > unbind, or an error path in probe), pending URBs are unlinked and
> > completed. However, for root hubs or HCDs with giveback done in BH
> > context, the work function usb_giveback_urb_bh() may still be
> > executing on another CPU after __usb_hcd_giveback_urb() drops the URB
> > use_count and wakes up waiters in usb_kill_urb().
> >
> > Since the caller may immediately free the struct usb_hcd via
> > usb_put_hcd() after usb_stop_hcd() or usb_remove_hcd()
>
> Is usb_stop_hcd() relevant here?
>
> I placed this in usb_remove_hcd() where other works are cancelled.
> This seems good enough, because no URBs (or wakeups or dead) should
> exist until usb_add_hcd() completes successfully, at which point
> I suppose usb_remove_hcd() must be used, not merely usb_stop_hcd().
>
> > the running worker accesses the embedded giveback_urb_bh structure
> > in its epilogue (e.g. clearing completing_ep or clearing the running
> > flag) after the memory has been freed, triggering a
> > slab-use-after-free write detected by KASAN.
> >
> > Ensure all giveback work has fully completed in usb_stop_hcd() by
> > calling flush_work() on both high and low priority BHs before
> > deallocating. Also remove the misleading comment in usb_remove_hcd()
> > claiming flush_work() is unneeded, and document the queue emptiness
> > in the usb_stop_hcd() kerneldoc.
> >
> > Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH
> > workqueue") Reported-by:
> > syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com Closes:
> > https://syzkaller.appspotmail.com/bug?extid=3Da5b220cacb0618384d5a
>
> No such domain?
>
> Looks like you trusted an LLM ;)
>
> > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> > ---
> > v2 -> v3:
> > - Remove obsolete comment in usb_remove_hcd() regarding flush_work().
> > - Add comment in usb_stop_hcd() explaining why flush_work() is needed.
> > - Update kerneldoc for usb_stop_hcd() to state giveback queues are empt=
y.
> > v1 -> v2:
> > - Use flush_work() instead of cancel_work_sync() as suggested by Alan S=
tern.
>
> But why?
>
> Cancel costs nothing and turns potential UAF into a leak, sounds like
> a win to me. I did the same thing deliberately for this exact reason.
>
> This review bot is completely hopeless in out-of-spec and bug-vs-bug
> tradeoff scenarios.
>
> >
> >  drivers/usb/core/hcd.c | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index 8e8a5f59b319..f403795b17ba 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2773,6 +2773,8 @@ static void usb_put_invalidate_rhdev(struct usb_h=
cd *hcd)
> >   * usb_stop_hcd - Halt the HCD
> >   * @hcd: the usb_hcd that has to be halted
> >   *
> > + * The two giveback queues should be entirely empty when this runs.
>
> No disagreement,
>
> > + *
> >   * Stop the root-hub polling timer and invoke the HCD's ->stop callbac=
k.
> >   */
> >  static void usb_stop_hcd(struct usb_hcd *hcd)
> > @@ -2787,6 +2789,13 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
> >       /* In case the HCD restarted the timer, stop it again. */
> >       clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
> >       timer_delete_sync(&hcd->rh_timer);
> > +
> > +     /*
> > +      * Even though all URBs have been given back,
>
> but does anyone actually believe this here?
>
> Hundreds of drivers written over three decades, often
> without linux-usb review. I don't trust them at all.
>
> Regards,
> Michal
>
> > +      * may still be finishing up and accessing the usb_hcd structure.
> > +      */
> > +     flush_work(&hcd->high_prio_bh.bh);
> > +     flush_work(&hcd->low_prio_bh.bh);
> >  }
> >
> >  /**
> > @@ -3059,16 +3068,6 @@ void usb_remove_hcd(struct usb_hcd *hcd)
> >               usb_disconnect(&rhdev);         /* Sets rhdev to NULL */
> >       mutex_unlock(&usb_bus_idr_lock);
> >
> > -     /*
> > -      * flush_work() isn't needed here because:
> > -      * - driver's disconnect() called from usb_disconnect() should
> > -      *   make sure its URBs are completed during the disconnect()
> > -      *   callback
> > -      *
> > -      * - it is too late to run complete() here since driver may have
> > -      *   been removed already now
> > -      */
> > -
> >       /* Prevent any more root-hub status calls from the timer.
> >        * The HCD might still restart the timer (if a port status change
> >        * interrupt occurs), but usb_hcd_poll_rh_status() won't invoke
> > --
> > 2.47.3
> >
