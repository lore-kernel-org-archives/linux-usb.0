Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3D388E64
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600291; cv=pass; b=Hwinhiw3zjkdvqlMY2N49XpOTfn0EXcL1Z4dDW6PKg1AcCIPzjra9M/vDudNfZ63Q5BpAcD+t0CxVH9wZPSLHtJfuyNyUpcZTJGh8Dt9euYVM7WddpQqz3wAR9maBdTP+9BsS4f5Y7vONo0bNY19d0jrw7JEFMLk/vggWos6ZNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600291; c=relaxed/simple;
	bh=zHeHpucERJjVL5+r2NcJqPbPArlHtoL5ieMLJnSAk1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKL2kFSth4nguRCq98KJ3fasx009alOC/W1mz6LWTKvsrbj4JRC1QM1QyOLmR/UdWUBdCFS6Kz3rFWr2EfvHAHmrvGRxFHU92PJip6SvQzlpXWBk0YVUh6yUiywzmqbUnSCEZ4Bqo17aBXvIfXyY9jjIjL6c9m6FEjcAAVaRYsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE4ASku9; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE4ASku9"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso32780001fa.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 12:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787600287; cv=none;
        d=google.com; s=arc-20260327;
        b=LoOLEPzNYHZD2602TcggY1DhC4+yYWCO5a8sjqnYV+WQPFq+vSQYtgK/dTj1qGMW1a
         KBsAnFt1y7eIp0BwJeD/i985gpHw/dGXijX0QPn1LptUgNz0RMX8+gXSQ0pmTKz5uFPx
         nyO3WOqKFh6tC607Z2b5KM32qZE2xl+G5D68xZmiTQhNcaFnOjgUAJYMSGBi1NzMHdZ2
         yh2TvixWdzeoPMw2HOqcjA9cQ+YIsxcPkqZ3VUnYlYo7nAvKFtN/bXn0tYhiCBHlbOpf
         TuIGVWkOUMIOCvGatRBZX+OvISYp7cXLHV+ZjG7YC0L9NMhflAjt+CyEkAgNwNavwt9X
         0C5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zHeHpucERJjVL5+r2NcJqPbPArlHtoL5ieMLJnSAk1Y=;
        fh=qjglHXYiK+YiH5LCwcXCvDclfVML63WsyijuUtpMa+I=;
        b=isfr5Wmu+rKfZiWtlgRV25TBFBu98b/zkiq0sc9qhZ24VXNFacWVAFQLsZ7uoFDxDh
         XvrNNJKatV9qzC/xPOL6/2yHd8LbGJ8Slny87CGVN/lv5RNjRjMTn4nvpZCmnXHsTQhP
         dzBDBkZloC0rym4d0XyP02IZn6parJXa7oBImQigGr8FevG2/rFrkxFmmddj0KT12sGS
         dDMHsz59uyunZKLRT2DtX5nG9VJrSc8Kra+bWKLvVipSrnTrP7v8kDCC5nKQ726B+CiS
         kTqgJDrBmg/IuaOmNO9JlMNGLazGuFOpYxqXCqPsIje6N3km+SnOFYo/VBQ1a7Z5M4rN
         UKzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787600287; x=1788205087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zHeHpucERJjVL5+r2NcJqPbPArlHtoL5ieMLJnSAk1Y=;
        b=mE4ASku9LVVm9yxGdgl2Fq7Ge1gAcKaZPYYbI73rle0bsQ3XkbDq5UkDTDP/4zLEPc
         Q3I8e8PVwT9Q+pJbLcm8Zm9zNIG6uVcr2fwFvLkmlPWJ2wW7iYJj2jPHjURmvWn7id+X
         0eR+GefmTE22O3Q0BqL2E0VY/mJVooi8dewTlu9Y39Sf3Rl4biAwVMeOOCGLyi/i+T+T
         NbhPXKRiyAsaYp8X8TG26kZmgnvT8w2BJEquIwYdbcFsr7w3QzTian7Gm/YKb2/1E/0m
         uM708AYnhzDct2ZZ7WtYEj/yD24sonir2vueTQNKTcdVH2cN38wI8BF6EuoK7kbOx/oE
         H1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787600287; x=1788205087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHeHpucERJjVL5+r2NcJqPbPArlHtoL5ieMLJnSAk1Y=;
        b=HtFKEo4HaYl5/DDnctDn9kH9Ct7QeHdzfgpNRY9rrGGE2wOM9lhF8L0GtCBfH7lj7e
         ZnR+Tq6V1HBs9fViNLLDhcCzMWqyWNrNjv6ROD9fnUcG/4/yswT+OKGZfEJnSJsQ8oUr
         nJsSuD+5fgbN9vtwGe6xgxsa8xDJAy002mgpqTmjWhV8xI66mPswAtXKr6V7BJeyXmJt
         SRqjgAvp/iY+yMLuFiEdWL798ZcRpM+t6CYB/+qqql6DWVOg6oXuLN1IJNR2Erfi2nB3
         JYaENDzy30ZDJ9pGB+HmLWHllf6qNU04Kr0S65eOMKWngrjErGLZAUOQsNU6gqkOcGpW
         OkHA==
X-Forwarded-Encrypted: i=1; AHgh+RqsjwdBbgqatAAZv9Q26o7GXetUZot4QLR27RvOqf6GD5Ehi+OEo1FS39F7Lce4jDeA+RDqaQNFl2w=@vger.kernel.org
X-Gm-Message-State: AFuF++njMMikWIVqAReugefPdBCxuob8MmrMsy1aXlVA2CrT+75KYRkG
	ec+LJvdzM3oBa2Mev1xzcGRQnQYhQDXcpYSFfkPGcm0cGIsQSE/LEdTYvocvD4S3MQsCbw4j8Bq
	aubZlnij5escRk31bW76scfl/RBIr9rE=
X-Gm-Gg: AR+sD111erOT2Ps6oiRshICvNbLSLAjZO7BKMly+MLzlFXrbPv8y3ooGA81Wvo/YlyL
	AnYWzk/GlANXSM01J0HGOpeWAaS9FuWixmugE3ijFlDaBd42TZmnBazcAHmpg8DKF07BYLOHRWp
	85V0Ewd4pbtdLL+bT/WuLQSoiuDwgqv6wt1kJkNgiJJRfdsriFheDJ5/MG4OAywSNuPe9JOzLtj
	yO7c1KQ04DazuioS8eWzLeu3a5tDMJIsJwjKdHF1U1S6bycjNxcV9MekR1dEAfw51fL2ToQKy/E
	xiyHtCBENDgS+YXzFEWbPDiUUhOSPcz+pPOB3rUcK4fUEshkLVoIooDSEQeoPRWrrSmJ8dpk3Vm
	A
X-Received: by 2002:a2e:a983:0:b0:38e:a12c:418c with SMTP id
 38308e7fff4ca-3a1ef5775bdmr1370571fa.11.1787600287017; Mon, 24 Aug 2026
 12:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info> <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com> <aoser8dLytrwqBC2@eggarch>
In-Reply-To: <aoser8dLytrwqBC2@eggarch>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Mon, 24 Aug 2026 21:37:55 +0200
X-Gm-Features: AcwNN1WiVe33vc8h6QVQzrHv4uzYMmh-8zMzWXxnjMlLCWrcww5TjCW4pcQuiCo
Message-ID: <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The issue is obviously a severe HW malfunction (you mentioned MCEs, the
> Ryzen CPUs simply totally locked up), triggered by poking certain xHCI
> controllers on the I/O die of these CPUs in some wrong way.

Yes. As mentioned, I first thought that the emulator itself triggered that =
by
doing something that the CPU did not like.To be honest, I barely play with =
old
Android versions anymore, but seeing that I could reproduce it even with
Android 13 or 14 made me suspicious.

I _guess_ Google implemented a workaround inside adb for version Android
15 since using this version, it remains stable for more than 2 hours.

But, in the end, the situation is that from a simple user account having ac=
cess
to some usb plugged in devices (I usually add my user account to the plugde=
v
group and use some known udev rules to access my Android tests devices),
you have a way to crash the complete system.

> Opinions seem to vary on whether CPU load must be present or absent.

On my side (and I am here only speaking about my TR. I don't know about
other Ryzen CPUs), I can't reproduce it under load, and one condition to
reproduce it is my CPU going in C2 state.
-> I did a 2:30 hour test using several youtube videos playing at the same
time on my desktop, also stressing the emulator with some 3D Mark runs
(as mentioned, I first suspected the nvidia driver to be faulty). As long a=
s my
computer was busy everything went fine. But then I let it stand still for a=
 few
minutes, and it just crashed.

If you need me to do some further tests or experiments, let me know. I will
be more than happy to play the guinea pig here.

On Sun, Aug 23, 2026 at 7:05=E2=80=AFPM Lovekesh Solanki
<lovekeshsolanki00@gmail.com> wrote:
>
> On Sun, Aug 23, 2026 at 05:40:59PM +0200, Michal Pecio wrote:
> > But I'm not sure what you mean by "1Hz stress loop" and why is slowing
> > down the suspend/resume cycles or moving suspend from close() call into
> > a work supposed to create problems?
> >
> > I would naively think that doing things *too fast* is more likely to
> > trigger races and break the HW. The whole issue smells like a HW bug,
> USB2 roothubs still do 30 ms cycles and are harmless, only stretched SS
> ones kill the box. So if speed were the issue the faster ones would be
> dying first and pre regression kernels ran fine.
>
> About 1Hz, adb scans the bus once a second,
> every open resumes the root hub and host controller out of D3 and close
> puts it back this existed before regression too but with 30 ms of
> close() and slept for rest of the second and now it keeps it
> in D0 well after close(), the suspend itself happening later from the
> delayed work, so this d3 - d0 - d3 trip of ~230ms repeats on
> each scan. That's the loop I meant.
>
> > Can it not become a problem for external hubs, under other workloads?
> Possibly yes, but nobody reported that so I'd rather scope where the
> harm is proven.
>
> > Also, what if we connect a downstream SS hub to the root hub? Will this
> > not cause the root hub to stay awake for 200ms again? Problem is back?
> The root hub itself skips the hold since the check is on its own parent,
> but it will be kept awake anyway while the downstream hub or devices are
> in use which is normal activity based PM.
> If heavy polling behind a real hub ever causes trouble that's probably a
> xhci/platform level fix anyways since real hubs can't really just drop
> the hold.
>
> Regards,
> Lovekesh
