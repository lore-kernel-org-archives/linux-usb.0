Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853DC81724
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 01:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175429; cv=pass; b=eZdiGeLW0BrL+mSKAEgUHlGUanXiWgFzFdmrS8itMGJLvU3qIDrgDDgQ9P/D+BiF9rXARjKmscOv4FPCFc1EKzfWUn6SURfvd+UrND/bUj1CLURM47Zq99dQutk3/dtpHcmXJProW2G8MJu0DIozGEKHVGO2RB2809nxTNF5FG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175429; c=relaxed/simple;
	bh=JvgmADxtqm79vi3+L1vND5IB6+lcqu7Lgy8WrH4V1rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIi22fAe3YTI5N5Hay/eczPsAPdfi4yPJtZeB/Cg5pysBn4y48JTKG01YNKI+kAC1bB3x6YuwXG7yOn7SMl5dc5PAQaW34oBJtt98Cy60ekO5IbPX8bI1JbIAxvcPudeyF7i6dt5gQ1awDP/ZAS+Z0J3yhEbRQBneMmq1DRRvtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUr3XX6x; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUr3XX6x"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66f943b286fso137059d50.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 18:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789175426; cv=none;
        d=google.com; s=arc-20260327;
        b=YSqM/bitQ0mM2HV3xEbe0+hf2iudAQfaFWaIpDbgnUSFIDR+r4lBLlkimn+EmxuYMo
         288S6Jk5t/M0GsuI95sIzCVKKahed1sBOHag4zfyOZigc38RChejI7NnibQqzrvwnVn9
         gkQKpuHeS0UWUzHJ9kEj32NxJwSKjivBsdk+TD2YYqLxkngd09jnd3Ww5Cf16WgoQaFR
         UWmzdj0mcMOHZitsj6ie1NkgA1A7fTzjD7jCzg6XgAMSrEdGRCOuFfxKSbLvjgyz6PAM
         GZ0sBP3/ikqZR+raO2Qw6oRHlTHB4kJm3Fels7iUKokMrnaM1h0gZxR/uaLFkXhWOqPy
         0pLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXx0sRtnKVpp4RBcl+M+AX/xvH16BRmJcRsmv15A+r8=;
        fh=KSoxjSARcinqALM2DzjMckZwS3l8Nh8oDTbSLoGn8oc=;
        b=eBiU0dGCIc3/ly2UX2Hvb+TD/N1eAo0cJLoLmNl3qC3+9RlEXPuhnojdzBFQDLBPH1
         upJ/W1+542P5FBHse3t8p2g1nIQTECaMQMEa70zTPbHFeRr74rs6hmob+nhgQ4nsZ8W7
         fc+okLF7n+tIhUb74UKNZJcpF6jjTkogNtyFgnRNPg5o/54/ZHMqJfWSE+b8ZUByrxu0
         c3LeWMjTeNcKwIerSDjW+vhi9W90XbNH2Lv0UMDt6aWDtGjEFsHmz54QXT/qwphXMX5O
         U0xIIvIMVljN2oRVvZbLdmXocb5vFslwHadBwfNbn8Jw76F2l6Uyhw+jCZkBJiqY96Qe
         X/SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175426; x=1789780226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXx0sRtnKVpp4RBcl+M+AX/xvH16BRmJcRsmv15A+r8=;
        b=pUr3XX6xTjMVe1E2iCIC5HZQMBz648qPFxUt7OpLVcA7kifdtyCXxrVU1aTobUGyUY
         X9hAJb58VlK+BgZ9prKHOLawZpm/z0OmRaDPZ+V4NSiHjqyVgvf2WOabks3bZHTtAi6o
         rZcCTK0C2wXtiHJghmw5pifr/zu0Zcz68n2xz84J28fOv1JOffRLYb/UCCmkMyV8Ujpx
         Ln9JFnuP9wHykWhijoas9BZB+NILiuBvDTNS8FV4eNti5D16/ZfXtBA5najRdmtr3QCj
         xrL4zH1cq7CT9RgIfwri9mItC/NF9zxAlcDVaTyQUOQ/Ms38O20UBq0K9ycrN/NBVnfc
         zfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175426; x=1789780226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXx0sRtnKVpp4RBcl+M+AX/xvH16BRmJcRsmv15A+r8=;
        b=p891qfAZi7BeL0+24ckL8CE2og64eNG4784TXHCExyXdCmVFwHdBMUlUNsrFgI3FeH
         HXbYud2RFIYmfB5c3dFy8G9IG3f5vcKJYjnPKnjT4/hhVp9dCAhLPnLzTtgQFIBf8Crn
         jirjRYhBVIRUDUtLYKUn+vdPUDbENtIuffyXxIOWe1TmlzMoSxMNGfgg8DGr+yIgNdUy
         Us/QuAFaTMmelCmRIZ4bpEu6g5aF4Wpes+7aqA0bH7liq/kGllRvcMhjUwMFFtrcH78s
         mXx02+lnsI0RiZBZ6mE/1Skh8fuRd92A3sU96mUbzz1HKkfh8lIQRjXm7AThrjpokYW8
         8cSg==
X-Forwarded-Encrypted: i=1; AKwUvBzukpbaQ8TiKwnR1YsQx+XTCWQx3U3wjvPgCiL2pZi4fUOg7SjqsPjTlllIgsrojgMlRdOlJ9vxhbM=@vger.kernel.org
X-Gm-Message-State: AFuF++mT4ipr5/PAmJkLvbjQdHbMV24Xhywg3ROX+zXN5IlWs34GQJTl
	Q/GzB7D6l0VBHEp4C+zWWoyWTfobzvh8YJpxoJ81Acqwp4XLviRpLsB+6WVMCoEY45X0xTycZMk
	oZZ0brBzvc4yXZTaqbaiVGSWzK4h8S+E=
X-Gm-Gg: AYBFou23VqMxn56wdANWn6DO/woea6Ss9wP7nUkgFhIugVnetCbJ8PExjYBluUswXdn
	nhCYn86I7HOmGdcA57ajXtQLgElVqCt4H5B+8GuFshhmgpVGE24oTCkr9aITbY/8NHaIKOWxqm4
	ka/2tJSoeTjz6y55IQpaExK4XqjRETa0hywMz4l8O8C4CEmcAE4Y9NdbQ9tSkkTg8JAJF6pRg2+
	jWtrStMVgEhmYOpFt7xfSZr2+yx3SwRfL1dR6Tc+8kktUw5IH2/RyTqvQb3v1M5cCqe8D1H0XRJ
	O2IIv+QFWArcxLLxv1wF8HuNeqJ5LHw2782t2rvBP8xselMe2hBd/HASfrOV/MsXxMOlqYdkj8q
	ccG5QtvrXQuhH54Bc1E70L47BXzEVhZZvDoTbzLGeCY08
X-Received: by 2002:a05:690e:e89:b0:671:2eed:f70f with SMTP id
 956f58d0204a3-67135a5d1bdmr122851d50.80.1789175426402; Fri, 11 Sep 2026
 18:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821121220.13006-1-kartikey406@gmail.com>
In-Reply-To: <20260821121220.13006-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 06:40:14 +0530
X-Gm-Features: AcwNN1U9RkyNLzz4vVHls-7nZlLrzjOJk34j0pUokLY7L6h0NfcCetYb4ATKesg
Message-ID: <CADhLXY7xwBGOd04P3+W92HDivj3aztipzdeFaDg7zCOemAqyBQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: net2280: fix NULL pointer deref in usb_reinit_338x()
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org, stern@rowland.harvard.edu, lgs201920130244@gmail.com, 
	balbi@ti.com, ribalda@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 5:42=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> net2280_probe() only maps dev->llregs when the PLX_PCIE quirk bit is
> set. usb_reinit() dispatches to usb_reinit_338x() for any device that
> doesn't have PLX_LEGACY set, assuming such a device must have
> PLX_PCIE set (and thus llregs mapped). That assumption holds for
> every entry in the driver's pci_device_id table, but a forced driver
> bind (e.g. via sysfs bind/driver_override) can invoke probe() with
> quirks that have neither bit set, leaving llregs NULL and crashing
> in usb_reinit_338x() on the first readl().
>
> Reject probe() early when quirks has neither PLX_LEGACY nor
> PLX_PCIE set, instead of proceeding into a reinit path that assumes
> one of them is always present.
>
> Fixes: adc82f77bee3 ("usb: gadget: net2280: Add support for PLX USB338X")
> Reported-by: syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D2ec7fc1793a63864d9d6
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/usb/gadget/udc/net2280.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/ne=
t2280.c
> index 7c5f30cfd24d..02d12c2ad58b 100644
> --- a/drivers/usb/gadget/udc/net2280.c
> +++ b/drivers/usb/gadget/udc/net2280.c
> @@ -3708,6 +3708,17 @@ static int net2280_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
>                 writel(0, &dev->usb->usbctl);
>         }
>
> +       /* usb_reinit() dispatches on PLX_LEGACY vs PLX_PCIE and assumes
> +        * every non-legacy chip has llregs mapped (PLX_PCIE branch above=
).
> +        * A forced/mismatched driver bind can hand us quirks that satisf=
y
> +        * neither, so refuse to proceed rather than dereference NULL.
> +        */
> +       if (!(dev->quirks & (PLX_LEGACY | PLX_PCIE))) {
> +               ep_err(dev, "unsupported device (quirks=3D%#lx)\n", dev->=
quirks);
> +               retval =3D -ENODEV;
> +               goto done;
> +       }
> +
>         usb_reset(dev);
>         usb_reinit(dev);
>
> --
> 2.43.0
>

Please let me know the status of this patch . is this rejected ?

Thanks

Deepanshu
