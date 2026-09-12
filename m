Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CB33EAF3
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 18:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789238497; cv=pass; b=nGcR+Kbe5kdmEYyCRS5WNDX3pY20Q5rWxt+3HRvFPIK7Rb/HtTWQ8LBdwXeTI3gkaz/dqN44raMeRFMTM6WrenpftShNgBerbmjrtvs5kHS87z16Tg0SNIQDqjG66Vd6arq6vtN6RqYk8ZukgdugCP9XNju/MxNvlkXbgWTcq7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789238497; c=relaxed/simple;
	bh=qtjD8mGNVxf7mZ2NIHBiWN/l2X+eK3VcVypAVVOeFfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDetQHdXlnIJlIPJKadJssXmQrqCl02zeG5xBzZUBdSZLsLb1EQyrhyajmKE+aiZhADkVhW5NTsaoX+j1e7FJGtd7OqndgX/PFcqCam9RXkSNKct/s8LNTdPVo3uaf0dNrQE11u+KRHWkV3mSeBj+YShrw8OPFTtnPjb5KyAIK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=YA/c8vZQ; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="YA/c8vZQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-869ac301739so1627036b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 11:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789238495; cv=none;
        d=google.com; s=arc-20260327;
        b=p8r8f7Zerbs8PaMFnVmyhvXUh3hbLMsFyaNdnvHY/h1WK2pK4rELiQcWBY8cm7fQZG
         lKGksViP335ebzJU/WhTZya86OKv6IBvpdo2fYDlfErRJwrlEj/YZX7BHuWywoC1EArB
         4BhkUPVfsxj/PWFnpYJfPnBueDXtPZixY6QjnZu5Id7G87F3WHVKAdx97kFjImZKSgL9
         +g7fHw0X1wdcp2eeby+if838P9p2DgfWOcA+J0DduLg3VBwwBSRcHy1RtzK97ricQVHf
         biDpA9/md7ffLQNZYUnid7g0bdGm/WeBaUnT+AXfVzPj5bgUIYhGFkQ4Zh/kEGrRo9Kj
         g+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q5HxYaGLmH6quZJ16ng/1tdJU0o/ciJH2LOZdATejjA=;
        fh=O+hGivtPEI8I0h4bGgs6OHmEmh8C/EzqewZcjgCrs/I=;
        b=QW8IWtd4e+GHjO5IcToJFFFffmjGD80fgdrCfdNTKK0GVST0yCk++6pc1eapBjINhr
         xNArsj/X/2Q4xFx9daLW0YoAIGz2UStZzWmu7RoeX0jaw/+ex+StZBeMLg3sTXonKiRD
         0oPYwsOgLKKRSy73TK0/TBRWIbY4fiZcHTdOw3H+sSmsslZr6LHo91r2XJD/HmVkfYsg
         tDgIvdvwVkSLubkTQTpdVFVgjwBpzIkG0mRe8afsxIIUN8oK2B4oAJ0XlrHCsMW4SoM7
         q7H2mlkOf8AF7c1Pn9WdQuuWSr4fufi6BgqU78GyM6WO+shFk7tvB6bQsKsN1vnn4pqz
         CSUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789238495; x=1789843295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5HxYaGLmH6quZJ16ng/1tdJU0o/ciJH2LOZdATejjA=;
        b=YA/c8vZQzIjbBNSsrIznsbARA0mR57HjDigMF86p3o5ebQd9Hi/u0TLnxze2yL5mXO
         ge1ZxvHwFDpHX/Dc5s7ACpy1rbK4lAY2VZtxIuXe6uIFdiIILhAI7PQTYtAvCzXpbfV0
         ZgcJBMZbzYz4N/aUAWaX8aOkMsMJR/Zc5Kbvm1Wyo93NtjBhVwMi3tKi6fiZRPi7ro9x
         ggvbcyboX9mRGPVCv4TMsBqsw7JSHEjp5MEqRlvcP37JwsDadAQZjJAzEmasYaZJ4NsA
         rr5jFA/JaAPRHw9aYjb3IVlwohFXEz9Y1przch0uAE9LunlxleiB/3X1vIKEgJfZfpzo
         M4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789238495; x=1789843295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5HxYaGLmH6quZJ16ng/1tdJU0o/ciJH2LOZdATejjA=;
        b=MGmyhYTICcgJ9TIH2felqSPzBf6T3MZV3dFGgnNcBc94hTy1Pu8pEACP5yIUGnYXyY
         Hi2dcXNWGToYdXShW8U1kJOxaITWk0p2PaoNeT+Ospjl9ZUMF+xRgvuEcYq4u4QJ561P
         Bv+f60c7PYPGSSMKVvNw3rfIOwpyb2X/t/iHIdPnWdglF/AhwwmqLT5Hu1nkr6rzRz30
         3xBNpEe0l7awTBl6Xun4BKa3OmFiPsGg1FLRoJorbc9ye8/4ADwSeQuwxMd1FE6KDsAJ
         7Mt+7dG7lZTZmYUaoTanYdt+Z6nzBf6MKVcpZQonIA/pUgY7wndIZhbfRcqllu54ZJ7A
         yBbg==
X-Forwarded-Encrypted: i=1; AKwUvBwJItjUey+CUcnDgrmGPddzO3sJGtbEdDDWkIl8VduLqFAHcOacSEr2rqJF9YMC+jdsUQSH+klurGo=@vger.kernel.org
X-Gm-Message-State: AFuF++mMASyt71gAg2GyNy0Jde7eZl897hmi/NQp9CfWqKBILYtrX9a5
	LQqJ+504KIUl59A2ctwQETt3slc7sgWBQ+hSa72VHHASKruUk9Q9uchWTwnrq0nWQCiSKdOTpvq
	zZjLWM6qqXsbE2Gumzwt7ygZBvCKnfWmlpAfpbS3D
X-Gm-Gg: AYBFou0TxYW0WOQlYYOQep7trI395pqC0u4VTdVQ6yfoRvgGsAurSRhjRgLm+O8L9KD
	z8Ubb8Px1yjaVJ9GZ2sTibfAZaf9NGITm7WZtleRhtMLvSguoXXp+R5W8bhy4Y02XMH103TZpxm
	uUhlV2xdOSlCo9qUf7EC3PHO/OtqZFu4xAZ5ZLPaqaLQIo4BaCMwdYfJjRf5S9zAwierfWhj7Xd
	I/dZXKY93kxhJ0G2i9Kiq7xDME+KtQCGjchLI0boJIGz1NIxM4pf1jAqwqik5ikFNZ3PxOEJV4N
	kjssC/EyrsusId6R+1ceLAiIenC+wQJAWSjuW5hQGGbH6tsviux2xxbrkCEIMaKn1VHA/TcEBYW
	P0uCM+xbl3JsRF89FSgLqf7ClL3stGKM108KlZVeU39o+zQ==
X-Received: by 2002:a05:6a21:3397:b0:3bf:b84c:2984 with SMTP id
 adf61e73a8af0-3daed206213mr20273722637.11.1789238495108; Sat, 12 Sep 2026
 11:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh> <2026091217-almighty-slouching-de2c@gregkh>
In-Reply-To: <2026091217-almighty-slouching-de2c@gregkh>
From: Xiang Mei <xmei5@asu.edu>
Date: Sat, 12 Sep 2026 11:41:00 -0700
X-Gm-Features: AcwNN1VRko1QhfcNpXUHrgWahCKVmFdRFEfCWoiFBe39F7TD0MRyo3ctkWNOmGs
Message-ID: <CAPpSM+TjBEDy0zpkeNfz2ZeCZxYBHSKrw3spDBYS-kBw=EXL8g@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: NULL pointer dereference in stub_recv_cmd_submit()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: co <co+66c3f58096d0bde8@bugs.sh>, linux-usb@vger.kernel.org, 
	Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Suwan Kim <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:47=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Sep 12, 2026 at 02:06:13AM +0000, co wrote:
> > This is a bug report, not a patch submission. See
> > https://bugs.sh/reporting.html
> >
> > We found a bug reachable in:
> >
> >     path    drivers/usb/usbip
> >     crash   NULL pointer dereference in stub_recv_cmd_submit()
> >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/trace/linux-trace")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you fix this bug, this tag credits the report and lets us
> >     close it on our side:
> >
> > Reported-by: co+66c3f58096d0bde8@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an unreviewed LLM-generated analysis and candidate
> >     patch. The same reproducer panics the unpatched kernel and runs
> >     clean with that patch applied. Use it as a starting point, or ignor=
e
> >     it and write your own:
> >
> >         patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.diff
>
> Please just submit patches like normal, in a format that can be applied,
> and do not make us go to random links to attempt to get any information.
> That's not how kernel development works at all.
>

Hi Greg,

Sorry about this. We may have misunderstood your earlier reply in this thre=
ad:

"But sure, posting bug reports is fine, but again, patches are better :)"

https://lore.kernel.org/all/2026090139-shortlist-junkie-9bee@gregkh/#t

We interpreted this as meaning that sending bug reports without
patches was acceptable. We understand your concern with the current
format, and we will stop sending reports in this format to you and
linux-usb@vger.kernel.org.

To make sure we understand correctly and follow the appropriate
practice going forward, should we:

1. Send pure bug reports without any LLM-generated analysis or
candidate patch, similar to the bug reports syzbot sends to kernel
mailing lists;
2. For USB, do not send bug reports and only submit patches in the
normal kernel format; or
3. More generally, do not send bug reports to Linux kernel mailing
lists and only submit patches in the normal kernel format?

Sorry again for the misunderstanding, and thanks for taking the time
to clarify this despite your busy schedule.

Xiang

> thanks,
>
> greg k-h
>
