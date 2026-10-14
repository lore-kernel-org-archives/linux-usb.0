Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1526C35AC13
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971702; cv=none; b=roI+ioapLPr0IYyWBpu7+CVxqMspFgGl+hCp/6aIoWhYlqFP5rgU9k1vHGBuGFFNLjZKL2N0pMWoltuCWRb2ZxJV8BNXmZmHBNosWhJ/N66GKmD5QpeBaILQDeg/V3kBWEXtne3eC9M6okE4no2Mk0umEUSmYBKZUGJvMokFRCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971702; c=relaxed/simple;
	bh=UsWP33UUn0p813/KEW4ZJE7pgzlA2Khtq5ArD/OTa4U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sHg8kY3o1svUwxZ72eQiCI4om6dqtk+2CpiEd9Ztz1QnernzSZrjnnbqQ0/i9petLV3JutjMVf3XxiYN/wYKZ06d+NYdDQ8qgylOHhz/HTtN/2wk9okNEpLeJv+4hMgqfZQjNM1VbXiAg2zYXV7gmXAZAaTCjZ2qwOu2+oBzqWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGGJtX0q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGGJtX0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5271F000FF;
	Wed, 14 Oct 2026 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971700;
	bh=wpApY6QVpVBNXnerR6CPuwzN7J1eqhfRS7vVB7US6ms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gGGJtX0qTUwxeBMc49207/aM9hDR4hLzgLWVuUxo2maHoLyHG+ge+9wkw7s61BzpU
	 RaS19rFFanOXGrw3HrlXJWjeSDaawhWpmZDNRlvjgj5F3woUbxVcSDzrS2+jWB/jK4
	 C8u3lPjPsS38YdpcBggc6kbzIRSUCuamhbuSxnHq2IJIt5Gc4awNSnGfWNtJ4xLGBf
	 0xFqwu7WvnSbWdFJ2yDNdhyZHDi1hsNTeC8u72gW/Drmtqywuu/laozz6+qln2VKXT
	 lRJiljA7VPf1lT2Q+/MNIwrWbMislB8ovfidSfIQ7Wq69Hy+DJFlnrDIZvpAM22Cmp
	 VfNv28X90kepQ==
Message-ID: <sashiko-outbox-171104@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: storage: bound timeout=0 URB waits to 30s
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
References: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:55:00 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb-storage: hardcoded 30s URB timeout breaks long-running SCSI co=
mmands
--

commit e1a1498b59035fae65ddf1b4b34a943e9c28791c
Author: Hongyu Xie <xiehongyu1@kylinos.cn>

usb: storage: bound timeout=3D0 URB waits to 30s

This commit bounds timeout=3D0 URB waits in usb_stor_msg_common() to 30 sec=
onds
to prevent permanent hangs when a device stops responding mid-transfer. It
replaces MAX_SCHEDULE_TIMEOUT with a 30-second timeout, matching the SCSI
layer's default command timeout for disk and CD-ROM LUs.

> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transp=
ort.c
> index 8de3015bce050..a6588e55312c2 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c

[ ... ]

> @@ -164,7 +173,7 @@ static int usb_stor_msg_common(struct us_data *us, in=
t timeout)
>  =20
>  	/* wait for the completion of the URB */
>  	timeleft =3D wait_for_completion_interruptible_timeout(
> -			&urb_done, timeout ? : MAX_SCHEDULE_TIMEOUT);
> +			&urb_done, timeout ? : USB_STOR_URB_TIMEOUT);

[Severity: High]
Does this hardcoded 30-second timeout break legitimate long-running SCSI
commands like FORMAT UNIT or tape rewinds?

This logic unconditionally truncates unbounded transport waits to 30 second=
s,
ignoring dynamic timeouts present in us->srb->request->timeout. A BOT SCSI
command taking longer than 30 seconds could legitimately withhold the CSW
until the operation finishes.

Could this cause usb_stor_msg_common() to kill the URB and return
USB_STOR_XFER_ERROR before the SCSI layer's own command timeout (which could
be hours) expires?

>  =20
>  	clear_bit(US_FLIDX_URB_ACTIVE, &us->dflags);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014093856.4158=
12-1-xiehongyu1@kylinos.cn?part=3D1
