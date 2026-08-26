Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F1C3BED56
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739962; cv=none; b=ppgvbzr7/K6/vT48hyCi0zniThBo2+8wwp0iv67cBLXtK5POcA0++CXpG5Uw1CikORNS1u7Y0RRj19gwnaOcDvXVaiFHWOMvWKPt1aFKA38XtEGioe9LU/qHelNaUWBUWDK9/AxekMwNNJmOsKTt6wuRN8KXSvQHAmASJMOaVe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739962; c=relaxed/simple;
	bh=wEDTJJ7W8kiwxLRX1+enWo0Pl+M9+VeM0mUaKzfEPJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+D9VQ3AqGKDyLYxrhuOy6RH689M6yM7rNQqRsmasCsxC+UgVFy80b5t8jxJzl8E3CxTGFryYgQXy1V5xkYWfa0o3Na5bkRfC5Hy/98A+sQ1fN4e2jicqrBvY6jet9wp5enI7MflTXN8LNDLkj48BZqO943uR/U7dVTX9hf6vFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9AyZFMT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9AyZFMT"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so92036566b.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787739958; x=1788344758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ZF4eI1OEh2v4DHesaWp67R2xMPuMRHeqkB4bC7uF/4=;
        b=L9AyZFMTPLVgsgN/QDMGCIjX76X9TyCv31wnNPTuF0SyjUO639QZDm+CiBFbYGFOZV
         mF7TmrWSh6Ryg554P/HOfzY76N8xLe2GXafJcXvApNBMHQHU5PLU5xTpgT5AeMf6Z4Oh
         Ch3pjhHOJ5GdOgpw+lA56jwB67U6uwxTrmfYPKVsee6odPrH2SCyaZMfUfAUVR7HmMnX
         Ucc7wAf6sGaUNlukYHxHbfKahV8GCD6+87pOCh/12Jdkfka6jKYyGnyS1Id5u6Uzs4A6
         bKr8yNLi4HOTAfD2vqYZh04SW8VCEZhI9OgQddtPqqPXuXszXVLWl53pOiJhLwPlsI2Q
         NAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739958; x=1788344758;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZF4eI1OEh2v4DHesaWp67R2xMPuMRHeqkB4bC7uF/4=;
        b=ZtfOlpRFTAW4YQC01aKWEiC3CaKWfxaec/DOsJ1xjxcOaBqu4bctc+EVK2tEpHJ55Z
         0+eDk4BXvLP6rU65JMaLuxzaj2SObLroDxHlp65wSFM2l0cJwL8AarrsTDDyWZILbAiH
         z66ohjlNY0O+47bpIa9DBwHbg4MePBRcGSSSEDYJgb4x9VL1BQ26wuxbs1Sv6hwtCznW
         lMbFbhPm4E422V6xPBz0yfV8yI1y0sTQEqydFn7K28db+cnjVdq1xyK33l5PA3/LKf3F
         bAV5CTrbfpTCVFVRrXyaAxRC/NYMrPwfvHqR7bmldXmkty/YgUuR/1SO4vS/sssmj9aV
         PW3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpEKkcJGhG2uXgah3wd2NPNUCI8CV+vhoE2epS8mJUktlatiF6yr9gUfK82v6/ysbL7Davf2scSeuk=@vger.kernel.org
X-Gm-Message-State: AFuF++kNF7M9CLae0XLiB5kECZAT7B5qubjTmr6xM8XvWveFzgzbVq8z
	madZUu+gPUwFk57itpdnR9opI4HRyio8WvP8A5FV/G/IMYVQbZmxMO4x
X-Gm-Gg: AR+sD12eNgTCHee8U7QF2U4RggimFcb3A7/yK7lkmR2oEicNjA7sg7qnK+B+Hum8/Dp
	jsBQU17kUzluEHPBdsgw2GXnLxy2vJqY3IHGtpqmoBWcoww+eJORB55CdpCWUQLB95JXiF0nGKV
	M+CAEqaIhXwt3AthixQKhUI6i1SnLLJVVcw8J6U/qDrUOTPSQM/jZrV+8nxiKWrHa17uIWnUpG4
	Al3scvR7oY8fuuB4YHE0bFtoGUoEv/j47Y5phYjtLQhRgD8tzJj5FmM7aid1xJWgjtVfEsvfo5q
	bXfInq1yL4ILtXBU3Oxsv4T8XIDC2la0lN30F2AZFJKJLuEXzvGZaxpaTGitqUYus9FDvaKMFnl
	IXuNRkKdpxWVponOtSGRfDs5Ql90fQvaIH+5W383RY2MaWgzzmc/QWl2k/PbnR8kqO98HRAwH/h
	PDuh8E+rxGNR29gmE1r/hWCc+3A8RIqMqdaA2Ju+7mSC2KSbvFE9POCAcGF3JTS4olDKfrHNj6B
	ogiSg==
X-Received: by 2002:a17:906:478c:b0:c24:6505:8f67 with SMTP id a640c23a62f3a-c250bb556c2mr665876766b.10.1787739957750;
        Wed, 26 Aug 2026 03:25:57 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250dfd6e6asm307762866b.19.2026.08.26.03.25.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 03:25:57 -0700 (PDT)
Date: Wed, 26 Aug 2026 12:25:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
Message-ID: <20260826122552.5761dea2.michal.pecio@gmail.com>
In-Reply-To: <0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
	<20260825094327.606072e9.michal.pecio@gmail.com>
	<25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
	<0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 00:50:53 -0700, Wesley Cheng wrote:
> Thanks for this suggestion.  I think it actually makes the overall
> design a lot better.  So now that the sideband driver has its own
> segment pool (per sideband instance), we expect that any page
> allocations done from this pool is technically owned by the audio
> DSP.  This allows us to still utilize 4k ring segments, while mapping
> the entire 16k page, so it helps conserve/optimize the memory
> allocations.  I will do a bit more testing and review before
> submitting a new revision w/ these changes.

The part about memory being "owned by the audio DSP" made me wonder
if it would be helpful to let offload drivers allocate their own memory
and then just dma_map() it for the xHC. No new rings would be allocated
for offloaded endpoints when they are enabled, we would point Endpoint
Context of the xHC to the sideband ring and leave ep->ring as NULL.

Offload drivers would have full control over memory allocation - size,
number of segments (it seems that qc-usb-audio only uses one out of two
allocated by xhci-hcd), alignment, anything else.

It would become impossible to offload an endpoint which is already
enabled, but is this an issue for anyone?

NULL ep->ring will cause oopses/panics when somebody submits URBs to
offloaded endpoints, but I think it wouldn't be a problem otherwise.

Regards,
Michal
