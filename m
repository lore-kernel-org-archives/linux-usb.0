Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094721;
	b=Y5oKbCgUt0GJ2SKuaPZ3thnotnrofSpzUqDj2WvaKECIKRSH/BJTMJkZEJVg4zVEONJb
	 RjDDdEJUiMJMMk7UdWKnVz+nAfrOqyD/kiJp2M1WxSlHkvvBDJyH4D9hssX/TA0rGZk9p
	 7WjaZj+VdxGAzvzDCW7+OqovBt/L5RqS6caPJUjEvUTV9qOXQK+U4yzfg0dtTGLwSvyd1
	 rDBq2YGtNngfiA8MCVQkrZ+3i0OdheCmTZdG8Ce4x/0WJgldiwrxksQDLWNKjBBbwQ/BM
	 ir3ydKp2xNU56PCokxRC6wkQKGyA/HEqGOWwAa1CXXMQUsrS7pYwxNU0aDfabIQ24xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sgmca7XuOnynXT3mQi31mFdatxGlHzSq89iOdzC/zQU=;
	b=RN5u91HwyJW7zk7u++oPJj+9B0REtGI1Xs+/3bBlK2UjEL0SyFZ2U/5RgjFwEooC1LGe
	 nIAVp4CoBnKzA+xDJ9k1DivTIKHQ7Tm6S0Q5A5FuVPmKJlR4eIYcob2VC1WFl2LUrS6gz
	 8pSg0dZp/2U4bouZqhDhu8T88ZhC/T6YlOn6JHHE9TVzGrp/9mZ4QTOCU+mlu8QaPLidz
	 GFXt8SvE6ruLQN9zpnZUsLWmbE3+chEOE+ntpi1VCwykMeKzvWlV+EwYwaE9GxKQ3pJcg
	 cvBy6oVQhgxEMjYOg/w3fFUJyj41iW4Uk8hq0HYOCw0w0GBuGPATy8ZFBM0fB0yazCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzH3FWyv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF83F606A33D
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF83F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzH3FWyv
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-381f65e4e4bso3442200eec.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 05:25:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795094720; cv=none;
        d=google.com; s=arc-20260327;
        b=ohhf7xpBQyaAvX4m2HtIMQDsEmTGcoF/0R+zUSfH0uX18VM93eJE/6DqYZu0gZPc0c
         7ihsx7NsXhEzrN9aQuKlPIu1V2R1JNYdjAMc2D6LJ77kXWLquDoiV11QA6l2R7CEEP/E
         FExbpcX9c1FopRNg3ZatPh8RG2RPywSiz4xa7g/XMvVGSUjnYoze4r1W/3Te9BL4P+Wu
         bAYC1RRftS9V6wtUZaTexiqs2t6sy6HPFGVeC3TwwvQlc3a5uTMIykfm02rh8artdpS6
         TnfkWlkI4r5PghpE4glZ8FTGFGhLTyfUFdEJAoyWEidfrAF84cqU2iPRePmZDsA6uTQ0
         HBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgmca7XuOnynXT3mQi31mFdatxGlHzSq89iOdzC/zQU=;
        fh=X1YZq0rORWc/dew0D/kbaxC3+UhxTu6FBnjLFRcZqxI=;
        b=HYl86ocXvFTXsrb6vnioO8xni2SzikSocTE8ZxhKTbHQ3r8uYjGk3WYi3QXLUW9VkM
         Mv9jOSAJmrbAAsvXYzT3vpuEDhnFv/XyVgwSTpBosINPFPkktiXeU1uapVo5xCPP0R6y
         X+S7Y3vWf5VTpNZxI0Zh1uVsihmpvhsA4pAiByUnhxqkMjQ00akQqJHnUSK9OARwv7YK
         HqbsYj0xMuokPrh6/AwueiKdEFh2kUVkSJ/UuXb2tk14Hja3bFWSVeSX5hNnNiSksE0E
         Md5Uux3tb+xyyEtlQC8QaRJdgULz4hFMm9UVm9UjFyFPwxevu2C0Z1PAmKReT3hCDJiW
         E7fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094720; x=1795699520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgmca7XuOnynXT3mQi31mFdatxGlHzSq89iOdzC/zQU=;
        b=YzH3FWyvCslA7vMobf7qLaUOeC6g2jhmXWuFZHf8ddwn1zqrbF+eDhUD3L1flLIfWj
         uFiD/sXUKtWs408RBoSYBWLnu/OiNRF6l8W4PRoqlonZaBGyZgdUmAHYbDBkqhwBE0bC
         PGnCWvbbAc37L1EEjR3CgynSKfKdQaG0/JNGMzin71maQ9X5IzXG3+eQaz7qovwv1xP9
         H7UgiubcQ4J4qOPdiuVB7moyvKtlIqSnKAFKM8BzXLrHLzy25rySwhSYCMrIQv8lweYI
         zy1MUKxBWTolou0eicamjUCAwTpzR6ET5YkE4gXHf9SU7kVepVDQ3+s6mPmDMNEoPANz
         lSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094720; x=1795699520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgmca7XuOnynXT3mQi31mFdatxGlHzSq89iOdzC/zQU=;
        b=WxNvlyfTvzYUxS6syU7ixfJJKOJ7AWtJG99wprlToXwaaOsDFKKkhOGsWbWZgkeIWQ
         WfXIy65bahDlwAzI0Kz//RfYGGT8oMXrW3GQlVFgF6Feq0PX76BBsYEye6GKBwydT35c
         Qlq+dciFmJh1ndUoVgA9KLhq4K54d9x2COO/DK3gGvVKIhptyeoZviU2dO/NYt8UieM5
         v5RFFd5GMvvmVS7zKAmsHyXXMNGfnqro0BouG3a2LD3OVA/QHUUaczBpORD//GsPevXc
         7XkEmahU04W/3oNC7fGjP5YIK0+TnyQYNYygAzObOAXQzQnwwClHMJWMwoJ7hOJY36FI
         6Z0A==
X-Forwarded-Encrypted: i=1; AL+hErF3LqE4BWh0q5yeeS8Y9eBJD3rOeW0zmMcpaAb5W6GmVT8vIetg5ODT+PIalgQMpj33L72kg3Ad2kI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P90N2zCxk+QKFiXkUYVX6CYuLDt1TFGBYZq/viHHr+IEBoscR
	b0NnjU66BR5VjopQxKFf55rzQ5t6LyORWGeqDbW0VlXrqqpZCEj0LXTiUMpTBs3Iqdg6rx3InK7
	w6/pwu00lKrxhDk0lXbgfo48Cy9zxj/wPD1kmox0=
X-Gm-Gg: AZFdTZdc1ruU1U7siRkSgmmKSEKFdZ/NWcHJwOOs9CJfyZykURGzHDaQCKGtFfpCu2N
	Gk/6d66C/N9yVPVSm7JjrJ7+dvsEHI7T3iF5D0REOsg3X8b9+4BNTOFeOljkXhj7wb3KB2suixh
	G8gxv5NMOpcomjMRV7egQcrK9pd6UUCz4It74sOSCQLO4Ed5m1P5LAjBec92ukOAxrbkWzlG+af
	iZHXBocqCBTIFyTPAhHpiNgC47hldyANkn3p3LHRZr+ONL8PAAqn7RBgJcvaXsT+MBXshDyPqlv
	Hd6o376yv8XFFWg/Gjt0ixKgB0f0Z8Jeur68fDt5F7fUfKrWSSkCkcnfXmbo16fywDV6RFaepBj
	gX4InizPCdGxjf3nnhMWmhCZa6hp3eWwybQWf/wB9/2QNGbyMfL2izkbNCI4gxZ51qbHpRYHFu1
	nx6ZF+RakA3ahsMA==
X-Received: by 2002:a05:7301:4d0b:b0:369:f18f:3492 with SMTP id
 5a478bee46e88-38281b03d18mr6111471eec.35.1795094719830; Thu, 19 Nov 2026
 05:25:19 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119083959.1599898-1-hj351016@gmail.com> <2026111913-hulk-attempt-905f@gregkh>
In-Reply-To: <2026111913-hulk-attempt-905f@gregkh>
From: khj <hj351016@gmail.com>
Date: Thu, 19 Nov 2026 22:25:05 +0900
X-Gm-Features: Aa3M54ryYvpRhTygUp9ra3za2GRssMOntZpGUE4ymj0rS-2Zx00kGP6XapwnBzI
Message-ID: <CAGr5VtPbUdnx4UOMsikDkjVZ_kr+faLgB2suRm2XJ0oFjiTjEQ@mail.gmail.com>
Subject: Re: [PATCH] usb: usbtmc: reject a short READ_STATUS_BYTE control transfer
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guido Kiener <guido@kiener-muenchen.de>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, sorry for the noise..!

buffer[2] is only read when there's no interrupt-in endpoint, so
rejecting every short transfer would break the devices that get the
status byte from the notification instead. Dropping the patch, I don't
have the hardware to test a narrower fix.

Hyunjung

2026=EB=85=84 11=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 10:13,=
 Greg Kroah-Hartman
<gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Nov 19, 2026 at 05:39:59PM +0900, Hyunjung Ko wrote:
> > usbtmc_get_stb() asks the device for three bytes of the READ_STATUS_BYT=
E
> > response into a kmalloc()'d buffer and only checks that usb_control_msg=
()
> > did not fail:
> >
> >       buffer =3D kmalloc(8, GFP_KERNEL);
> >       ...
> >       rv =3D usb_control_msg(..., buffer, 0x03, USB_CTRL_GET_TIMEOUT);
> >       if (rv < 0)
> >               goto exit;
> >
> > usb_control_msg() returns the number of bytes actually transferred,
> > which a device is free to make shorter than the three that were
> > requested.  When the interface has no interrupt-in endpoint the status
> > byte is then taken straight from the third byte:
> >
> >       *stb =3D buffer[2];
> >
> > and the caller hands it to user space with put_user() from
> > USBTMC488_IOCTL_READ_STB and USBTMC_IOCTL_GET_SRQ_STB.  A device that
> > answers with one or two bytes - with the first byte set to
> > USBTMC_STATUS_SUCCESS so the status check passes - therefore leaks one
> > byte of uninitialised kmalloc memory to user space.  Both conditions ar=
e
> > under the device's control, since it also decides whether to expose an
> > interrupt-in endpoint.
> >
> > The same leak was fixed once before in this driver: usbtmc_ioctl_reques=
t()
> > bounds its copy_to_user() to the number of bytes usb_control_msg() repo=
rted
> > instead of the number requested.  usbtmc_get_stb() cannot be fixed that=
 way
> > because it reads a fixed offset, so reject the transfer unless all thre=
e
> > bytes arrived, matching what usbtmc488_ioctl_simple() already does for =
its
> > own one-byte request.
> >
> > The check is not limited to the branch that reads buffer[2]: buffer[0] =
is
> > consumed on both paths, so a short response leaves the status check its=
elf
> > reading uninitialised memory.  USBTMC-USB488 4.3.1 requires the three-b=
yte
> > response, so a device that sends fewer is not conforming either way.
> >
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> > Cc: stable@vger.kernel.org
>
> This is a "fun" one in that LLMs keep tripping over it, and they
> generate a patch that is usually wrong, like this one.
>
> Be very careful here, and test your changes with a real device please.
>
> thanks,
>
> greg k-h
