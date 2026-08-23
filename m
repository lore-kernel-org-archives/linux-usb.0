Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65FB390CB8
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787501454; cv=none; b=eV7fB37qhaiNNV0MkJpILJsNUyleEr7u+qKP+G/ejI5q6k5We33YleoXBitGYmm4WZiA/ZoCoidDUrC8Y4CrfzZ33s8QvgwcpJ9SezdALOOpn/snnHlJj+KNh3aZwJ0GaRgy52v+7VZ31sldGyVXAToIbiPSCY+3GYL1eb5JDt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787501454; c=relaxed/simple;
	bh=lbWmABHhb9TMAF2Ok/ofP++jFSdI06DXNKBawGkc4oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+KqtQd+HRQaFt82Lo+azUdRgLIvbi3Gk2Kvn/6WghkohZX/h0Gdp+2aYTIlLTsSU24e7OnqDXJ0+PwNBEpSobUeHiC9H4IEryoXOlWXDjDx7r5liCi2+ark8txCCPeeMj7pgrm46gzkFNfOFED72HBcjTJt2Qp4NxlHd5zCqC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRcZ+hnZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRcZ+hnZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15b1da6b82so278592966b.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787501445; x=1788106245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TyORu0icZu5goeOAIcax6J1V8GVbm7LatmMPeHFdvPo=;
        b=FRcZ+hnZ4/1kTvqEa88jiV6ORlMHUDNUZTbLqRBOPi+Jmhq/AyjEM46tVwslbc4VkF
         guL0yj+I+9bJiG+QHaRQ9dod5Rrw0mcmavwh6NLr7Nb1YIcVOBV/x1Fh3sibEitC7u87
         m/EIPT14VffQDEUGyCzlqjdeqxCdW45yG5iJWp3NPnyJL16GhZRTpZuymZ3d3OgEHpeC
         2CnLg+Ip9etcSSGHesbGUWBI1KGnPtdT8AC2a7LTNbDXzrv25vNkUtDRs6gMrqsKDZ3R
         x+nPrkfM1FpGuho4ZN2Pfh4+qhbqrsu5fuIGf/8qh2cBS7VtvwNU15/Jv6wF4/06W3UW
         Fmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787501445; x=1788106245;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyORu0icZu5goeOAIcax6J1V8GVbm7LatmMPeHFdvPo=;
        b=bdOdQGnOprAkTWcetIP6SPviVawN4M+IcbPZJF9NcBVXiXxq5MG7936pVyp2/exp8F
         q4nVEnYlRmscqNBpK4a+kJKLTB3JOABbBL0HCh0REAIj45J/0XT6X4lxIdkr+VoLFUuB
         txw1sRfvb4LfyKTTixjxwWdNv8F+Xn7dDd5MUx2kpNGQ299jZE/Fo8aV8jKfqdjZXojx
         57sCw2kDBpmtJPPyuqmbZNnKeMt9VjPaMjbfuQSO6MPhFQHiMs7f8n80aJA2Vw1cPYYm
         5QPAHuQ1iIbJpYIcDxFxVMuRGRFRu0yELNODzVa5gj3todWyEaw/VZp7QP3djcW/DDKk
         W2Xw==
X-Forwarded-Encrypted: i=1; AHgh+RpDp2Fsomo0zP+peMkvkmGPZHFinp0jEDlsQtvKv2fC/GIaCxJ4moG+gt9N1S5gUiqTrJL8vL2DMP0=@vger.kernel.org
X-Gm-Message-State: AFuF++mj0pbIIBatYtPudK3IKx2L9TSYpWWhxwX0Ti5MIgCuveylU03q
	O1uIMOB6ebxsNlJa+UpYR/XbH3DBxXGFwoWxIGiF8c5yvso78IW/0jjV
X-Gm-Gg: AR+sD113P9jXrikEbiYPq3QVyyCsaF9xw7jJ+jQJnde6R5WTeqgs4huh8vo87ZwP9y8
	WANzxulLgS2xVSUAiPghALXkf2xqQHPdaPxYMOieDvYhC5D/PyhELWcDj5EmTP3f+wNz3ybWqLp
	W21LjeCv8AR3p6r9w7TuST6S/1gOUJVERc70hocOZbR4IC5nDocUs1HPkZWsDtT5UUGfTe0Q9yt
	EoJSjVKsVQSSvvWQz3C48ISNDIkgbI7JIZJas7Fa8v6ESpeBvsiSjvfEIKOYgCa+auoU82QCoPw
	+ojTr+6JM/20eAf+ibnzq1nx94KCeV0I8WHXT+v2uwiROzrGOuowg9DLj4Qp4jsoMZg+1lkCAfG
	35QGcbW13Dc0klcOh1fIKCvdZU/l+G9YGSJmonrZ1iRnsw1BDPzoNkBCKEY13LmtUBMho34OYZE
	xg02uOfVCMQDcRe2DraJN4ICPUwul+GqFBrlH/CXsbYWvazJmYC16jX0Mij1QjU9uktUw=
X-Received: by 2002:a17:906:ba97:b0:c12:9b98:209e with SMTP id a640c23a62f3a-c246a692891mr2208059466b.23.1787501444843;
        Sun, 23 Aug 2026 09:10:44 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm921183566b.46.2026.08.23.09.10.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 23 Aug 2026 09:10:44 -0700 (PDT)
Date: Sun, 23 Aug 2026 18:10:41 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello
 <mario.limonciello@amd.com>, Forest <forestix@gaga.casa>, Slavik Dev
 <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <20260823181041.4eb74365.michal.pecio@gmail.com>
In-Reply-To: <CAPyJwA-eNSbVGV0uhy0-2w2_Gs0dWdOeJLRpBSLVO_a01-ZPxg@mail.gmail.com>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
	<CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
	<CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
	<07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
	<CAPyJwA-eNSbVGV0uhy0-2w2_Gs0dWdOeJLRpBSLVO_a01-ZPxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 13:44:53 +0200, Mathieu Fluhr wrote:
> Yes, looking at the reports, this looks definitely related.
> What is happening when the emulator starts is that it also starts adbd
> if not running on the Linux side, to communicate with the emulator
> later on.
> 
> [...]
>
> Ok, here you lost me a little: Looking to all the links provided, yes,
> this looks very similar to what I am experiencing. But (and correct me
> if I am wrong)
> 1. reverting the "bad commit" is not really an option, since it was
> originally authored for a specific purpose (other than annoying AMD
> owners :)

It does seem so, even if the specific issue report isn't known.

It also isn't clear (at least to me) whether the intended behavior of
the patch is causing this, or if the patch simply has some bug which
causes unintended side effects that can and should be fixed.

> 2. the patch that Mario proposed is very recent, and would address the
> issue not on the USB but on the PCI level?
> 
> Thanks again for the swift answer here and all the informative links!
> I must admit that I researched a lot debugging this issue, but I never
> thought about looking to the USB side of the problem, focusing more on
> the CPU side.

The issue is obviously a severe HW malfunction (you mentioned MCEs, the
Ryzen CPUs simply totally locked up), triggered by poking certain xHCI
controllers on the I/O die of these CPUs in some wrong way.

The minimum known trigger is this loop from bugzilla comment 8:

	while sleep .1 ; do true </dev/bus/usb/010/001 ; done

Opinions seem to vary on whether CPU load must be present or absent.

The minimum known workaround is disabling xHCI PCI function suspend,
see bugzilla comment 16. This knowledge has spread on distribution
forums and many users stopped caring about this bug, but clearly new
people are still running into it.

It seems USB devices and even the root hub can be suspended safely, as
long as the PCI function remains on full power. The influence of CPU
C-states was previously unknown. May be specific to Threadripper.

Regards,
Michal
