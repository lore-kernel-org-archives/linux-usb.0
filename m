Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B3233345A
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702551; cv=none; b=E6/WA1ovxb/ztVoHWpflSGt7G+Nnkq2CbX1w4qhh9sLkbRyl1d6zf+8SpauJ/5CcTpw5HB/Xh+xmB7Hh+fn3wtu93FmJu4c3F0shF8pdq052kjjTBjh2qae7xA5MrYb7W2Uj+Z8uM+N8OMx2gHkLlHDHiRZYAhwhUiHuFMgtw2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702551; c=relaxed/simple;
	bh=hU6z7tDH/RIBfFMVZ0vmIWyj2jSjD8asNjxERxcj6Mc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ON4eU6FjDjaPv/soux+QC+4tH5SgYPjWBl/sCDo86KYuSc3SExXHHn2NSsQM71AddTIdzHRqVhnZCEslJ39XcJiRsd2kpDR5yI8uqQpmWM4KMPTCSFSSJd+lxULqb3SjJFzPDnViXlIp3dLG9WDDDxMbpCDQZPl0AvOJIgIg3l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3Tzf7zB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3Tzf7zB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49544f26c43so1548545e9.0
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702548; x=1786307348; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQQf06IDZFsoJ7D/EZprq+pM+J9k2ih+aOiCkbV2M8U=;
        b=R3Tzf7zBNVGilplnVjgsxLFzZb+C7Q9IFODerqnXInvoml2ncK0nLnFQGZ0o9Ggd/Q
         +C5XjC8XX6T5RRjsS7JJ0pSBpuJf/6ZnvGlAOyyrPQ+8/6ohi+KOsllC4na4hu0REl7l
         1BmcneSw4k7CPOW9VnpUISywgvoFPgzYsXZLFfC/j64dcp3icxmyc1wMouBD2EGMt50v
         4jDFEbWcc1P1SQY7AZxyr6mSO/DBRfhayPBt212E4aB5Bt7W3cVmX5fO7lbcy30JFRFk
         SBR1CvmIOpbtF5Ig4LI3/J8XbIgirdit+W2I2lBRH6mNUYFT3dGeqVFJQUGS0+spl5S1
         MU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702548; x=1786307348;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQQf06IDZFsoJ7D/EZprq+pM+J9k2ih+aOiCkbV2M8U=;
        b=FMoJvIYV9t/lnEPDf5S8f5gT5yhA0ThJAS+XnswFfGuolviS0xhPnevo5tLw8xglTC
         BTc91xbLQ5szlz/avKiLzTmDXeHDh0Srdcblo0yIpTLe3j/CwI1s5r4PVV5W0XioSGQr
         0+7YWME2d9yq+LDYfaqPhWNwF2y7gB8NFxCLQivhjVghL2BpPwhpMr6S2/+nwyP6mZY6
         BDJ+tYojBF7XyTJOoRP1h35nxAQkVILXLBv/Kimi5YSCKpaXJY40PUbI6O57rSXPZ1qL
         gP8lQoTcKi/6Poo5lLsD6/GssOhL4PeyIcPP6oSlnG8zHVogkLTANpCYlT+Um1es1yAP
         EQNg==
X-Forwarded-Encrypted: i=1; AHgh+RqOqsuuj07b4h+18KqqMV+5LCc/YptWKBrPe7E1nHBiAP0/wVKVYsjG7qjkMESS2mmutI3cV83EA0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBacDhR0FtjebzVgqDZHTgmDld1r5rYz3N7bCAwAncwUrIygy0
	TnGMq2GmrYKM0SaafVrLzdGuGRtFIb5KKpPT5fkZeDX5a5oNkzEtnn2s
X-Gm-Gg: AR+sD11feRfPd1kgRCdZaltFZAibjBTqidd4CheH3WOP9wwPCvgGVvcV84fmUQOGYVE
	stf43e0qgl0jV6ri8AzsXP4qLpI2kzwYu+tAmpUyBXYVjfbo9w3wCLjyLudb5eMsPcH/m6+1HD3
	JptKnhdvUXL2O4MJIxG6GqTlWrRyJFDtmM+b32ECKBe48b3Mcdoa1YrR8dBSRlVvTLtfsT1VT0O
	XGl4QdRUwMbNWmZh/me0zDYNIuFXgMtJY+KxuQXea27O9rhO8/zYP/mFkNvxS67xGeJWoCX29Il
	Bu+Yo6/10/v0KfIfk/G6rL+Lt1HZtRFn+zTX+pKxJrSFjOsCm12XeoypDcXAHo/+5gWwEydBbH0
	CzCNogvZ/2LvChZFLFe/U+cneur95jbiJFERO91zyi2V0SaoqOICTRv9A0TDdf38078JYPeCqrO
	N3lsFRUW3yw6sTMD5ZgPYOj11Z/X808xfnr1+j07lIOSDGNdGqj3XmODdFW1eAMVuSjyQyLBLVu
	0Vg/jl4Vt1CGbBfh5VyGKPQ69b47CofyPc4D/Oa3Fzm9MFr
X-Received: by 2002:a05:600c:1d21:b0:495:6713:9ae2 with SMTP id 5b1f17b1804b1-4980c66d99bmr96563135e9.1.1785702547947;
        Sun, 02 Aug 2026 13:29:07 -0700 (PDT)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm158560585e9.4.2026.08.02.13.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:29:07 -0700 (PDT)
Message-ID: <5ca2e1c1eb36880a0686682588dcb2b6799121ff.camel@gmail.com>
Subject: Re: [PATCH] HID: pidff: fix OOB write when hid->inputs is empty
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Baul Lee <baul.lee@xbow.com>, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oleg@makarenk.ooo, jikos@kernel.org, bentiss@kernel.org, 
	federico.kirschbaum@xbow.com
Date: Sun, 02 Aug 2026 22:29:06 +0200
In-Reply-To: <20260726062503.43717-1-baul.lee@xbow.com>
References: <20260726062503.43717-1-baul.lee@xbow.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-26 at 15:25 +0900, Baul Lee wrote:
> hid_pidff_init_with_quirks() derives its input_dev from
>=20
> 	list_entry(hid->inputs.next, struct hid_input, list)
>=20
> without first checking that hid->inputs is non-empty.  The list member
> of struct hid_input is at offset 0, so on an empty list list_entry()
> yields &hid->inputs itself and the following hidinput->input load reads
> an unrelated member of struct hid_device.  dev is then a type-confused
> pointer, and force-feedback init writes through it: each
> set_bit(FF_*, dev->ffbit) stores 8 bytes at dev + 192, past the end of
> the object dev actually aliases, and input_ff_create() adds further
> writes of a heap pointer and two function pointers.
>=20
> Until hid-universal-pidff the only caller was hid_pidff_init() from
> usbhid, which runs under HID_CLAIMED_INPUT and therefore always has at
> least one hid_input.  universal_pidff_probe() starts the device with
> HID_CONNECT_DEFAULT & ~HID_CONNECT_FF and then calls
> hid_pidff_init_with_quirks() directly whenever the descriptor carries a
> PID usage page, bypassing that gate.  A report descriptor whose only
> application collection is on HID_UP_PID leaves hid->inputs empty while
> hid_connect() still succeeds through the hidraw claim, so probe reaches
> the unguarded list_entry().
>=20
> The write happens in the USB probe path, on the hotplug workqueue, so
> plugging in a malicious device is enough to trigger it; no attacker
> software and no logged-in user are required.  KASAN reports an 8-byte
> out-of-bounds write in hid_pidff_init_with_quirks() reached from
> universal_pidff_probe().
>=20
> Check for an empty list before deriving dev and return -ENODEV, as the
> other HID force-feedback drivers already do.  universal_pidff_probe()
> propagates the error and unwinds.
>=20
> Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>
>=20
> Fixes: f06bf8d94fff ("HID: Add hid-universal-pidff driver and supported d=
evice ids")
> Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
> Reported-by: Baul Lee <baul.lee@xbow.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Baul Lee <baul.lee@xbow.com>
> ---
>  drivers/hid/usbhid/hid-pidff.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 5f4395f7c645..22951b7ecd17 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -1539,13 +1539,20 @@ static int pidff_check_autocenter(struct pidff_de=
vice *pidff,
>  int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirk=
s)
>  {
>  	struct pidff_device *pidff;
> -	struct hid_input *hidinput =3D
> -		list_entry(hid->inputs.next, struct hid_input, list);
> -	struct input_dev *dev =3D hidinput->input;
> +	struct hid_input *hidinput;
> +	struct input_dev *dev;
>  	struct ff_device *ff;
>  	int max_effects;
>  	int error;
> =20
> +	if (list_empty(&hid->inputs)) {
> +		hid_err(hid, "no inputs found\n");
> +		return -ENODEV;
> +	}
> +
> +	hidinput =3D list_first_entry(&hid->inputs, struct hid_input, list);
> +	dev =3D hidinput->input;
> +
>  	hid_dbg(hid, "starting pid init\n");
> =20
>  	if (list_empty(&hid->report_enum[HID_OUTPUT_REPORT].report_list)) {

Looks good, doesn't break anything and will help in such scenario.
Thanks!
--=20
Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
