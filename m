Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA1436A02E
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 02:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784601332; cv=pass; b=uYtKdXZ8I4fzrUlI23l4C02ygKabHe2//Nz0zTa89EJtA9YRU9Ggt5izwUOcHGOFnHPqgO+f9Wl5qbQxnSfu2Jn7htNiiOPH7KEmyXOz3mPElNbYIjDh5nOxDADZPyvXT9499yMQ+ZdATFBlMe3FB4oR/YOnfhrAHUGc2Kk3hH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784601332; c=relaxed/simple;
	bh=olP6fhFd3yfQBZ1leEzaAFgOUF6R9AP+V+S5E7Ss1Os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1dlroLVGzqJI7UkGRylKLeI8Tcm97mZl5VRSK9rOz2UTi9Uy7yodZs4eIGtxXsD2ONW7rPF6EG59sv6dVXeel9YOEhN3RC/MAPzBs0ViyJF/Zq85KDjFtyckUe33VL1kum09JLPOC5ZZSbu4YQYuKnvhW4giBLNVHznTj1OeRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uag0ADhS; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uag0ADhS"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf452def93so19040575ad.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 19:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784601330; cv=none;
        d=google.com; s=arc-20260327;
        b=BzVEe3frcfIa17mnAcdKpwAl4DYv9BFqUzWCnWag3FeoAVvKi3Fk+uiwWXh3XGFw3t
         9xetnKieUmbJLg5gzRp4VeBE9JdatPoVxrFlzyqOASCDe3fbCd0J0U3AUGZQD+YzILuj
         qT64JuiXvv5rcG1zo9R59sKG1p9eFgYcQUSjef6Lb8JCk1RcGf654OfujJShF3Gv2/e2
         y0EYgPzt5KIAvuC4UGIaFT2lMd0alGOVYnedlGNvACHHvnjbHRNcKuFQazvEhOKK1+p9
         +lMBsns7g2nxMNbgMGb7BjYnEvvLRqAQPtdG5EIWHA8CPiqoRYWiV5DdKanO1dXAnNy8
         7XyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fkktPuEZfL1BF6hmyNT6NL6oesW6VsaR8AVQ/kcA7Xo=;
        fh=WIPVVV04You4BmRcpklsLxQMbomsR+/AxaMxxz9spYw=;
        b=i3WlDYU4bjv+aTAiGbY7E2ASZFD6jQfyGYMmjJZHhjVhbBSzh5sgMYmDDL6AruWcjk
         l7gqS6Mmf+U00Ge6HcHTSkq7Q4c7uslKVHVKV/k6fouoMZjTLX8vKN31NKQyu2jNaKap
         TBkB2EaJQZyA9kzfDj4dEQEK/rSPVCoYxV9+aS9PMgJ7cHGwUBK4DP6QJLCUGmJdakvv
         Y6Ei/8aSkiNh738iFoZR3peD4hjuIr8hQgIDwECncu9hXpICgIrpp9BH0oU5UM0TDd+F
         kI9/pBGv3V0S4b3IshM8XQrFLkRQ1GJlqHVCTx4uCB7O36nPY51+2Ir86lmbu7g1Bb/6
         hBsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784601330; x=1785206130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fkktPuEZfL1BF6hmyNT6NL6oesW6VsaR8AVQ/kcA7Xo=;
        b=Uag0ADhSnWewGBNPnrnugL8ukOBXWEHcqQszU0L0hrrNt+pM3/OCp+Z0nHWjyhLBpu
         2Qw2xRj8+/f+oVxlrDrQJF96uGZiKD8axgOEDv7gtUUZ3+2M7yDaKrMJLtLyLQipxR3K
         zw47eVNppucmUtW3VAZ4WLMZl/Ejp8NW4MMCIIlb/KpAs+zcbLU/DvvLuHhVas7Mpon2
         CGfYVYde++O0Aq8XNP47hB44Ze+v6GY38Yg5HvTMvcQqr04hJpEg9dX0XzUo8K9lXTjX
         TIIdiEgdaxi8Kn/qeSp45i9aBSBcfLKg8joKH30zdth1Glvok91OXYqJPOC/5UfHZ48B
         vSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784601330; x=1785206130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkktPuEZfL1BF6hmyNT6NL6oesW6VsaR8AVQ/kcA7Xo=;
        b=qmSXC9eWN8Qnw4iUf9BtjTNTtrkjC0aNVTi3Fnx7qlo1MJMggDL0CYOTG+6Dq9yU4E
         RRed82NQVwUSGMQR0HDJ+DecufgNfqTBEUO6chWTzZToqXkw4R0ys7o6Ug18CpjIgYg6
         IuVCtwvF6BpizSlcg1jUdV0UT+tliLNUkUIKo78oJzGBelawHXwU7PvU07WQnyVZgB37
         p98fBPDxfa+IT1B9P7LJqfolcOTXR96UrqvEIWibODJNsDkmiEJACxvaQu96Vz9thjiW
         hmGh0mM/UFZ990tf6G55ivJ2ZUEVoyrXC+wrdFzgGU3hCsgvaCggM0g16O1n9TBirE8X
         8Fsw==
X-Gm-Message-State: AOJu0Yw8LpYBgv+Q4ye3056PF5J3cpUSzlkmVxN7tvaFW/1TeMyUDSUV
	SLNGaxu8d3xJi5z0SCLbLvm+KX96s6weGTBueti/Wr06ol3TO/xHediciV87pI2AAdArhmeEAin
	878EfviMj1t20kh48dznnIEyak5A2YzQmoqkv
X-Gm-Gg: AfdE7cmZefQOnpCfU5j68t4zPy/qjtsINsHuY4gTjsX19EaGOM8oI5V3v+MuuU5qCOg
	/yK9ZZxftZBMab70X97vsLgAaB3Y57G3QqMxtmRx/TVKfdZmd6m63Yl9RjqjqMUVyFhlqlvHkTx
	oyIXgQeERyFBs+bOFo684dRTMUKSMFwoZtqQq08kpsn+sY7WqkuS88QrKjBQeLPHMVoCyOnwX3F
	xU7DlcCXot+gS9fxZwDKgbxxx9a/FWz6Er9wDJyUAMqGdfL4MiJPVm17oEL
X-Received: by 2002:a05:6a20:158d:b0:3c3:7226:d5a6 with SMTP id
 adf61e73a8af0-3c3ace6f155mr16587487637.18.1784601329813; Mon, 20 Jul 2026
 19:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ5U=Uw2R7xVEY3ugZ_gRsi+yC9WviMbFEO9RbR6A3ue-G=adg@mail.gmail.com>
 <34fd1f17-6e84-4d5c-bbc0-e1cb990d2017@rowland.harvard.edu>
 <CAJ5U=Uwnt0kSJ+rFiA0tDg0=VZo3sVjfs49nHoFKXp28JTNoxg@mail.gmail.com> <bc2e0cfb-98ab-45de-a85d-e380d9db3629@rowland.harvard.edu>
In-Reply-To: <bc2e0cfb-98ab-45de-a85d-e380d9db3629@rowland.harvard.edu>
From: Anon <myaltforstuff1234@gmail.com>
Date: Tue, 21 Jul 2026 05:35:18 +0300
X-Gm-Features: AUfX_mw-hqyYov771pyugxfD1XGgT14bquHDgB835E64LVnAOxPOjGRjWWRBJqU
Message-ID: <CAJ5U=UwY7xADYQQL9fMxnigFbNdiKONVLettG4jFe7D8JtpyNA@mail.gmail.com>
Subject: Re: [BUG] usbcore: EPROTO on first-stage Config Descriptor read
 (ShanWan clone, 2563:028e)
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 03:50:37AM +0300, Alan Stern wrote:
> I don't know; it's up to Greg KH.  However, he's probably waiting to see
> what the response will be from patch reviews, in case any changes end up
> being needed.  You can speed the process along by reviewing and testing
> the patch yourself, and posting your comments on the mailing list.

I'll be honest, I don't actually know how to compile and apply a
kernel patch myself. I'm not a kernel developer, and that's a
different skill set than the packet capture work I did to track the
bug on my V600SE controller. What I did do is forward this patch,
along with the bug I found
on my V600SE, over to the CachyOS GitHub to see if they'd be willing
to backport it. If they (or anyone else) can hand me a kernel build
that already includes the patch, I'm glad to install it, test it
against my hardware (2563:028e), and report back whether it actually
fixes things.

> One change that would be immediately useful would be to add quirk
> entries for the various devices that people (I think there's been one
> other besides you and the patch author) have said require it.  Maybe
> that should go in a separate patch, however.

Happy for my device's VID:PID (2563:028e) to be included in that if
it's useful, whoever ends up putting that patch together.

Anon

On Tue, Jul 21, 2026 at 4:57=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Jul 21, 2026 at 03:50:37AM +0300, Anon wrote:
> > Wow what are the odds a patch this recent landed for this exact
> > problem. Thank you! Realistically when will this patch land in
> > mainline?
>
> I don't know; it's up to Greg KH.  However, he's probably waiting to see
> what the response will be from patch reviews, in case any changes end up
> being needed.  You can speed the process along by reviewing and testing
> the patch yourself, and posting your comments on the mailing list.
>
> One change that would be immediately useful would be to add quirk
> entries for the various devices that people (I think there's been one
> other besides you and the patch author) have said require it.  Maybe
> that should go in a separate patch, however.
>
> Alan Stern
