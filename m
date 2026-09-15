Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530043B3F7
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465091; cv=none; b=fXdhIRGJZiffpLPTAQQBqXuKf3Jn2HzcbEEhtQeY3JSXaMadmzGTi4T1E4LEIXIGv3GDE+6yupn7c6xe9dRBBmNE+1g+qrKoecfLFHUVqipr8L8aV/VTW27+rx5qADPZ8PdXNC8rx8UUG0lzJu1q3IKcfQjW3Bfu75f3XQIiG50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465091; c=relaxed/simple;
	bh=pGdr9vJ5p3DfJiTVQfyERa9ZCcRkwBIYp9JuGmZdSSo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gA3BSjkM9RyqgI4W2FgXv5z1+Frq4ABIp6vHHV1NhtbA+VkMngOlNRnK7wZNated+aQnotxlBmTItI35R1zg5fLeOq23MHoVcinMfIpRIL9l/0FzR0JmXPU/9w/X+eJnwsi0TEBfDorWfr0YcuNOKAqnKpImFkzjK+25ycOtHMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt85X915; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt85X915"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso34906245e9.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 02:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465088; x=1790069888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGdr9vJ5p3DfJiTVQfyERa9ZCcRkwBIYp9JuGmZdSSo=;
        b=Nt85X915LSJmoYjtSxxXIgbymD0lnmcwe5G2LTQ4t5//6ji0fS3XLqXQN98OipUCQc
         iO65fALjs2kgixs+WmO8smOiI0ZMHMNdvMfG5YKAWdvPxmjLhZ5OEPR4V54oK8LjzBeM
         w+0CG/EIeAqOM44arW1GCWkluaK83GKJFPPb3foj5ptqUnomtEzL6qQQ604+pGYsDMlK
         3NEafX2e6APGQIjOXPfT/s5c+JlAF7b01JiEfPhtz+mIARoOCQjvFWhI0G5VtvgMzKus
         t09JMbyjacgp5QQu6Gcq0lv3N14Mf+493IeZX4xk500q7zhg9qMVTsNSckaAW1hxjdR9
         bzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465088; x=1790069888;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGdr9vJ5p3DfJiTVQfyERa9ZCcRkwBIYp9JuGmZdSSo=;
        b=X1Ax5ulLQAQzVPQB7fkC1P1LoIzsFuAdY2leuigWQ5hxjADRKx9nwUM5yDaVMEsp8v
         MfXKTqaFqcxT96nL5sUxD0iHGCBqCi+8lDnW+YYH47dx4H3MotE8DYs3jufZMdIqdkO5
         es0nD8UzGfKV28MQqDFjDZSj1kQ3d0mnWHo7hzM2xG60QbfAtbUubjRCduJ6swWak4+L
         zUV3MaK0ZWoMICenZ5ODdk0ymkravysHajZWg/PEmm3HVvZjZz3/U8/Hnx/vNvpR1Kf6
         m/S5pHXN7yOIk4Gy/h6W4H690Ql3GHViZb6/kfWEFL5RYbmVsY8epGY1fR6Pv2QOE9Tm
         SXhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy39aXQpNBKhcOP6gJswvMSRubzxZNofHaPyz0yW6rNTOzd+eFuDKAfvbSM/8mFV6gDEn+ODjqcAeY=@vger.kernel.org
X-Gm-Message-State: AFuF++lTdYX95c5cke+pAtkJ6Ilj+SFvBKSTIkPctYstFlYKh5J9WrA2
	mS4KyZ4JqACqgo03IxTSOj1ypmRNoiyoIrrfbthFABCJF8Dn4e9lKBUA
X-Gm-Gg: AYBFou3FfSG8v04S44x84wtyzdBrP5tWSs35OZ1mywMgiYDlFKKvBHGWFMetYQMp0IU
	83YCZjwEthDQroIa6xgH7Ew0q1bIddkGefbrFQHwR4mXiaRXQ4Ad54wY4Jza7hr4OoyBfBH2q89
	UwziCrOY7o/o7fAtcC9LPaF/bcCITZXVtU5D2EqXscroWCVRTS1+dxdTcKV//9F/Kov+ZPCH2TM
	v+zRYFlQh6lWghCnK6nEyHhJazPlLyfTiJtN7r/GLsOn3p/76GVZZgSks2I+8VxkN3qxxTFFqIM
	0CFBu7CUjxx1tpYwSZraKm82ogPHp8XtSxqRuMyBWPBl9WM9jQxWg2K+j70QwidivV23lAxMOzI
	vEDwU7j/1yHy5C/G7yzOn3haTvNRROPPSPq927qv4n00YhGm3DOu9EBfklQnb3WROg0CurxVBV4
	tb1v4DUAfmzZMp49XTb8CF/onr2H2DjkilhQDjsT14Sq7lXaW/kipBPLVEUJXScDxc8bo5HfzNx
	D5IObTHkH4=
X-Received: by 2002:a05:600c:5490:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49e7a68c9c5mr140006245e9.16.1789465088121;
        Tue, 15 Sep 2026 02:38:08 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d274673sm45754335e9.2.2026.09.15.02.38.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Sep 2026 02:38:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:38:02 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Selvarasu Ganesan
 <selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
 <quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Message-ID: <20260915113802.22b04c57.michal.pecio@gmail.com>
In-Reply-To: <TYUPR06MB6217CD9B8231A5A7EBECEB53D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
	<20260912141837.06b2f3cf.michal.pecio@gmail.com>
	<TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914110949.38a46596.michal.pecio@gmail.com>
	<852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
	<TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914154656.56824fbd.michal.pecio@gmail.com>
	<TYUPR06MB62176901C1E1403E65F9A365D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260915100136.38b4c31f.michal.pecio@gmail.com>
	<TYUPR06MB6217CD9B8231A5A7EBECEB53D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Sep 2026 08:35:40 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> The snd-usb-audio driver sets supports_autosuspend =3D 1
> (card.c:1347), so the device can autosuspend when no audio stream
> is active.
>=20
> During suspend, usb_audio_suspend() calls
> platform_ops->suspend_cb =E2=86=92 qc_usb_audio_offload_suspend(),
> which sends a QMI disconnect indication to the ADSP and waits for
> dev->in_use to be cleared.
>=20
> However, qc_usb_audio_offload_suspend() does not call
> xhci_sideband_remove_endpoint() or xhci_sideband_unregister().
> The sideband registration stays active during suspend =E2=80=94 the
> endpoint pointers to xHCI ring buffers remain in place.
>=20
> This is the root design issue: the sideband client assumes the
> xHCI ring buffers remain valid across suspend/resume cycles. But
> on reset-resume, usb_reset_and_verify_device() =E2=86=92 hub_port_init()
> =E2=86=92 xhci_discover_or_reset_device() frees and reallocates those
> rings, invalidating the sideband's pointers.
>=20
> Your suggestion is correct =E2=80=94 the proper fix is for the audio
> offload driver to remove sideband endpoints during suspend and
> re-add them during resume, rather than leaving them registered
> across suspend/resume cycles.

What's the state of the audio streaming interface during supend?
Is it being switched to altsetting 0, with side effect of removing
the isoc endpoint and then re-adding it after resume?

If yes, that seems like a problem already, because the ring may be
reallocated to a different address. Is this handled?

If not, then disabling sideband without disabling the endpoint may
conflict with pending "large page support" patches, which (IIRC)
assume that sideband is added *before* enabling the endpoint. So
either we solve this without disabling sideband on suspend or there
must be rule that sideband can be added/removed at any time.

Regards,
Michal
