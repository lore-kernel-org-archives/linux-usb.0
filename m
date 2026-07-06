Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89223A383C
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349215; cv=pass; b=KQ+mzUAG9byGKNBM/DKT9ixDeKiMsEqoxOMB5OwZD2OoCCQk2Do3pH4Q6lIAUQ3DAEt+M+FFAT5aFWVJ+lEZ5vUx5amaAzLLcVpdy5tqNa57aq8prKcYsQTkP8V7qEGEFhig9iAGsb/PEvaMI02pdk5GZaM6fvHrxmdurqgthU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349215; c=relaxed/simple;
	bh=XIt9g8EG67F9cgRee/glyq8tUMfvAYEbWJBaUWy6Nb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZ9fQji6hQb+LwVnvWTrzX9kUUZVxMKyf0s26R62TP8dlLO0kLNrf7yIHxF8DXIu5803AoSp8IlgSfJlUZonEmazcgHLivbr+huny/d/WC+DZYwzewvAtGczw7d2E/HHP6FrY6MQv8onqbjUzCFe22e2Btc1ry6iKBQeBRyJOak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCQVfpHt; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCQVfpHt"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so5443482a12.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 07:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783349212; cv=none;
        d=google.com; s=arc-20260327;
        b=Ui7BcNwxqROM+heC4fNPN8SqWpOCQVvczJKdUH4CAFOlIWlhtVbo/Y3V5CULi/lNv/
         fVqXaesM3iBHZ5mPf4hemrfrpEJJgi7fxFLhqQ20OHelBDxVGdoEQt505uIbwV0fx1vm
         VTwyld8snc45DdAlVxGS6VlhiRNrvE8Y0b/i+dlCzaQKVhv1Iy7rcNs3wwr9dmAH1dJS
         3rmHW5Jh+bK/9Zrr/FHhGZcJladbNlYhvho6D9lXDMrM2IzR0qXJ2ylSi/J7pHsLg5yc
         LMjokmyLHqMA0sgNN8Jccqwnx9jaovZhyKtDwZnPwXDLMGQv0CEnq3Rqdonn1TeNQn3t
         LVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FORy38h/raNHh5CiZOJtyCT7bYZdVLlFNLJYBpR1kIQ=;
        fh=y/4IXc/pt/WJNHbZVudvIBRUke0LnsoliuwXdAiIyyI=;
        b=b8pnw/lN8+nxfrH1NZmOyaOiBHIPxxQSld5eES6QV9DZrDRbnUegwno6zCl3cROC2L
         T+aLuaOyW3O2SHi5MjQ10LtV9NwRihiEbBhlXcSM4CH32eZmpcGVQQ8znhTfVVnE7KSC
         8n1BjnvdmfvWYyn336oH8RJ/ZScZpSKXKoOcb8ZDAwF2IBP4jxxQ3zRw7N4yqILy3Mlo
         Lxu4onXOqvwBvSBKUCOFaA+4P/yeUW5DB9/S5teqDMQbiIwBKxnseJNSMEOYaH+Z/LxV
         O3OeFEoae9e5P8p9FfUebBFDrj2puWqlrkgEHkbCoMQERMV92eKfw0+09NbGYTFZ+6lf
         AcuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349212; x=1783954012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FORy38h/raNHh5CiZOJtyCT7bYZdVLlFNLJYBpR1kIQ=;
        b=OCQVfpHtTZgsrQ/QlAMqINsuwa1Bo48ySGgc77RDPte0azTcSNSaOIs51lfFkHt9f2
         UYIBgHzvoJILe6a695tJl11bk0T83K+QHp/fUuKqWoWVY5cCBXVbxbH/PGymR3qHYzx8
         ufFNtfPmojWakMg06hSWxrqFl/aP3sqGpDLdDrgQ+VNF2W0zc39VoCuHbbnXFslAqBC6
         O4juZEXvHMf/AlgZ+hR0s5OjNG0vNORg7e3u5nIrzTWlLLJnDj6Kz9fXiPlXc9OTY7MT
         Dc/kzbOiHFeA78tKa+aBWtkeY6Aa+wVFbH7T47JQ4jser80PvG7LCEzhtp1Jy2QjXG3Y
         hrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349212; x=1783954012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FORy38h/raNHh5CiZOJtyCT7bYZdVLlFNLJYBpR1kIQ=;
        b=EzZRLSj4pMFb6CKT88LD+FJV+CJvutI40Od6s4uVPN39ILNtScv7RYqFggC4d2rXEq
         jRdEg3dnqM5UEWqpB0POZj4I3DYEsESIppBJHVmnYD2JGXa1opL3H609/JZ1ZualIuq/
         ECHa6bl61YIvzfMCL1HEgr4rluUYzNCzs3EUjzgy2AvgnSDxXjGD5/nm1iAO1uITgiGh
         QLT0sAvQrFp3snl28dubrLLKeGd6geu7SF6LktGCff5KSX2pW/n2fgQLha9aqRaWLo7P
         UJXfuj5T/cN7FtWRuz7x141m2K0F0w3EYa3OvjD4Wt2Aqa6zzGzkKnUuOIEiPiMUXsaF
         OVyA==
X-Forwarded-Encrypted: i=1; AFNElJ90YsmfR2WrOIsw8nxBHZfT0//M1ezPY4GfkL5k3aH6u56yH/8r4tU/rg7ku5f+GJ90cmSjF1NCMrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCqZCK02/slzmNt04O2YtqjgP8h47Aa6TtKvcj5r3gWZUSXuQA
	vFIV9yHRtNdzL7oR0Ilv2gAZmHLjzmhH+P3owlWe9+iUx/PVAXsa8/2P5wTjdNHDZljX5G/j7M/
	1bD7/peckxNcoMhbh0dpOAGcftdFaZg4=
X-Gm-Gg: AfdE7ck47CSdX7kSpMfQ3TnerUq6/o7CCidYzqosN85I4TcOQC91EL3beJqHX6g6176
	imrpgQsGVs78Kr9XuRNj0Zo8VmL8fl4Ostqf2FxGTIAMKD7wIYLyp/KHCWyXqQ45f8btomazaV8
	5VgjdlVDJ1uT766A6CPBsL/n4VGylV+hMDkpp+QrlLimsXba9XDiGDzB7kgMn04NsSEDLnBEbDD
	h8FkkQlCHsLD/GYbs8mhq7WPY3RKULMhJC6S+yZo1FuFb5MaxYwS3ssve4EYFd5/sLnC9EYNd4y
	9KbSlvtu0XFQsonNTRZaBbkyImTcncK52a5vXgHbrVzOvRNdQRtgjFWOMpo=
X-Received: by 2002:a17:907:c785:b0:c12:2acc:c9d7 with SMTP id
 a640c23a62f3a-c15a67f7e94mr49868766b.15.1783349211791; Mon, 06 Jul 2026
 07:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <20260628231634.6752f74d.michal.pecio@gmail.com> <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>
 <e7d49127-0215-4b29-9a2a-e1dc0d889b70@rowland.harvard.edu> <CAFgddhLeQ1cJv-E4mYWR8cs7T2USkrEd5i=uxqkNCH2UWaQ5=g@mail.gmail.com>
In-Reply-To: <CAFgddhLeQ1cJv-E4mYWR8cs7T2USkrEd5i=uxqkNCH2UWaQ5=g@mail.gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 6 Jul 2026 20:16:37 +0530
X-Gm-Features: AVVi8Cc6S4gmNZiqXPN-q3CLCjzsrywYMCqte4aKKTPMu6Gbk__YM43TBXfYweM
Message-ID: <CAFgddhL__55iy5FyekW+-dWD6j913DuEV-_505gKRTT4pe6YPQ@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2026 at 22:40, Nikhil Solanke <nikhilsolanke5@gmail.com> wrote:
>
> > There's nothing wrong with trusting the caller to do the right thing.
> > Besides, if a segfault does occur then it will be pretty obvious that
> > the caller needs to be fixed.
> >
> > What would you do if buf is NULL?  Return an error code?  That won't
> > help anyone locate the bug.  Put an error message in the log?  Segfaults
> > are much more visible.
>
> Understood. I guess my coding style is a little "too paranoid" and
> "check everything and report errors". I understood now why this may
> not always be the best approach in low level programming like kernel
> development.
>
> Anyways, I have done all the requested changes. Here's a short summary:
> - put strings in a single line
> - copy bytes from desc to bigbuffer instead of pointer aliasing. (so
> no krealloc too)
> - change tabs to spaces in documentation
> - reworded some comments
> - drop USB_CONFIG_WINDOWS_REQ_SIZE macro
> - revert USB_DELAY_INIT to original behavior. no delay before 1st request.
>
> Let me know if I missed any changes mentioned in previous discussions
> (or misunderstood and made unnecessary changes :') ).
>
> > I wonder if it wouldn't make sense to split announce_device() so that
> > the first line is printed as soon as usb_new_device() starts, before
> > enumeration is attempted and possibly fails.
>
> The current patch still logs device ids upon failure in
> usb_enumerate_device(). Do you want me to implement that suggestion?
>
> Thanks,
> Nikhil Solanke

Just following up on my previous email regarding the requested changes
to the patch. Any comments on this?

Thanks,
Nikhil Solanke
