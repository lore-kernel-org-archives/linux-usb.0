Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793374164;
	b=uE7wntb3gKf8bO/DlNUnp9wv+wAM3xOtuykteNnleeAEZvK3kNd7XxNdHQD4+b+oG08V
	 As0gg8hS+95biuyhsyqhnSGqKOdEXhr9UTbT3Il922uQmJEaoOeFafS2o4Di5dBH1rnip
	 a0MdpykRzEcjQvWxI1YqrKaZjCuyZrzxKuga2kyotHUK5Ei6ULkSNad7Kk9ebZu+5fX3m
	 5I0uGVRUGVSCBnhnivFyFXC5pcvMaK4+VdhB+ju4z0nZ1lJpn+MuJO49oJlQYWFz+l7GW
	 QTbwxSGum8g9gD5tl7ukd/3EZQRPlMwcl9yH5GrjPXkvhdv2p3POleuhIJK+oVxIcng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ifs0dZiIbKAiwzh72marcgxeqRTvjNaSkmgSKzN/rXA=;
	b=ErVoXa4ZMY2QUTEG57EnSDFihVh3hYFtxYNZrOsgjCkUk3QtdHHZD3IO6hVbHbx1hKWM
	 x+uPasRwuylTX09yih4hPWm4OIPHUhMuOYbSzInhm5Qo2HGpgTwsMSYuiAHZZVRab7dgF
	 /DADnWe8cK8mhMhnsk3BpBusood7usxIhSEgDlnSLi/YCzSAsiVoAWM+qNaoWoLyDRVTp
	 Sz4VIer0NVr3+y46pD2H6fNJq+2oczRTlRp7hZp1b02p85Xb8vjmTfEN/3fM/3zf+uDs+
	 QWJPArZ/W/1ExavDvluUW73SXmgFXgT2PEtVcG0QQSGUPFIfmMBXrUrjaNrL3pmTCEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Mi7q2/VT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDD4606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 15:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBDD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Mi7q2/VT
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso7669831fa.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 08:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793374162; cv=none;
        d=google.com; s=arc-20260327;
        b=dnH4N5NcX5O6yTfazLfivS+KRC3DhEJjYCftD4dbKrq+GuZQOq2EZRV8jHuYHG4Q0U
         3wvScU/bWdbC6r00gRAGlRzP/Tw4TysgkhSw9byoEYLPUe2scHYJqMpaK8O6heVUUscX
         2iiYA53GSKFkPHaD8jqGc5WUJ5bzWB/6wbg/+csDb58UYfXnqNSJPMXeDL4HnSv8BL9q
         WZPWnaLrDpC5FG6aOIZgWrY3IPO80jEwWmnJsHgp25TPLJi1H1jTuZP6fN4y/7IzfKsN
         FYRSt9hrk+2VjC1asgK5wxvbk6UAgXsouUnyRslKCUdhpv5/ftQsbHxdc4PJEadpPSFn
         8gRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ifs0dZiIbKAiwzh72marcgxeqRTvjNaSkmgSKzN/rXA=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=irDBDX9k2S5/EgUbYgsDiMLdn099R0NhQA030LPGDwgzYQMElI96v6xQNYLDEh2XTX
         vCEAw5pSrULRcPVWH+LScFNVWQQG2wYxtodNXwOrb1Krw1kjDjlDkmN8OHU3vWn6rS0j
         PQFFb2zPEp5lT46Zd3Faod7Nc76TT8z/zfTC65AT9y5MXOMoBl4jcHUXiN3kWPs65Y+B
         wyjd+G0mivJngGN4GknxQmC8yzhhpd60XNTIZzjG1Ye6BhX9G4y7ZXVWkW//JmyrdQFN
         X/tAL+rP2n1koONcYUJDWBzotPcLAqIi8OOCdCdmijUeAv/xURlamC3IJ044Na+nbEiD
         oNzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793374162; x=1793978962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifs0dZiIbKAiwzh72marcgxeqRTvjNaSkmgSKzN/rXA=;
        b=Mi7q2/VTonaNkcCsc2WWR33FwD7rGodVvNDUY7/Nx5HadkG1GaKH0i8908s++NR5QW
         NY1BYXJa6k80le00Y3nh1eZf4lNwGsz4NRpraq746l7stf8J3rGGSFZDGPu2jRXPTba1
         TiK8K54wd2n+NrMykGEtg8tOPSmKVoF3NsmJls28ItqPyn0GWvK02hIeJs5IXG0XeaZB
         eyryv5rCigzia59BdfjBod+YmURjbHFtetH0Px5yFuwzbwICJLVMCiyzBxn46SFuUuWW
         6lM6VCvNRtAaqcya5Pk/v9Hd4kIQkXGU+JLsMiRwEQNo3MbsfIFt+qKaPz5gzkNBg7F1
         cAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374162; x=1793978962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifs0dZiIbKAiwzh72marcgxeqRTvjNaSkmgSKzN/rXA=;
        b=TDOCaS3Wnfbr7ScZ31yM8GRdLqsuHMO5IidqMHpxdggH6+JPvuyGlQlzJLnUbX5IJ2
         i5cA/BA4xJ++fwFe6bJI6tVceTDS+zk6Vj+mVFzbmBHfVt35wz78TFT5B+oOj5yPVKsk
         7bSFRW/RVsjfXDgKA2iSiOczDHeaWPdibTgsNWuO1udFZ1ypI/PCWi3k01jgC5Ykkfdc
         a6pvXsLE746YdQt/UZJr6Ensj/eIBWTrZ/GTFIUtOnm/EGlsby1IKoWELzCmn9R6gLQp
         NdOXeE0jN3yAWElD0aSLTivB1KMI0OMEEDrLmsJespBJqciuZ32gFZjmP8lRV2HMH7Ig
         1mGg==
X-Gm-Message-State: AFq9FYI0o79PIRpwkz4IvXup+I75AuEp6kiVYWXrYbioU29xh3LRb99z
	3l2f17n7MSOqu8AZFpOvNuhCsmyBrwyGQYjEy7OrARp9UPhKJMyGARhby5nvqYQzhi/VyZnNHPe
	IJDMgtSTrthCb+5YiQUbLpGj4ps+7YyuPRvgzyOSLNHvjYgntl1awPRJvAw==
X-Gm-Gg: AYBFou39YUerV4AzP51RXUlJGdu4iAQQSfT0lnH+fu+it/gk5ghByk2vEhTkz0du4H6
	ZsVLxODB9p4auzuSvmShd1GPXigTvfHjV1h9j6DhoqcIKzvGaff3UT7tCHY08CIam3xaEPC+av0
	mBp12Hel+NfC9D8Y1lAhoAqevHaMWL2Vkg3kRq2Piqb2xW2hJ7NkRxgPCm67VprULNApy1ioUSS
	/FbJ35LWMC5qTdqq+qiX01lSNSYYB7r436M7EHWJTqVlMudFQnCqnayaTFNowip0KcYcC48D4cD
	lcFroE3yoWXVUupo/d1cg+RVlClpAs+unIO6z+dVTLgfSlBPp3IObwtwJh6WLR7Jl7icmnriIfF
	HxVXwMd8TtKiYH9wYi09BD8t7ZtJ1NqozmzSuyId/uWPjHKC/xuI3/mXmXPa/9GYFGVRsGw==
X-Received: by 2002:a05:6512:6097:b0:5bf:dc0f:6462 with SMTP id
 2adb3069b0e04-5bfdc0f66a5mr730635e87.20.1793374161913; Fri, 30 Oct 2026
 08:29:21 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012095452.135828-1-marco.crivellari@suse.com>
 <20261012095452.135828-6-marco.crivellari@suse.com> <sashiko-outbox-169423@kernel.org>
In-Reply-To: <sashiko-outbox-169423@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 30 Oct 2026 16:29:11 +0100
X-Gm-Features: AclHuK_Wy1ICXYldQGV0SVt-Z8rxfuERMYG6nsNJshBN3OSvw_3xfKbAS6Qaf7c
Message-ID: <CAAofZF7DvcYaNt_SUUA-wKUJXcX5rx0x7qBFadidPGdBvjKyEA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/6] net: usb: pegasus: Move long delayed work
 on system_dfl_long_wq
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:59=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usbnet: pegasus: missing locking around multi-step MII USB contr=
ol messages
> --
>
> commit b4ecccdd796761b12d0bedd35e1c982cb24bc36a
> Author: Marco Crivellari <marco.crivellari@suse.com>
>
> net: usb: pegasus: Move long delayed work on system_dfl_long_wq
>
> This patch shifts the delayed work for carrier checks from the per-CPU
> system_long_wq to the unbound system_dfl_long_wq. This allows the schedul=
er
> to optimize task placement for long running tasks.
>
> Cc: Petko Manolov <petkan@nucleusys.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> > diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
> > index aba1a640fc268..ed3f8d555c2a0 100644
> > --- a/drivers/net/usb/pegasus.c
> > +++ b/drivers/net/usb/pegasus.c
> > @@ -1118,8 +1118,9 @@ static void check_carrier(struct work_struct *wor=
k)
> >       pegasus_t *pegasus =3D container_of(work, pegasus_t, carrier_chec=
k.work);
> >       set_carrier(pegasus->net);
> >       if (!(pegasus->flags & PEGASUS_UNPLUG)) {
> > -             queue_delayed_work(system_long_wq, &pegasus->carrier_chec=
k,
> > -                     CARRIER_CHECK_DELAY);
> > +             queue_delayed_work(system_dfl_long_wq,
> > +                                &pegasus->carrier_check,
> > +                                CARRIER_CHECK_DELAY);
> >       }
> >  }
>
> [Severity: High]
> Does this code risk data corruption in the PHY registers?
>
> The delayed work check_carrier() runs asynchronously in a workqueue and c=
alls
> set_carrier(), which performs multi-step USB control transfers without ho=
lding
> rtnl_lock() or any internal driver lock.
>
> Concurrently, userspace ethtool operations or ioctls (which do hold rtnl_=
lock)
> can read or write PHY registers.
>
> Since the operations interleave on the USB bus without serialization, con=
current
> execution could overlap the hardware address and control commands, corrup=
ting
> the PHY state:
>
> drivers/net/usb/pegasus.c:__mii_op() {
>     ...
>     set_register(p, PhyCtrl, 0);
>     set_registers(p, PhyAddr, sizeof(data), data);
>     set_register(p, PhyCtrl, (indx | cmd));
>     ...
> }
>
> Would it be possible to add locking around these MII hardware accesses to
> prevent interleaving when called concurrently?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012095452.13=
5828-1-marco.crivellari@suse.com?part=3D5

The race seems to be real but is independent of the workqueue change.
Add a mutex in `struct pegasus` and use it inside `__mii_op()` should
solve the issue. I will not introduce this change in this series.

--=20

Marco Crivellari

SUSE Labs
