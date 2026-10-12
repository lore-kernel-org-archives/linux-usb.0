Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE745282F0E
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 04:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780910; cv=pass; b=kvDTXTj7RZX0rYiKBNwc1jPfuWepioQgJZOxKftcYkGxNETbpvchaSTPStVI/dgI+xIL1J8pUQg/z0Oz9iBpkee523EYS2ZbDQRzC6colgnCjHeTpTf7aLxGN+bHNfs7pxvbnxo8Jf/vfNo6+gvWdp+mS12wYIPflhJdo4F3xUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780910; c=relaxed/simple;
	bh=9vx/VYo+6G8iZ3jiBXE658v2YHNsnAQSc4/dQn2+zkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfY05iL/oiiymjbtKjxU9tnaguvQ1LnY3AVHhF2Gl90c2A9pZ2y9Zw6P0x27Sw8FgLptylpm1XwfEtTfHi0+zg4FpX7C6E3s1A5yD2L60Llr+M5TD8foYIpZ1/snyQ8fZBpVAZMQ5fFisnV8xyI4vp8YJMsB2oB+mtiivFj/PjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfyRlPnM; arc=pass smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfyRlPnM"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-828c0b569f6so692831a34.0
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 21:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791780908; cv=none;
        d=google.com; s=arc-20260327;
        b=NQ3/I9mvN88FptAop/HxtU+bdebDY7MjXO6NKMrd64rYx344c6f4e7EUVMUp2amyIp
         MCtKqk2TXcPwbYLPZgazUjLh1jk1BnoG7ZCH9vqAMhRSinASHIhViMUif08TFNSYokMk
         fYbLbjldHaQMGkjflWAdy/Kl4QyTKoSO8YYJe5SphdfSC/KOAWgq0WMBBO+XwVx0I3Pb
         lofj5PZHvi0IoNJuLPaS3+2f8EX2kq4Lmv9eaiC3W/xUwJwdhGMP9yaEMY7+ATxm6IrX
         F1BveCqiA+QqXeywEWcfWA97lQ6Rs1WY01aOUZuho2t2Gb+753RzRmT2xTuZnXHSzlUD
         Sd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aqvyDxeOl1wvCDEtRUYDI2YTDHjt1RCV2NsQZH4A4Cs=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=E2rnEgVCKnx8bRS8Tw1I9N2q09V4krN0qxrlf2DOlcNW1g3pHpyCBmZF5koWABFrqu
         FYG+7kAVdhxtt91gh++NVTaSBrbVM+Y713RKOcYU41fvP7Ksk8ymt+N3CtmLWSaFePIT
         CCttQL/2sKnV35Bv3sV8RY8Bt/WaV/d4IJZpYiLqlTDbaQgcpgY2CJXcVmLf9AETKvq+
         i7OTgUAe2K9boVOy8Vd7E80PCwo6D9u1p3fHjmKW79ZzJhGbSe29VSQQJrPUq6QXtUBW
         L+nyzL/Aaj49nOC6WvCzzy+0JDXoO6TXFSUsl5zoaYJVdhxcTGNB92nnQ2AV2W7ULPDY
         7ytw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780908; x=1792385708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aqvyDxeOl1wvCDEtRUYDI2YTDHjt1RCV2NsQZH4A4Cs=;
        b=UfyRlPnM2xGiZmtZfX7avGIh7edxc87BMmyi3fUj8DJ/8WjLMn5XICpBNZrDgrqaco
         4jlbk0XtnFmbrKKedJviOIXml+m/CRsb4gIzUAndl9gWZHhkZmO2V7tpQMOzQM9C47il
         mHoS1Fjqzo/2QnezLngkGcreAXi6uMJOkKouG5xXgXtUmMwvxn0TJunMzXnRDk7MNzZf
         wLdvhcd3Ji1mHNNI4kSJKFIjChOSFKJF2wzEp/I0DrrZd5agizj0o6hBaBsxsbwm0pk7
         1CDzphU9dMD5UGGNliGphLjFgLFmEN/cAM3YlcQGcE/CUSEOaSvK6WJMd44Dxt1oGwDg
         T8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780908; x=1792385708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqvyDxeOl1wvCDEtRUYDI2YTDHjt1RCV2NsQZH4A4Cs=;
        b=Oj3gC6vrb6NTf+k8YtiXX9PhzVDia4FV+pqcyr3vgdTz/grrsOHNzii332g2BCWZ7Q
         DbFq6TxWd3Z6QjxdWJP2RwGtcbh979axFsv6AdKt5wcOi6Hk84B7AdIvnOuWXpsGZSGm
         w19y0I1WfEZ6O9nyLQ1MUOt7q6qhXtaqDPtx6MlRN7YSe1dNpOWlLDI/fFJ+z+860sud
         Z85yh2wvIfIvg8y4ETpU2dIpjNyLNnp4A0BaSbeaYs8zynqYK4iJYv93KfZzAK8PJPRD
         EAsuCcYQuW5Z959jOoGcdZ+EIwgiEjXpzkpKobSo1Y4zvyNhr/lAxNJlvGPNVGVLedrY
         Bx4Q==
X-Gm-Message-State: AFq9FYIt8ZoObELQNckrbWVygKmvQnm7MM0FBX02Yz26W1jaQAvWXoH6
	BrKIsFx222uFxwsF7+TwA2cirA0kPbxuqRri7WaBfbS8g63J/Y7mYbn4BpfbGXKqvnO5+z3mWs9
	C8k2PMUwUhfOY6Ybo30/CTKZV6wdzwuX7TTvhDQCIeQ==
X-Gm-Gg: AYBFou1Zyzwf8dE4nAeHU3tapW9UktYD2AykBkzL4wGEHOrlJTZFP+3zG89VItc+q13
	yRLAwapXwE0rJ9zmpFpWtYo3r0O0bYxgFspE+bo0C2VKKEBRsPBTWvqMbqGJFPfbWK12l4OlACn
	IQIC8z4+80XXENW3jthRlK/v58rJE1+O3wu47NxIGmjkalN7MPiET37X4EYKxT3AJS7WH+jx75Z
	GpGhKiPdeaBsggWuj9TyE9zVafQhmfG/K4cPEicFL8BdG3eL89n+nk1baLib7byO/GTdNFseurS
	YxQ2WyfV0N/1+p0OW7fmQ6ofts510hSBjvrVgsGf1kRsSTHjxetTpwiimffxWUaG+WhgVvywZeX
	uT+A2FYa+pDmUUQ==
X-Received: by 2002:a05:6808:308b:b0:4e8:e664:f268 with SMTP id
 5614622812f47-50c52f1b32bmr8648086b6e.25.1791780907663; Sun, 11 Oct 2026
 21:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011035150.53315-1-xinsheng.zhu.ny@gmail.com> <sashiko-outbox-167584@kernel.org>
In-Reply-To: <sashiko-outbox-167584@kernel.org>
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
Date: Mon, 12 Oct 2026 00:54:55 -0400
X-Gm-Features: AclHuK9wQ_vVEXntxeqyIN1mfTO85kGFLtSXc3BvcstRXkNZqeUsWwxQu9E5AfQ
Message-ID: <CAFGKm+xW=UW66mQim2oLywHvv+pNdppAg-4qB9ZhhLKqAta8Ew@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

> Pre-errata devices typically return a 26-byte structure
> instead of the full 28-byte structure.

The NTB parameter structure was already 28 bytes before the CDC
NCM 1.0 Errata. Issue K of CDC NCM 1.0 Errata [1] repurposed the
existing two-byte reserved field at offset 26 as wNtbOutMaxDatagrams;
it did not extend the structure from 26 to 28 bytes.

The driver comment says that "devices prior to NCM Errata shall set
this field to zero", not omit it from the response. A complete 28-byte
response with the last two bytes set to zero still passes the new length
check to avoid short read and uses the existing tx_max_datagrams
fallback later.

The patch does reject an actual 26-byte response, so compatibility
would be a concern if devices previously supported by the driver
return exactly that length of 26 bytes. However, the quoted
comment does not establish that such a response is the pre-errata
format.

This response was assisted by LLM.

[1] CDC NCM 1.0 Errata, Issue K:
https://www.usb.org/sites/default/files/NCM10_012011.zip

Thanks,
Xinsheng

On Sun, Oct 11, 2026 at 11:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usbnet: cdc_ncm: strict 28-byte length check breaks pre-errata 2=
6-byte hardware
> --
>
> commit 21684fc876b53044a42f2941b653d84cd5d8ed14
> Author: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
> net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
>
> This patch updates the initialization sequence to strictly validate the
> length of the GET_NTB_PARAMETERS response. Instead of only checking for
> negative errors, it requires the response to exactly match the 28-byte
> size of the ncm_parm structure to avoid using zero-filled parameters.
>
> Link: https://lore.kernel.org/netdev/20261005041525.49111-1-xinsheng.zhu.=
ny@gmail.com/
>
> > diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
> > --- a/drivers/net/usb/cdc_ncm.c
> > +++ b/drivers/net/usb/cdc_ncm.c
> > @@ -524,9 +524,9 @@ static int cdc_ncm_init(struct usbnet *dev)
> >                             |USB_RECIP_INTERFACE,
> >                             0, iface_no, &ctx->ncm_parm,
> >                             sizeof(ctx->ncm_parm));
> > -     if (err < 0) {
> > +     if (err !=3D sizeof(ctx->ncm_parm)) {
>
> [Severity: High]
> Could this exact length check unconditionally fail on pre-errata CDC NCM =
1.0
> devices?
>
> According to the driver's fallback logic further down in cdc_ncm_init(),
> "devices prior to NCM Errata shall set this field to zero" when referring=
 to
> wNtbOutMaxDatagrams. Pre-errata devices typically return a 26-byte struct=
ure
> instead of the full 28-byte structure.
>
> Previously, with the leniency of checking if err is negative, a 26-byte r=
ead
> would succeed and the kzalloc-backed ctx would safely leave the trailing
> missing fields as zero. By requiring exactly 28 bytes, does this patch
> unintentionally reject valid 26-byte responses from legacy hardware with =
-EIO,
> preventing probe entirely on those devices?
>
> >               dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
> > -             return err; /* GET_NTB_PARAMETERS is required */
> > +             return err < 0 ? err : -EIO; /* GET_NTB_PARAMETERS is req=
uired */
> >       }
> >
> >       /* set CRC Mode */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011035150.53=
315-1-xinsheng.zhu.ny@gmail.com?part=3D1
