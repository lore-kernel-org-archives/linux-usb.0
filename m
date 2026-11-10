Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293153;
	b=NP0bTMee0nITjAF9m1s6Yi2csujiNICb9WUng/lnbU5HSTXb0lQA/ovT+/zIRZ4XDZnV
	 wIb6l8YE23U4sJcgmgS/csx3nUwwjLqD1KTijFRccYbBlL3lFoZJxRWtXwD6nuugi4pDk
	 iNnbFbHI5vIfjcvNJHDPmuvSwtFQH3waxbU+e5fFandg76tqgyijnbBrvuT1IJfNDQl6h
	 ibBxx12wZO2VmyLOImcQMzU3dfNWhHYAvvuHQJsz//2fAoavp2CiM7KdEsAMbVW5Do3tC
	 UxHAS+iUoPemtGT+p8ZSh6q4PMGPFp8pMKuZFPne4L34RGdFgzPMDPlOgGtdGLwqbNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UCUohQmjj94i3sQRDnNbU0PyB3JUGH++RfhpldVEfUM=;
	b=qMSC0IRbfOhxxNlp+l+yQZFg5vFHmpfvoHLBdXkmMln/7Nt27pMELEBAGiU9263O6c7j
	 7FSO0yF5GkOiyQBSUkh7KHdcrs8oLUuV+sxe4RZp6+95IOYP6RbhmVRhTMLpiKmVQxnqZ
	 v7Okrv1J5adpNk2mDqQZ9fEu0tT3c1+CzYd+51EdB61sUHIE1YVdrVw34vXoYh8+bzGmi
	 Ylp/sFTeMOqMSQcXfONwwvquEx2sLZS/vtBqfXNQ0WvHg2OfePDPslrrQO4UkI5J2DLC0
	 hRGKsyt+k0IbcmvBjtKTYMWSEwukSLaxBcfB/RBjTubNSG5gq0y4WPo6cbbLZ0uiVvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7kByG1T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274BA606A656
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7kByG1T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DC71F0089F;
	Tue, 10 Nov 2026 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293152;
	bh=UCUohQmjj94i3sQRDnNbU0PyB3JUGH++RfhpldVEfUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y7kByG1TrpX9Sa74UeGzJITovXum5ur0M+zm47Pfg8KakafJTceVDOJe/BctN16Xb
	 Uai6IpOgTY6IZVulPYd1jw8Ov8X4SkKRJOe1giPjSfBdhFfQqvBMjx4+Isn2JUjk6f
	 pqYi6dbnEX8r6QNd3znFwWStmTZobDKxnb14Ei9RAWwRNeq0xogmwsEMgVdTM+i2G7
	 /Q/8cX9RW92ityk/XPyN91EM3TevH7rVuLbxFmK98y8BK3NNeYUH0BQ3/SHXcnciTJ
	 xyvzho9tWALWBYviqEGFvgWEccSTBTLRWVK4aYT/ReY1+6Cf9VVcDAV1xe1IFAoy7r
	 rASl/nZGEkjvw==
Message-ID: <sashiko-outbox-206442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/22] usb: misc: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-15-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-15-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:45:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] usb: misc: emi26: infinite loop in emi26_load_firmware() [1]
--

commit dcf01fbf19632d3a153a43eecd101490f0323a24
Author: Shunbo Shi <shishunbo@cmss.chinamobile.com>

usb: misc: fix a few spelling mistakes in comments

This commit fixes spelling mistakes in comments in the emi26, emi62, and
ldusb drivers.

> diff --git a/drivers/usb/misc/emi26.c b/drivers/usb/misc/emi26.c
> index 24d841850e056..a0fd800820438 100644
> --- a/drivers/usb/misc/emi26.c
> +++ b/drivers/usb/misc/emi26.c
> @@ -198,7 +198,7 @@ static int emi26_load_firmware (struct usb_device *de=
v)
>  		goto wraperr;
>  	msleep(250);	/* let device settle */
> =20
> -	/* return 1 to fail the driver inialization
> +	/* return 1 to fail the driver initialization
>  	 * and give real driver change to load */
>  	err =3D 1;
> =20
> diff --git a/drivers/usb/misc/emi62.c b/drivers/usb/misc/emi62.c
> index 3eea60437f567..d29b5312f6270 100644
> --- a/drivers/usb/misc/emi62.c
> +++ b/drivers/usb/misc/emi62.c
> @@ -211,7 +211,7 @@ static int emi62_load_firmware (struct usb_device *de=
v)
> =20
>  	kfree(buf);
> =20
> -	/* return 1 to fail the driver inialization
> +	/* return 1 to fail the driver initialization
>  	 * and give real driver change to load */
>  	return 1;

[Severity: High]
This problem wasn't introduced by this patch, but can emi26_load_firmware()
and emi62_load_firmware() enter an infinite loop [1] if a bitstream_fw
ihex record has a length of at least FW_LOAD_SIZE (1023)?

drivers/usb/misc/emi26.c:emi26_load_firmware() {
	...
	rec =3D (const struct ihex_binrec *)bitstream_fw->data;
	do {
		i =3D 0;
		addr =3D be32_to_cpu(rec->addr);

		/* intel hex records are terminated with type 0 element */
		while (rec && (i + be16_to_cpu(rec->len) < FW_LOAD_SIZE)) {
			memcpy(buf + i, rec->data, be16_to_cpu(rec->len));
			i +=3D be16_to_cpu(rec->len);
			rec =3D ihex_next_binrec(rec);
		}
		err =3D emi26_writememory(dev, addr, buf, i, ANCHOR_LOAD_FPGA);
		if (err < 0)
			goto wraperr;
	} while (rec);
	...
}

When be16_to_cpu(rec->len) >=3D FW_LOAD_SIZE, the inner while loop does not
execute even with i =3D=3D 0 and leaves rec unchanged, so the outer do-while
loop repeatedly issues a 0-byte write and spins forever during probe.

[1] https://sashiko.dev/#/bug/linux-c69bd064-7969-4899-86f0-dc199358fd96

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D14
