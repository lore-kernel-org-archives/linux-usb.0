Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451238645E
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 02:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130032; cv=pass; b=JemseRspCkSrclcm+T/h3ydJ2PbPsWrYwKFQIiBIL+GinJeft6KNqsEOd6htB+V34g6Bw+OUUQf0QEfYwIvWQ9xglvIlxKCn7U6UNB7SlXme9VoSjUX+eOPsiQZzMEmZcqxqwRPJB+7GpXuhuI8UkbWQz79MUW87vbjx0GgzQ1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130032; c=relaxed/simple;
	bh=V2qdxgflwYbcUy4nEBTsHeRv63mxYIc5awkYH7z+8Go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4uZPO/i5Wc+Vz5nIPEFuNgbTyJlGtVBiaAMW50T4mbGXgPDj6XVQvlrFB9zS0Bojb4MFEqRC5HrTURUPiwRKdEpJS4pK2Ls4wLAuQXwz9AG7VJrpu7/i9RuEqY/px4Y1Zm7fFxf8qrGuavLuWCX+Uy2m82a9ysAQop0hfqwLlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kC1lQ5fU; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kC1lQ5fU"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso49440566b.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 19:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790130027; cv=none;
        d=google.com; s=arc-20260327;
        b=NFXAWcDRdLZXMr1OCa7+5rhZ5uNslrJ6ICseBdaOJiOhIhrUZA7osdsilakzC8yz/6
         I76vvztAt6OJY6xBHF3r0c7h9iWsJeHjYcUQuZ0wQ8AMLk11w+Cr6up2ZwUi7d5fqk2s
         t/uyt+73iaNM18TIW+t2i4S8sY2lS/j5qaQou1wFY8LmykdFwe8kewgWWy5yixjniAgq
         Fct2bs56G/ZvJkf315inwNpKpwEH64v/i4AOjWQQ7cHSZJjmSGG7ngyWKMjC0Q2cxCrD
         i10udXaOTkC/t5KfTQXM+HnzatJCZtC8KXUl7I3z/gNFevHStRVDnqUQsHqqazHXdTNq
         h6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHAMnnqxx/cbG2yYwp/DFcqdHQsSMkbzmwZSk/C58dk=;
        fh=Qo1bn4GLk2DqlN3/bUf19AAImgns/smwuYRYBrLMB60=;
        b=N7+CJuKSWG6bxJbznwUV4aMlrfY/Tx86uEZ/yvxVJnsZu+dKdU/nhbYLVbu55dz5m9
         FHoJMQxCsSd/H2f9GxCl/tf4G1dXT4vJ9Id5+jKcmOnG/X1PcEWwEH40m7MhZiYyH+XO
         Zpw2v/I4Ro0iu6e7qFGZujJAz1g4Aa7SXFZTFLSOPjRZs07zRa4hKhPfgzVY1KzlWaTA
         92SZU4bQ5l8N8Ppr5xlcJmQkRSpMKb0MrI5oqj8vlGtT/ZGR8AWXTJKZc3WwTe/1oUwp
         gt9RkV+LZ0V8aCZdJLFK4lXGVBdgsjqBPKOjQP+6rzdD7cyVjYFBwRV9urm8++Weh0fV
         DB8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130027; x=1790734827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHAMnnqxx/cbG2yYwp/DFcqdHQsSMkbzmwZSk/C58dk=;
        b=kC1lQ5fUoN1Z9eUoZg0vjdTywC6mgm54WycyzmlcUSx040loyyEVjmQdIq6M1ZKpaK
         dUMrOKCK7T+iMCxyPNjRhQdm0r9bzIoemC86pOlfXC7G4pAzlaKOy28yLm3ToecLI8e+
         gKtFtvia+wtlm2I+4N6LSz7eJIMqmWqHduT5uEpwqiWll6qlifbmdeAHuDy9l+vVJRvj
         krCPMPnsMysttGKCMAa1bWl+7/VhuSwWx4Yqp6ev8w2Z4vOriRLGMC7ANOgNoCN1d9DQ
         mhEsJou57CB5APdmTMDbSD03uJvoVr8E6fhhVq++hbinQM41WYTCzcFR8011/oI1FqyV
         Cm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130027; x=1790734827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHAMnnqxx/cbG2yYwp/DFcqdHQsSMkbzmwZSk/C58dk=;
        b=Sfiy2pPCWprCCdzmPQMj5mJOlxqz3tmW4U1tU7Sswb7wowjerUs6MuoXjkQH5Ib6Gi
         AUumbHqA3KSLvU3xDo+tOKY1/fQX93sJo0V9wqrxBVm+mkzJM0ATZVLFvy3MRFXtdv49
         SGEsK1iM9VipvUDbkkOuDo3nY2xuPfxsqgUYgg6IZIqv5T5oYy8s+9uAOuCG5icQUEnn
         4VLgEtdQQelNHCgm9CHZqdBC3osMl51ItlDSymv15brlEfBtvTi57yIxi0C/PJj/Chok
         cKCBO9UXxbDu8YkXQBRwGIEeXWpp3fSqzPs38/1MF06tP50qJwZcgORhByUOPNsNPiGu
         B8Tw==
X-Forwarded-Encrypted: i=1; AKwUvByVNiHILyaFRj4MagfrrX0qUQgj4HKxn+geWF7MolZ5dRkrvVqQs8ArBiFpR75whAFI1Gruuf4U1l4=@vger.kernel.org
X-Gm-Message-State: AFuF++mtsst6Zxui8R3PR0AkXA5vB3UDiKeuDpUtuPqzvqOMBQqgWkdM
	tYy2o7/6+oEMN/inENe0bHsLPkAPciL+LytCFrk/l3MZr7cB+oNH+kH30qo1xsD3qB1WTx5v0kS
	Q77j+NVxpBecsKJxdFj+mJ5dBSvDzMQ==
X-Gm-Gg: AYBFou0gRc5XVDyJ2pKSY+r7aHs0we8GQ0kTYOaPJ1y5IPYjtoXXBfdpwY5t3MxmZvf
	TLUCgWVs+lO9EL8pOgtccaaB885CRvMV/hZ9bwFQf6FjjZqubgHr+olAb7EO9W3MPo+OFel1IEV
	Gls1Lw9gTBvTaijmTklta6ngbLGbzoOfDXRZgg1tjeyquyzQSHjzEjof1WpHkVRRCyXgbcpQy4x
	5Ews5VAOqLW8nGVv0mlY2fcSOQG9qnf7jLkqA87yO9orMk6Vv+pJdxtmH72oRBVe2j3oJnawBg7
	t35Qvgcs+ODo33gf6AuTqlaQSx58DKNiGbgumPFTYbFVLNjrXALmu9raYpP0O1D7P8ectrFiM5A
	g1u5tdjxnTRKX1UAXQrJPICWR8z+fXOFHjAORZ4AtIsyWLJg1xxPuhdK3f/ORW4Hcv4pO
X-Received: by 2002:a17:907:6d09:b0:c29:386c:58df with SMTP id
 a640c23a62f3a-c2aae1554b1mr81202366b.30.1790130026893; Tue, 22 Sep 2026
 19:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921224130.492681-1-mhun512@gmail.com> <e66371e0-5e8b-4e31-b8ad-223ef399b056@linuxfoundation.org>
In-Reply-To: <e66371e0-5e8b-4e31-b8ad-223ef399b056@linuxfoundation.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Tue, 22 Sep 2026 22:20:14 -0400
X-Gm-Features: AclHuK9JeOGZvLyT-fIJ19lQTdK6P8bGVHIqzJ81pyWe_31NSzPoIRlvRkF1ljg
Message-ID: <CAGEsz8HAeXPmJ0nb0P2Ejd_=d7vspAwaf-ZefXEecez_11bwkQ@mail.gmail.com>
Subject: Re: [PATCH] usbip: vudc: Prevent transfer timer rearm during teardown
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ijae Kim <ae878000@gmail.com>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes. On an x86_64 QEMU guest running v7.2 with KASAN and
DEBUG_OBJECTS_TIMERS, the harness binds usbip-vudc.0, sends
USBIP_CMD_SUBMIT while unbinding it, and repeats.

Without this change that hits the free-active timer warning and a
KASAN use-after-free in v_timer(). With timer_shutdown_sync(), the
same harness completed 4000 iterations with no KASAN, ODEBUG, or
WARNING. v2 does not change that timer fix.

thanks,

Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 5:47, S=
huah Khan <skhan@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 9/21/26 16:41, Myeonghun Pak wrote:
> > Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
> > vudc_remove due to race condition") made v_stop_timer() delete the
> > transfer timer synchronously before vudc_remove() frees its containing
> > struct vudc.
> >
> > That does not close the race with the receive thread, which is stopped
> > later through usb_del_gadget_udc() and vudc_shutdown().  The thread
> > calls v_kick_timer() for CMD_SUBMIT and CMD_UNLINK packets, and
> > v_kick_timer() deliberately calls mod_timer() when the transfer state i=
s
> > VUDC_TR_STOPPED.  A packet received after v_stop_timer() returns can
> > therefore enqueue the timer again before the vudc is freed.
> >
> > timer_delete_sync() only drains the current timer instance and cannot
> > prevent such a rearm.  Use timer_shutdown_sync(), which makes subsequen=
t
> > attempts to arm the timer no-ops.  The transfer state no longer needs t=
o
> > be updated, as it is freed along with the timer.
> >
> > On a KASAN and DEBUG_OBJECTS enabled x86_64 QEMU guest, repeatedly
> > binding the device, submitting a request and unbinding it produced a
> > "free active timer_list" warning followed by a slab-use-after-free in
> > v_timer().  With this change the same harness completed 4000 iterations
> > cleanly.
> >
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
>
> Were you able to reproduce this problem to test and verify that this patc=
h
> fixes it?
>
> >
> > Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remov=
e due to race condition")
> > Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@16=
3.com/
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >   drivers/usb/usbip/vudc_transfer.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc=
_transfer.c
> > index d4ce85c4c6a2..4146b746a320 100644
> > --- a/drivers/usb/usbip/vudc_transfer.c
> > +++ b/drivers/usb/usbip/vudc_transfer.c
> > @@ -441,7 +441,7 @@ static void v_timer(struct timer_list *t)
> >       spin_unlock_irqrestore(&udc->lock, flags);
> >   }
> >
> > -/* All timer functions are run with udc->lock held */
> > +/* v_start_timer() and v_kick_timer() are called with udc->lock held. =
*/
> >
> >   void v_init_timer(struct vudc *udc)
> >   {
> > @@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
> >   {
> >       struct transfer_timer *t =3D &udc->tr_timer;
> >
> > -     /* Delete the timer synchronously before teardown frees udc. */
> >       dev_dbg(&udc->pdev->dev, "timer stop");
> > -     timer_delete_sync(&t->timer);
> > -     t->state =3D VUDC_TR_STOPPED;
> > +     timer_shutdown_sync(&t->timer);
> >   }
> >
> > base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
>
> thanks,
> -- Shuah
>
