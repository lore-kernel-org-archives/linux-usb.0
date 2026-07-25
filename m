Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACDD2AEE1
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784990981; cv=pass; b=PMjUVxqrYe7n0uXW82smo7GA2eI9vaYf8ebZN1dtCIeFkwc0par/UrbxLtTOrtNQ7mWCWkrUuaqYC9FyAnVu7mmLPUvIxTGwdJwkH9ndKCJMu40GJcJmqk9hgpRr07/p6/dgMWdn8Dl26dowLv/d53fjlPN8itI4lm/uAEJKiaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784990981; c=relaxed/simple;
	bh=PdFdwp2i+jLAJ8UTMabjWuH2CxAyO2fjSUEhLabgj+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuYTwQZ0b27D2aYwxbJ85ROwM5SyYCdjr+GKjJ62NiALlQDQy6tY/NEB349wHIiAu4YtGXMghPoxXVHCZZNc3MXVTvaTpd+4zeXUxcALnvW42zAIhNijtedmr0O7ztvkty75isP4Qa96YHhnLm/H5vEog4PoO2BKIYz9/lpr2y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWz9/Bfs; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWz9/Bfs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e2dab83eso220220166b.1
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 07:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784990978; cv=none;
        d=google.com; s=arc-20260327;
        b=YMDhX8QoKeqZpHoTPN1nBrlaCOS6WZkFqzxXoRD8ng/ilFcGmOzdxfDUrdJ1ytUSt3
         sInN+0C914aOkSJLqL7Oy+0Z+KS4Ic5pVqlZCI4rs5zW0datqu/U/qGcT/Pe9HuBBpE8
         e8wh0M1EQ3oADfu5Jx4MvEE8VrzrS8nNaoq+22sLZhxpjh0BulrNOXiDohhGJCK2DNIl
         F7UpFXmFopTXBSC4S0a86k7jDjjyeecyBaAVFkwbwY+Qj8SOjOksktYQixjvumpudkP9
         8ytGMicMqp4TrqN0jhGUjtwaQtY46mSM/bOa3221W52hnkOl2dJbqOZBVD4LJ+0CDBsz
         KFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KaJqioGOibWuDzoAQ+ZR6ELpOOYcjKkCoHAQzOj15AE=;
        fh=D2+QETd9AyAlE09iTfjayQsxLtb9WvsVm0aQfOA5rU0=;
        b=NXztpoXNzolovMmydI4AG1pAvt9ldTbcPGOvhvL5iADQZazVFOcyYumNA2FCtoVysm
         NOT/lHO5tDQ+FMy7Afut9xf/nlag6KV2EtV6QEuLp29lVzgMgWHmu4eiuZC+LQcDI9Ea
         8Xzr4Y5aMvuaiZw79N+UdBR5/9/Rbj0RDzgFWCBA5vGmuqHrDoEaEjkljFkhX+Y1p+Mf
         wQm2koxDVMoH9jf4nIBz5FP0NOTmj/x8nwynyiGsqHo9YRD2tKD3BjhsJ727FtocjaEW
         IRNizeUCnhtf4C4YZQJy/lYanw6mGNEGaaSHBIV160eMEZc9hv2uyzIZIlz847/5968A
         Gvmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784990978; x=1785595778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KaJqioGOibWuDzoAQ+ZR6ELpOOYcjKkCoHAQzOj15AE=;
        b=cWz9/BfsqQGezvUEnWSEIUbA7TU3/Y9dBb+RQBQGzWS3uQ+8jk7z5vQiN3l+vj6wpy
         RLiW/blDHDo1dpJ/OWT5Z3USvcpFzofohqPDyD02ZQZaUSM+uPNMd6TMZcwxvk5rCZ4S
         tMT/p0lgFQfiiV4u0jFb0x/h6sS4/QCzQ57JLxguF/uPCyliLZgmCRRnMV5yOBEbO9Hm
         tMol5kLVs40dMCHIeJbsDtN89tv1kxSW/dDwLMFqx56c/5zPt6ecJpkO01ByPUhAXKta
         HdJUF8x7OJJeuK/FWqhOSo0o65R+0Ym/aU2zsiyReN+rqzJIJeU4KJDbjB90f48rs8CO
         EpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784990978; x=1785595778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaJqioGOibWuDzoAQ+ZR6ELpOOYcjKkCoHAQzOj15AE=;
        b=ZjGURBcT1GeaBQPAtEUG5QwcDLb7EvosXCCstC2KvpiRty+lXfpnoaeNwQ+j34Mffs
         F7XOWm/27/hW7d05G//Jf1Ra7/ny8P36ktbS1JsCEHcFtOtLzwGIkjL7+CsKOUoIOrjL
         nhO9fX87SzhpvaEIJIjI0Mt5R7dS8CO3De7XZ5I18B2xFlJ2ZR4Hhw/0ndDWYzteu2Y8
         Jz7BgiqmdY8OBzKkIOQ79hvEbFR27OWAn6O/x84W8aduOKri9XSjI4sfEvoZr59jicN6
         vrY2M+c7J+BB56tphUocyCb8rSpjHjjUOrK5UqKZ3uOXPcT7fmdvtHXEHax4pMJL2oqg
         OsPg==
X-Forwarded-Encrypted: i=1; AHgh+RpU5x1YH8P4wYBrEsnTzmZzblFvY/ZfmYxvB7kaOh3sjLdmblUy3lB4onMnsPyKgjV86QO0eQ87V38=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfX2werj35QjUxjBtEauFqpzz65WmaLmCL9tDdZD+prg8ps5z2
	oOImAeSPz3IufkrVl0IjXNO3OTsqQtm1cjATpOn3I2hAlCH43B3dTI7Mu6SMGWb3oCIkVcEO0/t
	U5KinAeiVWvxi26A7Yv7dnyCpBk7lT78=
X-Gm-Gg: AR+sD12fGudw8cJIdUYamdVQYu2zKtFgGUFmlcdRsPJdKRhhE54OIiBSq620DK7+mrJ
	ERSlrONR+la+qeKtmV/ITuDnaGcrfEnhhBoJ2P5nK8wZmi2v4nmEnw8RCMcQqMwbmQbhKmCOuLL
	0xTcg7E5MkWaXe/KTxaVbVjSdZ/agGSo+vfHwJuGNoCIxS9A8gqpgzPs9F7z9I63HpfeMMrxvnl
	AKQr6EY/vAdEmCPebKj4BOPUeqFWNChM0jZspSm31iotGSY4sSOcm0KsISU4z0=
X-Received: by 2002:a17:907:9709:b0:c12:6c88:bb33 with SMTP id
 a640c23a62f3a-c1f1f596e73mr97184966b.65.1784990978271; Sat, 25 Jul 2026
 07:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>
 <2026072535-uncork-gonad-4187@gregkh>
In-Reply-To: <2026072535-uncork-gonad-4187@gregkh>
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Date: Sat, 25 Jul 2026 20:19:21 +0530
X-Gm-Features: AUfX_mywaVnp6qu8-sl9x7XfNhuLDz_o3eSrfenaQHfIcw60XuZm7iF8PHmBQ0Q
Message-ID: <CAG0uPa8qSkQjesAmcfms7Va2j0yb3VDuES5TYe=65LXFn0qKJQ@mail.gmail.com>
Subject: Re: [PATCH] usb: core: quirks: Add 255-bytes initial config read quirk
To: Greg KH <gregkh@linuxfoundation.org>
Cc: nikhilsolanke5@gmail.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Here is the follow-on patch adding the ShanWan Wireless Gamepad (2563:0575)
to the static quirks table.

Note: This patch depends on the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag
introduced in Nikhil Solanke's pending patch:
https://lore.kernel.org/linux-usb/20260717195336.98500-2-nikhilsolanke5@gma=
il.com/

Thanks,
Ishaan

---

From ecd1aa9afd8bc00a3e0b36cbe49b427f390e5de6 Mon Sep 17 00:00:00 2001
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Date: Sat, 25 Jul 2026 20:03:28 +0530
Subject: [PATCH] usb: quirks: Add ShanWan gamepad to quirk list

The ShanWan Wireless Gamepad (dongle ID 2563:0575) crashes with a -71
EPROTO error during standard enumeration because it expects a 255-byte
initial configuration request. Add this device to the quirk list to
use the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag.

Signed-off-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87ee2d938..696bb6548 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -588,6 +588,9 @@ static const struct usb_device_id usb_quirk_list[] =3D =
{
  { USB_DEVICE(0x2386, 0x3119), .driver_info =3D USB_QUIRK_NO_LPM },

  { USB_DEVICE(0x2386, 0x350e), .driver_info =3D USB_QUIRK_NO_LPM },
+
+ /* ShanWan Wireless Gamepad */
+ { USB_DEVICE(0x2563, 0x0575), .driver_info =3D
USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },

  /* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
  { USB_DEVICE(0x2b89, 0x5871), .driver_info =3D USB_QUIRK_NO_BOS },
--=20
2.34.1

On Sat, Jul 25, 2026 at 10:53=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sat, Jul 25, 2026 at 10:35:47AM +0530, Ishaan Dandekar wrote:
> > Hi Nikhil,
> >
> > Thank you for this patch. I can confirm this exact 255-byte config
> > read issue also affects the ShanWan Wireless Gamepad (dongle ID
> > 2563:0575). Standard enumeration causes a -71 EPROTO crash and drops
> > it into a generic Android mode.
> >
> > Your logic prevents the firmware crash.
> >
> > Tested-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> >
> > Could you please fold the following device ID into your quirks list for=
 v2?
> >
> > /* ShanWan Wireless Gamepad */
> > { USB_DEVICE(0x2563, 0x0575), .driver_info =3D
> > USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
>
> Just send a follow-on patch for this device so you can get credit for
> the change?
>
> thanks,
>
> greg k-h
