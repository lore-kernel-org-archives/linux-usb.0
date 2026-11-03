Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793667720;
	b=sJPDALBiXPY298o6gRYPwVbFapm/1D3JQTsllEZMhu4OW/chhQ1lzvzIUImMMiUgcbQp
	 +aI0r6PGjwAtm5rL7hQAE79oI4fdBCp4jB+QyxLqpxZnRsto8BeD0dAiULpMgoYKSY0en
	 0Ljxkrf6DEwiV5SQswhAD86vbRH+vhz9rSK+b8xglC96DQ35YBFWd5dhM+StvMm/V5JLv
	 9XNqOVEw3DHbIXZbkptQ2P5SUIq5IKYrhQJuQSjGWlitTIH04udTPrqEdU5uCfdBDkgQT
	 9cnXmHNwAHs8tNOkfvRpFmqiSlkFsQpeNSqH/SVgSzV9O0H9ESXloz9rxJUg8F55C1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j1x1ruSwiF5lANv4OCFfUqhUuuyFdIXIOI8sj0wwYcQ=;
	b=k68gx3HxTyp2XnZ3aE83F40BlcRtpVarPtiYaB7Et4u+2IZDvGJJiP2vYwE7qkBcKjg1
	 hRklSH4qP3IDXQUgfbzP70wGE02CG1lC+WhRw4NhJaYWr7ijgq+03KrlxLPjO77GIzVfL
	 9N2L5J+zGle8I4xEj74WW76JtR9jeZQEAOhnboSU3zKjTF6w3xuBXMumr/QjZpDZOFMpY
	 wt4FedZMJHQokAE+cTqHdtuCKwiy6RbstMeEo/qPrOLACraEFpZ+RTOBT1L9N8AcYPdKg
	 77fri6Vvm5yPCDjaE0DAbXn4mpBUplB63LorYLV+yn9Ng+dEyiPRM9EOh8a/7D9urJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2ghYiae;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA68606A326
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 01:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA68606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2ghYiae
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6deb848ddd7so2782890eaf.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 17:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793667718; cv=none;
        d=google.com; s=arc-20260327;
        b=rz1Io03UJs9AvZJKzu/cDAwypL6oxyKOG/Cc1YPabX/kVmUC9EjpGqhagixMRUnvrZ
         QrZ3aFUZ262vPLKsgYW2aC9+JXVUb9JsdK1FpPUrXHOKFt8GYLiwgNy4f7U/SJX9FJIa
         uFnNnPoozVwFq5H+6SeKq/fnBHu2jSyba8cXY7exY7Pu1jXB7/ycP9x/mJBZvk5sebOt
         kPhddUtBTbnk8tKKUu3D+KMwQbz8kATG/01Z9SbzK2dHIxADKZ3YilsTJ7oY02AYqtOR
         ytsMYR3tK5d7CJz2zTNVHnAXH0sz7cGxy6RJVw0EA1V+l1KCYKXBEl2TEsPucIJ1SQwV
         AKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j1x1ruSwiF5lANv4OCFfUqhUuuyFdIXIOI8sj0wwYcQ=;
        fh=718c2b173ncGKp4+MCUv4PmHLRDVUKhsuSE8Yj4wlNM=;
        b=hL6WoA9gLMbZSCSJNNGKl9tEizuqOPVxRTcRxaY3tTaTiGZe4tRypdWdaKtKLyRAF5
         ymZPutYrm4kp/kAWRzXJKZvORKMfAwzi2DG/dScghyc0ZXR7Mu1PVmHdwrgUY+rU6nTd
         uvqkXXfjeLxiNrZHF2wGS/zHzAR4r/bV85fdi5IFZNPkWn/BLE0hrmjWkre25IVSnXN6
         p73Bsvk56JZQRVwDtxteA1p5MUhH/YKuceEgPaPg3K6bvhCigCOzWTgST1Se7tM2WTnx
         S8hl9K0caEa9q80ZmWppxUfKfXVnRI4pQe8guDShooyUZDPBDlBaDRzyCQG6N7yz0BSx
         sHkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793667718; x=1794272518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1x1ruSwiF5lANv4OCFfUqhUuuyFdIXIOI8sj0wwYcQ=;
        b=m2ghYiaeZZaMOOXGFGLv8cJAz95xd/jtLWKvKhmp2NzuLKy5GXqlZiwZFTzgFUsjGp
         cA9cEL4wDE1OMvrJwm2JdLXkNPPUBSYhAgrWyRg73Ruzulxh76JaiIyhm1cYMGMhPDe1
         cw0IYK8oHfqqTmBCPnovVamse3KgVZAk8iT10Rt2sskYg2I2A4fggC0h15/w3f2W8BAr
         XB1YEG5GIfTC8QXKMDC5OSV77LQrJdpCrdyxpNkA2uuV3cLFmx5vTmaig83pYiPD38W9
         QXhUqA0OcoTgv+1hVmqco9pP+mjP3EPgrDxsIzuqcLgALyuAvgXozZAqHx0r0feykh6l
         wtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667718; x=1794272518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1x1ruSwiF5lANv4OCFfUqhUuuyFdIXIOI8sj0wwYcQ=;
        b=GdBxljV74hhkdHOWQtV4A3czk5VWI/o9jnbcljStgu23pk1c5OE0CnJdfJ3xPmgLaW
         6g6/Wy67T5TM3mlt7kOUbVaZu11Am4/VcS/buqrEsdG0BMppk68w5CKg0xJ6en7phLbF
         EBBrrTrhdqIorHNEHjEtkh5JOwTaMFVgIYKVLcRw87nhuMnphZ0Jt5OTG94yqv2FEALB
         JSb50MOjIM2nKa6kcc/Rh4Sm37kv1r2owKH5mXdyNw1CDJYbClFbDorrynSrZClG9FOl
         dI2isNz2WmFDUEocxBY9oQlkyWdbzVGSu8MI4R2Hpj/YOP15T18isb79BNSsB6yfJC7I
         ivug==
X-Forwarded-Encrypted: i=1; AKwUvBxBMVizTrogA7xfKIKk2PS991elkOtFglcXLq3noJIbjFOR9jgRsvTHlB9y0cswUewJdJqa0Xa7N3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc1Hbq+xAliUfHnrq80pPPa305Q6dwd8Zig39r8NJXuuZAz61D
	9QAlLeSyOtCUVJn9AC1rqOT0GdvOf4TuWgrqntAilKqn3eOaTLbJoNUXZP2Do9Rqo3ErNHjFsd8
	Lb4weeUHy1Elx80ovx02cjW/FhlhqcmA=
X-Gm-Gg: AYBFou3wld6PxE7+qFgZxOYDA2afN/5Ubgzcyxgbr8bxDohCQ1Z805iexugesHaTuBf
	nrHbP1BZVBB5xjm9y4TnEAExabb7VWapLeunxvC0E+xTLDsOSRMGQsz0d8DN3b2bnVNB9NxQ0Wo
	D9SoDC/GC9CBUmdQn0THKAmEOgtq99caMuFUVE4I6e+TyqdlMh09PFOorSoQ8j3C6NLchs6KlCl
	1pFzcZQGNRLwHeDmbaRntIt0SfyFouPokI1F+m3SLTJkX/W6Fm0fjS2+qTVpvNRcQtuAZyLqQ0o
	Tq1+IGOmw9kOfTMO5dOQkd05mVX79leAlAte/AajeG5QHz7oPUumFqt6F3OafuofjT+06qfoAan
	YaaAqgzx6PKtODFCaa9XwAz1lsVmdoPxTBmXk3h8=
X-Received: by 2002:a05:6820:7097:20b0:6b7:83c5:fde8 with SMTP id
 006d021491bc7-714f240aab7mr4196354eaf.41.1793667718501; Mon, 02 Nov 2026
 17:01:58 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
 <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com> <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
 <CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com> <20261029060335.3ed1fbcf.michal.pecio@gmail.com>
In-Reply-To: <20261029060335.3ed1fbcf.michal.pecio@gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Tue, 3 Nov 2026 09:01:50 +0800
X-Gm-Features: AclHuK9ObPtg70y5AAcvbpqJBQRzPYrnt5a9FzX5tZ2SdVerRcvdG5dD7M2HEZI
Message-ID: <CAHN5xi3NY2AUQK2=M80RYkx1N-bA8=zPEE6Y5400EYyMv1=aCg@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your feedback.

Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=8829=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:03=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, 29 Oct 2026 10:25:17 +0800, Kuangyi Chiang wrote:
> > We did some more testing.
> >
> > We don't see this issue during device enumeration.
> >
> > We also found that the timeout is not limited to UVC control
> > transfers. In one failure case, the first timeout was observed in
> > a UAC control transfer, followed by UVC control transfer timeouts:
> >
> > [  961.127402] usb 2-3: 5:2: failed to get current value for ch 0 (-110=
)
> > [  971.367443] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
> > 2 on unit 2: -110 (exp. 2).
> > [  976.487473] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
> > 3 on unit 2: -110 (exp. 2).
>
> But that's the same device and the same control pipe, right?

Yes, that's correct. Both UAC and UVC share EP0.

>
> So it just failed and we don't know why or whether it was the host or
> the device. And this is all during UVC/UAC probe, before any userspace
> begins using the device? Or could userspace be involved?

We launch a camera application during testing, so userspace
could be involved.

>
> The UVC driver has some aggressive PM; for every userspace ioctl, it
> calls usb_autopm_get_interface(), submits an interrupt URB which almost
> never completes and unlinks the URB before usb_autopm_put_interface().
> Repeated periodic unlinks is a known problem case for many xHCI chips.
>
> FYI, I found that 7c0c31c66a7f9 in v7.3 reduced occurrences of periodic
> unlink failures on other junk HW like ASMedia and VIA. Some of those
> failures, on ASMedia, resulted in control transfer breakage too.
>
> Have you tried 7.3 yet?

Not yet. Our tests were based on kernel 7.2.4.
Thanks for pointing out commit 7c0c31c66a7f9.

> Do you see any interrupt URBs there, using usbmon for example?

We haven't checked interrupt URBs with usbmon yet.

However, we captured USB traces using a protocol analyzer and
observed different behavior between the failing and successful
cases.

In the failing case, the device ACKed the DATA stage but kept
NAKing the STATUS stage until the transfer timed out.

In the successful case, the device initially NAKed the DATA stage,
then ACKed it, and the STATUS stage completed successfully.

We haven't determined the root cause yet.

In our tests, adding a 1 ms delay to both the UAC and UVC
control request paths prevented the timeouts.

When the delay was added to only one driver, we still observed
control transfer timeouts (-110) in the other driver.

>
> > So far, we have reproduced the issue with these xHCI hosts:
> >
> > ASMedia ASM1142 (1b21:1242)
> > Etron EJ168 (1b6f:7023)
> > Etron EJ188 (1b6f:7052)
> > Intel xHCI (8086:8d31)
>
> I don't know that Intel chip, but the others are quite buggy.
>
> Have you tried other HCs? Any successes?
> IME, chips from NEC, Fresco, Renesas are more reliable.

In our recent tests without the delay patches, we did not
observe any timeouts on the following HCs:

AMD EHCI (1002:4396)
AMD xHCI (1022:149c)
ASMedia ASM1042A (1b21:1142)
NEC xHCI (1033:0194)

Regards,
Kuangyi

>
> > The camera works with the EHCI host we tested without any additional
> > delay.
>
> That's a little suspicious, it may still be an xHCI bug.
>
> Regards,
> Michal
