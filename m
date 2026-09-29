Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F09B34DCC7
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679490; cv=pass; b=MNW4nm6Gh7ShVa7Dmw6B2j/5fkUUteT/wvNMFAf3yPFVg6LQ8KHXrODowqZ95dOMPJ7MfIaoSjkEGOiAhV2qcV1JMJUXY8jD+ymJtkoLJMtGLESaOt+dR8zJ11Rdnxnn111NsWK4XaNKizWUFAig5JOtQQ5+49aN9FA5iBG4NQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679490; c=relaxed/simple;
	bh=r0iDdiaq+ZyYSfXbDb7+z6i7X/8eMmWTcFQEHtOWypE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/9lxTtCA4gp6crMQH9ccpVpdjdZ/nGeXp76ggbmpzwJyRvCNbx+09UfbOlq2DED4fDOlhYKaTdubr4VMj9ekCHQZrgg14FhPjdrpBQ5DLF9M4pMIBxz0v141CQM+y7LhxNfK44exedjWZUIUEM1i8RczkG3/pdTgtcJHssDnC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fvM4YFwZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQBjEiIG; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvM4YFwZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQBjEiIG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj44m330829
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 10:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTu5GuGQkO3QNfFTOWgaKMH1xO659EwhYW2I+BxJgks=; b=fvM4YFwZdYvO/Nns
	3XCqK37QDI3P5E71YPnc/3nTKyPMr9Iy0kTCEzAWxeopvGT78mhmTb2LJvlPVIm2
	f+gBExaJu6bRNnc6VBfGtWEG4Ya+yQ5itf5FJhXLtnDevy7SlILJSmEZI23/BncS
	64TsAc3I9bAaNRSnrmeX9B9+LUcPgOGMr+kOxYrGX6Ljdc0MaGkta0LzdJY+RbF8
	bq9vHtSmHHiykBw4sPHk02KO3n9bYycc+Ajhg7vRhfnkOygph3H5x2xHix+pCEpX
	xhQnzCf8SjwWpERxX9zjPFHh0rXOyWRK5Gw2zhSEyrg0K+7R/TkUertRoZeDY33J
	CzhAnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4tn3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 10:58:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso1725160a91.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 03:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790679483; cv=none;
        d=google.com; s=arc-20260327;
        b=XHDbEIH7e/WVitUTVbrLq+/9IaxEIZLkUBOQF5mIqD5SFR0NF7f0nDgWeQs51dqdq3
         NXUxnUbQD22xdWKk2qavtlm/XdaDP+wFpmwmdY/E6x/1S1yQfi0gzQde9kWKC22RpFMr
         B4Nj/UGPl2A/aDPyuYDwArj+SRgOVD8oE7cKO/BGbpnUhhqCecSWIubfJd+ebfQecIvc
         1mGdWiJpMNP6D7VnUI3/kT+KH7RrxMVY+JlE8rI0clqGaOJXcjyQIH66dxPmIq+cJKYl
         SlVCYtxnRlU930b3EMb2nsPYYaOfvKTb3CbggJ5uHdgE2ueTD9IhloHWk6FH1UpLrwhB
         O0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTu5GuGQkO3QNfFTOWgaKMH1xO659EwhYW2I+BxJgks=;
        fh=D5XQxu2I9SzUDfOf4bsMpN98fNVT90JE+DSd/tbTCdI=;
        b=azWL/qJ4dFG++GSOkHqSYQJDkhTg8d3mnMwjvVuH/TySN7YRICHpxucdIbRYLgMrjy
         JKA30RDVKyd3QRePK3bOadymDeSjMkEngRIqNjI3YkETKEFHtTi5CVsDc7votnkLz6bf
         2XO+fgZrSzR9GWfEDWpMunU7Ms/j1IlmV7Z/J66d4JRXJLXgxLJkOEbiIkpofCJAVjye
         aDXZuRRwKRS12TNlKUN1MCj9xRg0Ie0It+dX6VrzOPARBD2c9jxdS/bmwmHUZmTcG3Uh
         Lw/gbRvELu7zFYWLW6GN5rshiP5EXOr3Hc1fwQLCkz0m9zlRkSCH5bPJA/DFtTsZp1n5
         QGLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790679483; x=1791284283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTu5GuGQkO3QNfFTOWgaKMH1xO659EwhYW2I+BxJgks=;
        b=eQBjEiIGW86ux9EvP4LB3VrFGqJ7942QvCTNQuKgSecBjdp0PdWgSO302ZPdhxWvpv
         cQlcsEw55WfZJgBGLyv0zUhVEx9R4xQJysJJSwkx+ySkiE0B7G/3dpYF8ZEsjKSK54l5
         yCZAeHMeRW5v8ZhEvZRVvL2y8fC4RTgXGmsPzu48bqDKM4Mx1GK8uJmwLaFMpUMVz7O7
         OxQ0YQCZMZuHtKuTdAkXxI3XIQkis5QrnUKOJ/ztIXpeukL9us+2l1DGzoYfHADaQx8X
         HdNCBp/+ztXCrBxepebuVsKyRRdEnOlclIRIE+h4apGNIig95mi6ErqAXYcOhOQVg7es
         azqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679483; x=1791284283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTu5GuGQkO3QNfFTOWgaKMH1xO659EwhYW2I+BxJgks=;
        b=uti9kOHvjF/zslwBVHc8Ly277uosM32W0LQccBYEWu0Rq4RlNCmdAsjSLkiZIRKz6z
         u/ES0aVlRfiovFINMJ9bsUgudPQX7cohNO+AegPMNCUQcVeJh+BUcK9i+aaT3JGiXigq
         X8AsYo9lHNXWCUu61pRjTPndN5zciQH+8IEIUsNvpsf3CK5dbnuULuFv5rPLYwEe0bcp
         UiNWWKpbB100JBJKCtFkekAU/59CVCzEhnVUu0dt7l/aQcDWpE/oaBj7NdRee3MrybRF
         9m6aNh4Fne07quZdvN5ld+vZYdc5maNR3/G+42/gkdFiVkTkEHuViPKbTlNWCReSFZZs
         s9Pg==
X-Forwarded-Encrypted: i=1; AKwUvBz4muNmEl8QFyz3/G8EoZcrFnnnb9E1wCQylXW9dVLLpd6AfFn/qSdmv01QYsfb+ZUlw/jhzfDYexI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmT1kezjD8+zTAwv4k9qSr5GyW5PkfC3i/NdwwnoNIHPU5gjs3
	aQXvhzn/EFrKbyIVzcwbAcDkbBWIsT2ettIjnxR5y/xpQ5iqkj4iTVYUeKRK3z+9uIwDaB5jvtd
	DYA6y8n3zzgodMdhBNNnzByWoBRVrw4uOlEnEEixUhlTTRQwdj2fUXDqdFD2ubkDES7tVk+N+85
	bHaoomo99HvB55+OLml88uO3PKpHcmDmQ+CpQynQ==
X-Gm-Gg: AYBFou3+/yGJlHmBqrEBKp5owxYIb4FQCclv/jmspNVFjQm2Ljd/HbSo+c629B4f9tV
	VuwQ2DyssUVN5H0GWpqffAs3ZQnjo0jpJnapUOWnWSdQ+LOkLeVOcq7LSNNH3MobEiRdw+cVUYU
	el7vc4nsSsGiGQtzbeI4rxjZg7DWuyxnTG00RDrHxkKspuoAt+Lgu5DVOKxg==
X-Received: by 2002:a17:90b:3842:b0:3a0:aed7:7b39 with SMTP id 98e67ed59e1d1-3a0aed81503mr12381410a91.24.1790679483412;
        Tue, 29 Sep 2026 03:58:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3842:b0:3a0:aed7:7b39 with SMTP id
 98e67ed59e1d1-3a0aed81503mr12381383a91.24.1790679482906; Tue, 29 Sep 2026
 03:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919100408.113979-1-ngocthang2710.1999@gmail.com> <CAPx+jO-JBBLNCUrnB0UaMSPu7ajwsrEQMPJ1SfH2PccCR5VnCA@mail.gmail.com>
In-Reply-To: <CAPx+jO-JBBLNCUrnB0UaMSPu7ajwsrEQMPJ1SfH2PccCR5VnCA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:57:50 +0200
X-Gm-Features: AclHuK82roEHJrweTwio7mtf04vdHQh9G4MQuD-caqh9KRrj_nsX38Q0GfQxQhA
Message-ID: <CAPx+jO9iva6YnKba8aEuOHURiZKjh2+wvhfC97bZ22UjGsXgNw@mail.gmail.com>
Subject: Re: [PATCH] memstick: core: reclaim the request before freeing a
 timed-out card
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfXx/Ytlfro/oLL
 tIyMYZa6WIFG6gtxxKNOjYVgmWCX4v/YyX9BR7BvojTYJTWzNX4s8bcfe2URwU7VrOccHXjHK6S
 xkWjQtYJN8mwG+rXue6k6riFHODfSak=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb99bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=edf1wS77AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=hSkVLCK3AAAA:8 a=Zq5GaAOXB1qV3tOyoOkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfX70/Xb0+U6zGS
 7QOkyWWk0Ijd8kTnxs+odTBo653RwmbilaOORjwbypMErKGP1oc7e9RyNZ+wQA8lWn+By5nv2HP
 twb1o6xXMRC8gVv+/1SsxkSYYEIvdPNUHUQ+IMlhFBahd8kvBvWkgR8x29GG5njOllwytTgjqIz
 TEbk68xTuZji0PIzhHHDfDnEfys2SvRE/N4UKaGph1MF8CvSLpWbSj1qol/0Nzkz1pUgCp9nj5A
 DOXcbEG8H+slpj5wVFYsYW91f0QBrAXygrXSAX2tMidhxvdRJ20R0qrkmvusKHhvdaaj2bMXpKT
 /MPN9S19c+KTmbizYexVAzk8dAfuclNRHWQzyslKhysRs0uBnxMndwC15UR1zjUknNe9xGo3DNF
 SEGugPh9h1kq90Fasc8e9j79ijraxREWVOT3H2GHqTLp8DrA97NRPprS4QlCMRNEEI9ii8vbJwf
 zWm8HAOMG6GUDNH0trg==
X-Proofpoint-GUID: tN_w9lwBH2MxZGqFtRx7OYlqx1kXg3eH
X-Proofpoint-ORIG-GUID: tN_w9lwBH2MxZGqFtRx7OYlqx1kXg3eH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290043

On Tue, Sep 29, 2026 at 12:24=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Sat, Sep 19, 2026 at 12:06=E2=80=AFPM Nguyen Ngoc Thang
> <ngocthang2710.1999@gmail.com> wrote:
> >
> > memstick_alloc_card() hands card->current_mrq to the host and waits 500=
 ms
> > for it. If the host is still busy, the wait times out, the card is free=
d,
> > but the host keeps its pointer to the freed request.
> >
> > rtsx_usb_ms hits this easily: its handle_req work can block in USB
> > transfers for seconds. When it returns, it reads and writes the freed
> > request, including the retry path in memstick_next_req():
> >
> >   BUG: KASAN: slab-use-after-free in rtsx_usb_ms_handle_req+0x17ff/0x1a=
00
> >   Read of size 1 by task kworker/1:3
> >   Workqueue: events rtsx_usb_ms_handle_req
> >   Allocated by task 1656:
> >    memstick_alloc_card
> >    memstick_check
> >   Freed by task 1656:
> >    memstick_alloc_card
> >    memstick_check
> >
> > Add an optional host->cancel() hook that stops the host from using the
> > current request, and call it from a common wait helper on timeout, befo=
re
> > the request's owner can go away. rtsx_usb_ms implements it by draining =
its
> > work item. The helper also covers memstick_set_rw_addr() and both waits=
 in
> > memstick_alloc_card().
> >
> > Reported-by: syzbot+3ee5da0319ca17ef1f4e@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D3ee5da0319ca17ef1f4e
> > Fixes: 99451dceeb5f ("memstick: Add realtek USB memstick host driver")
> > Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> > ---
> > Testing: no hardware. A raw-gadget emulation of an RTS5129 (0bda:0129) =
on
> > dummy_hcd delays every bulk-IN reply by 550 ms (above the core's 500 ms=
 wait,
> > below the driver's 600 ms USB timeout). On a KASAN kernel the unpatched=
 tree
> > reproduces the report (same offset and alloc/free stacks); the patched =
tree
> > takes the timeout+cancel path (~0.6 s) with no KASAN.
> >
> > I first considered a second unbounded wait_for_completion() instead of =
a hook,
> > but rtsx_usb_ms_request() skips scheduling once host->eject is set and
> > memstick_remove_host() flushes the workqueue, so that can deadlock.
> >
> > Known limit: cancel waits for the worker's remaining retries (a few sec=
onds
> > with a device that never answers) while memstick_check() holds host->lo=
ck.
> > Other hosts leave ->cancel NULL, so their behaviour is unchanged.
> >
> >  drivers/memstick/core/memstick.c    | 22 ++++++++++++++++------
> >  drivers/memstick/host/rtsx_usb_ms.c |  8 ++++++++
> >  include/linux/memstick.h            |  2 ++
> >  3 files changed, 26 insertions(+), 6 deletions(-)
>
> May I suggest that you split this into separate patches. For the core
> and for the rtsx_usb driver. Other than that, this seems reasonable to
> me.
>
> In fact, we should probably have something similar for mmc, as
> currently it's the mmc host driver responsibility to manage this
> timeout itself.

Reviewing another patch [1] for the same issue, indicates the memstick
host drivers are already managing the timeout themselves. So, even if
your approach seems reasonable, I decided to go with the other
solution for now.

[...]

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20260924204142.607-1-rajojha047@gmail.com/
