Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278381;
	b=Vtvdxj05sUHLENIn84k7R+6W/vsI6Y9woi3+4DGpecXa1JByICy7cEZbqKTj+khaqEZ4
	 kCnUWhBk0KBdx76hv8wcHGim0/5z9sW2z4UWzeF6KMY1Vq6Lp5mRByyVNg01n4HpajTJm
	 hxr4728K7UaV21WTS5owI1SaB/srUdLxbU+y0ZSTbpGZuqpCYgRMBm5lGwG4aeDTDYfxb
	 dUP0yDUn1cBKiLYtCgvLGiI/BRcLbE7Yn6whSGF+PtXJULNp2to94bvtktUNXa7j1CX9k
	 4vvbod1QfDjkyIQ8ppWvYCHj8UNJ631zypXDgn0LKi+YqJZiX8pDYysZhTN0AWMPMUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LtQspEZWVOuLyX7M7T1n6/syrpSHBsg6kZa/NVdSYPU=;
	b=Jk6Ln29EdbWJ3ef8IycBeAe5I09m/x20oAYmTIxN94gw3JLL7iFwie24XhrSZdpFRl2/
	 caHtG01mWCT64AwfABG+IJi9AydnyvJraFad7XmoQu5RWPNbcbJf/NNvnlNWhZLv6DZ7y
	 ztqE+/GvH+eCy5V/JE6lMteK2RttzjMJBxWnNFUqqx8MY4ih+2U2A7QMuvG4rhDWkxNhI
	 tQTAKw4UTcYXwwrlrl5m2CoeLk3chE487fpev0L+qU8BB9HIXj+hO5ayOTR1S6upK6ggZ
	 P4HB1/IwlLOYhOKpV4aFzwqGX/tQszKIYL2JNIkwr13zZ6uPqTmWmranneH7Cv3AclA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LP0bIIXQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75181606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LP0bIIXQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181091F01825;
	Thu, 29 Oct 2026 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793278381;
	bh=LtQspEZWVOuLyX7M7T1n6/syrpSHBsg6kZa/NVdSYPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LP0bIIXQylbLWrNDmLCd1r+NXsSp3II7DYhwibFNUNvTkyARL4I6ikz3mSHe5KTy3
	 yKs1hgPMxe/u2ya9v8tX07HkW+PCt3BNfSYaUddFcwrEGQ0ToMct5BcJdcwOX2ZFpS
	 dTib/KlEYQlLFzS2S2m+QJ10mwu5GWTpuTv+2zNbr5WfAOfjuSf6bh7vAhgwNEi9LH
	 Sw5VmTIrY72GylGNnFuqpBB3TyzlJEfMSMlluVODmaHPx9ggF4DWvsuUD2c8T1T65Y
	 R5GHWOtHZltJY5OI3Zl1bxHdy4rDoFr0PESQ7Ujepgg26tGshejLHh0cKGkIOQkpOC
	 V+iuWlKZvjlVA==
Message-ID: <sashiko-outbox-189323@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: usbsevseg: cleanup sysfs show handlers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029124716.611540-1-dmantipov@yandex.ru>
References: <20261029124716.611540-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 12:53:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: usbsevseg: off-by-one in textmode_show() emits trailing NUL=
 byte
--

commit a74c1b2c71cf0a70caf0b902cff95d63b0e182d0
Author: Dmitry Antipov <dmantipov@yandex.ru>

USB: usbsevseg: cleanup sysfs show handlers

This commit replaces sprintf() and strcat() calls in usbsevseg sysfs show
handlers with sysfs_emit() and sysfs_emit_at().

> diff --git a/drivers/usb/misc/usbsevseg.c b/drivers/usb/misc/usbsevseg.c
> index 89d25fcef6424..f456a7161a260 100644
> --- a/drivers/usb/misc/usbsevseg.c
> +++ b/drivers/usb/misc/usbsevseg.c

[ ... ]

> @@ -246,25 +246,19 @@ static ssize_t textmode_show(struct device *dev,
>  {
>  	struct usb_interface *intf =3D to_usb_interface(dev);
>  	struct usb_sevsegdev *mydev =3D usb_get_intfdata(intf);
> -	int i;
> -
> -	buf[0] =3D 0;
> +	int i, ret =3D 0;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(display_textmodes); i++) {
> -		if (mydev->textmode =3D=3D i) {
> -			strcat(buf, " [");
> -			strcat(buf, display_textmodes[i]);
> -			strcat(buf, "] ");
> -		} else {
> -			strcat(buf, " ");
> -			strcat(buf, display_textmodes[i]);
> -			strcat(buf, " ");
> -		}
> +		if (mydev->textmode =3D=3D i)
> +			ret +=3D sysfs_emit_at(buf, ret, " [%s] ",
> +					     display_textmodes[i]);
> +		else
> +			ret +=3D sysfs_emit_at(buf, ret, " %s ",
> +					     display_textmodes[i]);
>  	}
> -	strcat(buf, "\n");
> -
> =20
> -	return strlen(buf);
> +	ret +=3D sysfs_emit_at(buf, ret - 1, "\n");
> +	return ret;

[Severity: Medium]
Does passing ret - 1 to sysfs_emit_at() while still adding its return value
to ret cause textmode_show() in drivers/usb/misc/usbsevseg.c to include a
trailing NUL byte in the output returned to userspace when reading the
textmode sysfs attribute?

At the end of the loop, buf[0 .. ret - 1] holds the formatted string with a
trailing space at buf[ret - 1] and a NUL terminator at buf[ret]. Calling
sysfs_emit_at(buf, ret - 1, "\n") overwrites the space at buf[ret - 1] with
a newline, writes the NUL terminator at buf[ret], and returns 1.

Adding that return value to ret increments ret to strlen(buf) + 1. When
sysfs_kf_seq_show() in fs/sysfs/file.c calls seq_commit(sf, count) with that
returned count, the NUL byte at buf[ret - 1] is committed into the seq_file
buffer and exposed to userspace.

Should this either pass ret instead of ret - 1 to preserve the original
trailing space before the newline, or avoid incrementing ret if overwriting
the trailing space was intentional?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029124716.6115=
40-1-dmantipov@yandex.ru?part=3D1
