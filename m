Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8FA372662
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696751; cv=pass; b=AAoZR75KE2kwz/W5ofO3ltba9QanDgkKB7PAiK3J1sVsagFms511Fuid2MY5u8Cgvax8boC/cB8PLyh+fLBi6rvGJmC1E+VIo6mNEMofVv0l3kTDgif12Dob3lqwzuvCICg8k8EzpawGRn4iTnjryMYgCr6sK09rbfWKbsRMJAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696751; c=relaxed/simple;
	bh=vlOPFWvLXaXAks3q8MUSQObP6zdHEcQsjUabDnzdjCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fi4nUeKKDYRj3IzVPHZyY7oMVVgu/H9dPy0aXPwbcaP+KhrOf/knehoWI6V3in44PhQ1ahtwJfvnHlGUK4yKZ1OscyUAlPyBsVEVsOFUnadAxHIPlpkBP61dezLl96fce2my/6Oa/JWQ07aym7Nol1WcVW//CaMFtrsongJAocQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvRMnZZC; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvRMnZZC"
Received: by mail-oi2-f13.google.com with SMTP id 46e09a7af769-80a71781323so77583a34.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 18:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789696743; cv=none;
        d=google.com; s=arc-20260327;
        b=a7C2NQim9PiJQMSxG+tQ4XuJTS1+sd6Hg3mt5wae/Iw0L7GpevZGCQBI2SQRBOxkPT
         e5NW7VuMUqZDBC15w+VmRsvFCm/J4BJhqSg+8FkTLSOh4bye9+Gj2MxwW5WkFvihqqUT
         PbC/sRNilHYX1DWDMw4S0edVTYdyvG97PHBFJcZExLgdUj8X/HkeeJ+psYAbfnXCyna+
         faff2HBE4JsQZ13m4wxTMl5cXSV+D+XIzstWsWpIqDPQTaJBxmpQs3/rraUIR51vQV0n
         Sr41VMTnrt8y6RspEzjQ82Cme7qciiVCbHgV4oj0hA3aK28FK0qQrNTUSUVzd6V+0cFI
         YyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qx5BVfvWrGBV4tqbhaO/qriu+mVTHdn10qv6BXQhZFM=;
        fh=8BPP3AsSM5qWoB9Y4mvHYlu9/v8R9qbGl9WtgHKA4Jg=;
        b=paniCmmXfs4SJuEXF3GuOjbKJzulfIX41rsLUBVkWTxqleZ24/HuHRVygtsY6Yi7om
         gvQozj2BCiK3Cwi0S1e4m2DbK6qg0ynKZiHoTSfILtOHkn4SlP2XWgL/9t+Py/sk/M/z
         /w3l75yG5MpXECWl5AWD4EcXIBBlP6ImxmPfDctyGJFr4aL/C/A+dmG4ZDLIBWpELrA+
         tKFb9xlNaij79sfTat+8YnFXQllNR2jQz3nKIdYtuDxGek04oe5rgi3dF8uKLir6gx1k
         gJ1FjazhyNCa2xd60pPqnvVmURDLYqBBc1InKaLfjUNFLFGy2nT7VPmLoEZEmQfn00zA
         gsig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789696743; x=1790301543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qx5BVfvWrGBV4tqbhaO/qriu+mVTHdn10qv6BXQhZFM=;
        b=fvRMnZZCwJkadLU5nhmSgiS38zftm/m0wZiW3QDmJC5SGVSQnVsETyN4aCwiX+y6gJ
         Rj3igNOVxQbDCam9Ggk6M0JH3KNtGEfEtVHwtfqoQOmbtdiPBgo0RFDVSgc6EM2rFDJb
         zG1XVzW3NQ+EYEmMItvxL9N7BIP31/MQTpZyuiUIVXrbYgJ963Gh5mPjWfJDXorpGO8R
         7SsB6eEZQ0r97iIxpPw4BaIX8vLNjuQOZyqxsDtAyQ0H1NNn/G19jpI4a6hH/pD4lTNt
         XW7TuLqa9/zNcnxBw17G9BuADEgOqCaPLHwR0uAu1n28jBndIZ+V5SxAoJ+7t0UPGt/K
         1a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696743; x=1790301543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qx5BVfvWrGBV4tqbhaO/qriu+mVTHdn10qv6BXQhZFM=;
        b=F1Tdx2laaZ/rJOuOYLzne0ZFRLBG6xmSHRxmIS1u8knZk5NehAEmmK8a7YyrDjhyd/
         ijy1DNszKlHcl7vH69vf7sMJqplWd01H39VxqeokVCVTX3841Aiy19NvP23OhZxQBYYl
         2EEqN/RjbcBMqVAgwav5ZSvjm4YOD/W5XEOhvq8+oc0kaq2i70VTTHJdBRQYhicGN9ld
         ACTFvNQuQdJjpDQuBOh/BvJS2fx7Gmkj+kPM6hJyq3dbAiVSQBTklbi8CgDtxkkxmYTQ
         C3mPwDpHMw6gaL+MNLu5A0tTE9EJptf0uR+H4eAg27tZvRiiVC4Shnnupf/HRLVcngRC
         xDag==
X-Forwarded-Encrypted: i=1; AKwUvBxE9+xsXDmO3x0j43xWTHPQyH1e5zxpULc73THiTLna3YwuFePUNcOD+NyUF/SAWmMsgi2IgVpCiPc=@vger.kernel.org
X-Gm-Message-State: AFuF++n8NzyaVcibxWcF6k6zF/VJby2/ayPA13m+rUA2LRzlFmsUD1Jv
	SazKbQEvgHsPbYDPmUrrHxhKSn+gx6oPQwjHiGrmVs4HuUIMUW5lXZR5RMRQvIcaHFJdtUyxdHW
	WZweHDdrBv+crM+9+SGemy4Ck3nJqeL4=
X-Gm-Gg: AYBFou0hqMSo7eLNkBgEyFLcgrKpbYFMXxGOukZGadhgPtjKd54DOOiaAXP1h7x4E/a
	rjL48eN+4vbTVtQMQ382wVQywF+hI7aW6Pioz7j6jp4INfmV7h32H4A0AylG8uS4B7wPpYilCo3
	NIBv1A/K4UMUjHBfoP6tZyalLOciSqEgff2EnmP7aHC2Jm09/uoAVFdxfhudLDbqd0WYqf7Rf2U
	uiQDO2x6rwRzvBiPDi+1VawUgW7R92aLX7mpHYYo2PMCCAs/3UUmclvsYY3I/DawtyUafilabc2
	xIypQqrOkXD9VObz8aB6ZT/4JmO/63XwZvE/AygrMUzskClT4k9DhU2OoQ==
X-Received: by 2002:a05:6830:6a99:b0:80d:7045:ec38 with SMTP id
 46e09a7af769-80de035af5bmr1358143a34.7.1789696743283; Thu, 17 Sep 2026
 18:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com> <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com>
In-Reply-To: <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Fri, 18 Sep 2026 09:58:52 +0800
X-Gm-Features: AcwNN1V7r9agV3RFgkiJtTWQ8Vj99zTBMZbHcrx3v52XQj6k_uPLO6nyI_We1jQ
Message-ID: <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Mathias Nyman <mathias.nyman@linux.intel.com> =E6=96=BC 2026=E5=B9=B49=E6=
=9C=8816=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:18=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 9/16/26 04:33, Kuangyi Chiang wrote:
> > Hi,
> >
> > Thanks for the review.
> >
> > Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=88=
14=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:09=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >>
> >> On Mon, 14 Sep 2026 09:30:33 +0800, Kuangyi Chiang wrote:
> >>> Control transfers to the HIK 1080P Camera (2bdf:0280) can time out wh=
en
> >>> the device is connected through an Etron xHCI host:
> >>>
> >>> [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf=
:0280)
> >>> [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp.=
 26).
> >>> [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -1=
10 (exp. 26).
> >>> [   58.592967] uvcvideo: Failed to initialize the device (-5).
> >>>
> >>> Testing shows that at least 125 us between control transfers is requi=
red
> >>> to avoid the timeout. Limit the workaround to the affected Etron host=
 and
> >>> USB device combination to avoid changing control-transfer timing for =
other
> >>> devices.
> >>
> >> Any idea why it happens or why the delay helps?
> >
> > We don't know the root cause yet, but we did some more testing.
> >
> > We tested delays of 50us, 125us, and 200us. The issue was still
> > reproducible with 50us, while 125us and 200us passed our test.
> >
> > Our pass criterion is 30 successful plug/unplug cycles on each port.
> > So 125us is the minimum delay we tested that consistently works.
> >
>
> Are there issues with the control transfers already during enumeration
> of the device, when reading descriptors etc, or are these issues only
> visible after uvc driver is controlling the device?
>
>
> > We also tried USB_QUIRK_DELAY_CTRL_MSG, but its 200ms delay is too
> > long and causes UVC initialization to fail.
> >
>
> Does it help if you as a hack set udev->quirks |=3D USB_QUIRK_DELAY_CTRL_=
MSG
> _after_ enumeration and uvc initialization?
>
> >> How many other HCs did you test this camera with?
> >
> > The camera works with the EHCI host we tested without any delay.
> > We can also reproduce a similar issue with an ASMedia ASM1142 xHCI
> > host (1b21:1242). This patch, however, is limited to the Etron/HIK
> > combination.
>
> I think we should avoid usb device specific quirks in the xhci driver,
> especially now that we know it's not really tied to a specific xHC vendor=
.
>
> If this is only an issue with the control transfers sent by uvc driver
> then I think this device specific quirk should be in there.
>

Thanks for the suggestions.

We'll do some more testing based on your suggestions, including
enabling USB_QUIRK_DELAY_CTRL_MSG after UVC initialization.

We'll report back once we have the results.

Thanks,
Kuangyi
