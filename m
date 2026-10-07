Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DCD4B44DB
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388492; cv=pass; b=mQ4rtoO0YN5I4WI/+vxmtlxuwF0kwbpRQrNeOuOwO26owBdFZo2OXH/6qkaSFwjM9sqewbqHa8VxPUWw/KevRGHi1njHEacS9+VOOxspjkTvts/zyLQHa5QQQAQJEA0Hs30hzbs2BHGyt3HcK22nss1T0pClvh43aRBhzh1VjcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388492; c=relaxed/simple;
	bh=pwJa8BaFaUlr/o3p+oE/Sl8mnLDMJHG38kHTjzu4gVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djd7Nsh2MMGRzIBUgJbioiFqh3EXlETehSstnDB7T4Ai+i77V0HUqnJRa3L6ZbNWObwLzTc2GS9ijxad+Cqdo7RCGeWuCfxcrQsNEMC0pKLPk96bHTD1qr4njkhnzxX4oJhZPmS4N8IdwYhDyg3rMvvDOja1ztKX9ZcJauYeUOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pklZAV+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbgri3oO; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pklZAV+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbgri3oO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtX0v2809189
	for <linux-usb@vger.kernel.org>; Wed, 7 Oct 2026 15:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=; b=pk
	lZAV+eC/gcSTolOMNnBZPjxvRmtcGRUSGVmNasznAiJhX6oInpKlXD1fMtOlvzDm
	pbjnlVgWTH/8MVvpk2Awu8dUejQFLHhHl3T1KbylyysniMO9IMnrq1dYrlkOzeaA
	Aaq4cip4T7hjTIYqyOMUA2tBkNX/nbR7VtM9P4Ejb6ADG5Gp+ljLK1r2qfHB96g/
	VBWp6MFqGHUuf63KJkxeiGryQWkok7o0XZgPo8EEdla3laHofYP2HC/rEUUZsKc1
	PE1TBsPCAqzVdzkrTE0rYZUvcCa6WDezLY8zIcekxyeAZGiqpSEK/UvbsnDgubZ6
	N4jcJXtvoRZKq4a7at3Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8t6k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 15:54:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6117983eec.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 08:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791388489; cv=none;
        d=google.com; s=arc-20260327;
        b=PNUjLQtk+BVhT3KPrnPxuekVn8dgg6kGt7w0mVZUuhxs1+N9yJuw1jYQVdiKFPWhW2
         0f6e+K/j7fJKD33vEDH2UbZ0fdE2M1n1i4FJfF/GqjaN6jrEUH1Droo6sOMDaEzHA02b
         f4F/If34vZYs+h0S15ALKh2wmRDB/RJ1geLqsHmLdYwuCVFnqIJ/DVoQS4lu3NygDUxX
         AYUZ3q0044lRcnfUv8uQEG/fmG7gGabrKy0hl6DdV7kMg7j2DxD8/4z3HfFWx46TY3Z8
         hlhaGRhT8mdHWnUNkuQ8pSZhHYyWnJTVwQgVEqh8CiXbt0OMD7r5TsLD7omZ08Wl9Jj6
         KaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        fh=V8GR2Gs73tF321ebNeQCFnqtbNZehun4AbLIs1dDPAM=;
        b=klw16a0xS5lJ85HQZs/PfS73Mfl578kqg99RmXqBXXyz71f1zdZvJeq4iucmMxgxwV
         SXeBmwgITPMQOdHaVBGfvRhnu5qmqYAxMBYPI5QsiE2hHt1dk9HDCXIg97BJ1wewVIMa
         /2QS3WR/iT7y5El+rHJO2oixvHuUVtMsPmjfyGn9BCIzYoQTGB4jVqZwVMsmUGUyvMwp
         VayuFM4+tvs0KlrdFPfnvDlmYgKKR1nKtTZM/RzF1Bxm4h5zofQneE/vnozN49uu24tx
         5cssZu25ABbCMgGrQsb4ITfouaK21na3z9SgYrJg9U29bDeT9dWYFiEAD+KlReZ0sAVq
         qzVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791388489; x=1791993289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        b=jbgri3oO/4UaExQgXcbVabk8bnsLeA0GT7TvTWBLPOtxsQjglp/GYRw41hdcWr4z0F
         RuUQbewkOcm+TmXVZt5+7D+2eTDOwzyVbf4x6VAqNz0GWNA1taB1jwin0tJCDGx2JT8G
         nveV1K8FF96wrmgTXNevZzYENNaVrHGdxKHKlTYSVJtEzP9S8kCX8bolXi/DCjPz+Yf8
         RqQl1bBxhfETb1hBxeXKDyJzZ6GzL9OeX0RT7/C/jcOIqS/wEjycFMoQab9Gg2UhFSTA
         oiwJIz51E+fRzGRJpXQrFYmTYQ/WbyEiPWFUrajmLUSFBYjCwxhAYQ/vwwqNVxf1GFN6
         mdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388489; x=1791993289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        b=IPak/9WFkmSNzO9VxQ1rKdnPjYBuSLoxFvgr7KGihYFvTL8qjIDcYDwYLiNlxP+gjJ
         SzHhTAxfZa8OwcpRbtRBh3qRRMoGg97EKCcHiSOdHGoUESEMjsf3NIuIktYRMXtwepDc
         0kzFeSblZ5LE3qld5MJd9De2wP+CRpZ5xdUU+I7MqB1ww3LVpUJAplFK86h2P7p1SkXv
         P8+/I84wEl8fz2Ycd6q7gRbb4ITYBNclbMZ/+Z3kQIvPKLlWJ90VFiYpMJNdmm87+xzj
         0nTe+TnHKOGYe54PONOpqRvSh38IZFCnS8DdC71JKDIiML9UJF9+LU37x/HGzgqAn2Vn
         SgYw==
X-Forwarded-Encrypted: i=1; AKwUvByG+ijM/SyoYrrXuVdiTEoc3BMrVzzWa+vazj9ac5TB9vF6LZVhpFtXatw1OiN5ssOcM1cdCAKGXEA=@vger.kernel.org
X-Gm-Message-State: AFuF++kC97StZJtUn55TLrJzxR7vLT2Kk06BawmrsL3wTODkmIxK6sOW
	QpaaTjKHh9vm5Hb01eLe1ylqZ2+7qZeKiqSNXnoMp7z9U+2VmoH1RzmeseYOQCQSOUAiEbZYT9F
	5SQUhOazhnqYGqDjkPVCKrOQeKAHxHtWVa61RrDjurTC+1+I/bbuS/eyfTmeCsd0gPupRDSgqmD
	2tMLqs+lTJel2quYAolZNJdGzolNTxw6vKVaBPag==
X-Gm-Gg: AYBFou1aiqHkhKoWKSxcOWwepcX141ahfTiqV+zsX15csiiVIiCXIKH30iVO4ERYp7M
	+IoD2M/4rHRlAJHAGYTrrOHMewWlTLp6sI83JjkoTMiTPHVIJKbOaLIghURS07m77qi5V0TXGWb
	Ut7prKZrotP2mIM1cIr5Pw+jVVuFOOZbWjhUSwDoNG2fjEqwSL6y7Ay4g7
X-Received: by 2002:a05:701b:2806:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-162044bf3f0mr2885592c88.7.1791388488595;
        Wed, 07 Oct 2026 08:54:48 -0700 (PDT)
X-Received: by 2002:a05:701b:2806:b0:14d:c7ae:85dd with SMTP id
 a92af1059eb24-162044bf3f0mr2885557c88.7.1791388488032; Wed, 07 Oct 2026
 08:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com> <20261007131543.7634-1-liujianfeng1994@gmail.com>
In-Reply-To: <20261007131543.7634-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:54:36 -0700
X-Gm-Features: AclHuK9GXc0-XXuEkvshyXJ-4VCucnnUec19JgkYED6meMWxaPoMrc6_lJWUEQc
Message-ID: <CACSVV03imsi930GwjSHwAAb0D7wAAmUpbkPRzQwYThfb+A58kw@mail.gmail.com>
Subject: Re: [RFT 0/5] drm/msm: DMABUF_DEBUG fixes
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: abelvesa@kernel.org, abhinav.kumar@linux.dev, acelan.kao@canonical.com,
        airlied@gmail.com, akuchynski@chromium.org, bleung@chromium.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, jesszhan0024@gmail.com,
        johan@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lumag@kernel.org, marijn.suijten@somainline.org,
        pooja.katiyar@intel.com, sean@poorly.run, simona@ffwll.ch,
        yuanhsinte@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfX5ouEp3NiD/uz
 Sa7mzkX8bJTioA24ShQb6FrygdA4UWssxOM+Ozmtw0CnSjE57P/EiqBKcgcWLzhYgb7a7knxC26
 eqhhKUZgfBu5sMrXClMr4W7M4S5tTCM=
X-Proofpoint-ORIG-GUID: 0bMhMkkRnP-1RvtvcWZ09YbdB3RUm1Lb
X-Proofpoint-GUID: 0bMhMkkRnP-1RvtvcWZ09YbdB3RUm1Lb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfX+qZiVQmKxLhn
 a6OgMI2SPbalA1cW1J0cGZNmGNNTbUlprFZKKPoYskljubqGbl0U0qlueKDp7QdFPE1dmc8bjLs
 dByNVfXnpnQekORC1MPja99BuoIWZV1QgT6cdTePU9J29DYXQptyTm/ONj82lGQAHWF5MuvQeG/
 H3tuQcALZjsOts3n0RfvsGXidrs3yaScBTPIVASVwnXDX1ZNCkhksoy7+8FjU/UiH67U2wC69vY
 HEovrJt1WpY777EtRnAs6bpyxq3W65teMvWuRtmbTiAckYJOeOnBF2r2iKPg1XoxIFBGTcceHTK
 4oynhLOgImdTiVf9mz/iZrcDBx6krQMSmG0QrRVp9dFikvpH1mPJYb/gwwXCY5ALeLx1kdjoDLW
 I3iqUxy0ExEBtrlWnXLlKZf/mLaEVOURYhWrpV9WXXMeRAT4jFBM8nFiHHXRLUAYDq/lZryhO5x
 Q0YPhZE4rjqcuttJ82A==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac66b49 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=dfe0JtAcDOuVnXIYvJMA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070063

On Wed, Oct 7, 2026 at 6:16=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gmail.=
com> wrote:
>
> Hi Rob,
>
> On Tue, Oct 6, 2026 at 6:09 AM Rob Clark wrote:
> > With DMABUF_DEBUG=3Dy, the page information is stripped from the sgt th=
at
> > we get for an externally allocated buffer that is dma-buf imported (as
> > opposed to an exported GEM buffer that is re-imported). [...]
>
> Tested on the machine that originally reported the breakage - this
> exercises exactly the externally-allocated-buffer case from your cover
> letter:
>
> Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer
>   SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=3Dy
>
> Hardware video decode in chromium (V4L2 decoder capture buffers from
> videobuf2-dma-contig imported into msm and rendered by the GPU)
> displays correctly, with zero arm-smmu faults and zero io-pgtable
> WARNs.  For comparison, on plain v7.3-rc5 with DMABUF_DEBUG=3Dy the
> same workload logs UCHE translation faults and a __arm_lpae_unmap()
> WARN storm (~470 traces per minute of playback).
>
> This is also much cleaner than the translation-based approach in the
> follow-up series I withdrew - mapping from the DMA addresses is where
> I should have ended up in the first place.
>
> One small suggestion for __do_map(): panthor treats "map_pages()
> mapped nothing" as an error (panthor_mmu.c):
>
>         /* If nothing was mapped, consider it an ENOMEM. */
>         if (!ret && !mapped)
>                 ret =3D -ENOMEM;

Yeah, that is probably a good idea.

Thanks for testing

BR,
-R

>
> With the DMA fields now populated on both paths this should not
> trigger in practice, but it would turn any future regression back
> into a loud failure instead of a silent empty mapping - which is
> the failure mode this whole series fixes.
>
> Happy to run more (heap-exported dmabuf import test, kmssink scanout
> of V4L2 frames) on any revision.
>
> BR,
> Jianfeng
