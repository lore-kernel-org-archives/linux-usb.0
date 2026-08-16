Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AEE3C3F73
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 01:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786845483; cv=pass; b=bNu+h9mRCejO8IaypBzwjHZHUbZaPiZrORXIq1n0j8ejLczssbIsdpk6YMEP/QOpVeigNW7ugdk6T4t/Nzo9/7gP9y338GwOx+DTVnOxx7eT9z1a321rKnmYMwBuVrq4qABJGxOR2ORJrMnEyjNXu12FG5EW4CvDgJm1Luurz2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786845483; c=relaxed/simple;
	bh=eoTJI5GtBl1LvqsItHuGnnljdus7atzDA9aOGd8cxls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exl7mOY22wdRIh/E/yqt4ew/rHIrTWuOMJO4e5GDDZuuuXdKMNTD2SQSQAO7w7XFdqW1fN1oZoScz4DfY3qJx80x9mQ+J8t2ragNFWXphfYHsDMfdkNbzFuzdxqFDRw74l8iRTp2k/OnXhf8aAWaijZeAuvBRzOzeeWlYix75Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvnCoODD; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvnCoODD"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66c744a00edso1445899d50.2
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 18:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786845480; cv=none;
        d=google.com; s=arc-20260327;
        b=T+E7y0djMJpi7+uAIe/gk65vrRTHCK2fK0b4sicxC2aNDUx0P+S4+CQ2O3+bykb++I
         S/5feZV5oMwPzjctB01DK1efJn1Gky4xlzNQUcBA6v27bvrKkL2X0BWRQUaNDAFQVSWP
         f4t23re8afX0Qhi3P+uzb46Lphv6sg1NWxym1PDPp1ksMoL82FXcNAEwozT8lYZRRROc
         exCxT+r6EU8pkBGSrB8PnqiMgV6fZqaLBpo9hUisJY6MZoBCAajDILFD4c1bljGuY+L2
         SUzn/XfDUouGzsB80z4ke6Ac399qEopPi8S8lNB8/hQWHw7cTIqwv6YeP63ZbAOI0Azk
         6ZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FnArm17FHg7/9jV84208TMZ3KVMTcZQRk/VUdbBM0oo=;
        fh=VwzWiqbmMbG1z7sLuCqBJQ9dFYLLloMMvRJ1sVaI+24=;
        b=GtDz60e5hEW0K5zARSF+b5vicPfTOVKa7QZL7zfRq0ORZjpj1PvB6MEzhNfGZ4E6uU
         UKc+PPzKi41tVSuEaOAJn1uNU0f2B0ZGn1Crwk6K444S3HsIl4aZOINr6CsmXXyl/WAq
         DFH6nGG0O9CYCIP7qU55ksUTOifuGn84qnzFBweIgxp2WP59Lbzfj/CySAjXZLEKEEzA
         8Rplv9s7lle7tEgQU0wtftjoXdsu+Fpg3lGg57z65qBfBGU2TenVbkOfQvCtfDfxYR2G
         XOZHwckCco47UcTM62vzT3Jk6Z3d55WP5SWN1Wc/NLrhKxOi16U2r84SGjjX/bwZfXuX
         8LKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786845480; x=1787450280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnArm17FHg7/9jV84208TMZ3KVMTcZQRk/VUdbBM0oo=;
        b=HvnCoODDS3JcI1BhejSBSbgUDqaEf3bRjv888MapMOzIRzujNxsNEkEzwS32WUImYM
         PnWDQalz3Yf4OQTFKEjtLcu3KvWl3XWD0KF8fIAe0ryosK20CwhCOuX98fjhdij4sYYz
         0ma13sRAElbtafNZaWsj1k1cgWnXgm0eqzAxBn9boJA8LjEyJVRp5hnXNWahZOe8dpRw
         7dyr0uQPqvPqSm91yEn9gGm68Pf5RYpBiMFkQkckPtjZgkUrQdvcdvpF2PXBI5Ye/Pjj
         vrqoU7yNYe08+BLOseEkJbG6TwbvW71L6r+ZDlK0nu3xk0guhSJJHZdGdF8Mar6iBIXp
         muHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786845480; x=1787450280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnArm17FHg7/9jV84208TMZ3KVMTcZQRk/VUdbBM0oo=;
        b=ET/jlSudUTXAk21kfuOLFHg/eXAarjVaUZb3+Li5dgZ8tyuc3DZS3agSO/XfNesCNu
         /TRKL6dOYdV5EIB6aO/UjmKcEeeNsme6fXosc1zbJYEM3iHjdDMZQfsx+P0KCHsa/eEK
         4D+20alde0n0n0tEJz1Bdr8qp3QspZ0KePP259TL5rbfy3Ku3I5pG0oViNI+lpStSZMP
         BzwMovTG4uAs6jHVMUNkt1cTtTNTsl6kGOY9dv1quvr/rnU1HvLZem9ulyHmcJ2LpC0Q
         RQydFzJ9dITAPsc/v6mjUcW3NbHHgrgQk9X5Hk3FhzUGk9S6KLhve/oWqJFfWDFhm7Sc
         pZng==
X-Forwarded-Encrypted: i=1; AHgh+RpGphCAyxwSKpdymQ14F/VatXDfsVix4E8G8Hfa6tXT3aCQDtuk3uR4krOoP0bbqaIGJFrpHIQVnFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJ5hE9sTxrsJEiCpGWAIRB+IF6dQh530TMsIWeRRq5KfkKQ4G
	4KZjIf5/7ksgPauUWlcYG85uutwAD8VjPWbjxSzGXtOgfM8mDx3TGGx0JA2Dp4ITG4lYewviW5s
	R1xPb+pkHgnveQS6cteznEk3xukqLpnivySzC
X-Gm-Gg: AR+sD10uNLFlDdTziw7uLrIn024f/XLGN+eqbxIDRKFevlfEzPZ0l1OlygVQ6nJdDRU
	rcAGopIf836dgMwF5JAiKRwOZxdThB+ajG0bysNlwBcdoGuMueZJR8XKQHrKxXCVs1IxDIxnxD/
	cTYbgnM3FFHHakkNk7GK0g7H/2SpE2hmqASX/gJLs1mIhO3HzG6w6Lg8f6lcQh4BDWG8RvxhtmN
	k7Nclsutjj47dziBIZV12D26q7MQDj2CTEyBA/mFLUTxgw+ib5urxDt1+yBANXxvVQdnzMI9hzP
	7ppuOetOnkJQoAb2/4yQFXyNs2ycVVVG5UDBdNFEzBWPdBLfbd/zJ3NLZBMJzaEqzeTQ/be+VTo
	TNYX7LicAGG/6bk5tTwqbTV41Kc1Y4dxYew==
X-Received: by 2002:a05:690e:4506:10b0:66c:85e3:7f44 with SMTP id
 956f58d0204a3-66c85e39545mr2577903d50.52.1786845480066; Sat, 15 Aug 2026
 18:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815143427.19066-1-kartikey406@gmail.com> <2026081618-october-hungry-39a0@gregkh>
In-Reply-To: <2026081618-october-hungry-39a0@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 16 Aug 2026 07:27:48 +0530
X-Gm-Features: AcwNN1XEWQFPqolsZUFhegW3jhInnD3EBNU5IJFvTDGzBflKeaka-XCTJfWngPI
Message-ID: <CADhLXY6zru8nJcv5aXGpswc-tyFJkXz2W=Kta7v=OgdzW=G8ow@mail.gmail.com>
Subject: Re: [PATCH] usbip: vhci_hcd: move sysfs attribute setup into probe/remove
To: Greg KH <gregkh@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 9:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> If you are going to move the creation, please do so in a race-free way
> and properly make the driver core control this by setting these up as
> default attributes.
>

v2 does this - the group is now registered as dev_groups on the platform
driver, so the core creates the files before probe and removes them after
remove returns.  Both sysfs_create_group() and sysfs_remove_group() are
gone from the driver.

The attributes have only ever been created on vhci_hcd.0, even though the
driver binds to one device per controller, so an is_visible() callback
keeps them there rather than changing what userspace sees.

vhci_init_attr_group() moves into vhci_hcd_init() ahead of
platform_driver_register(), so the group is populated before the core
reads it.


> WHat has recently changed to make this start to fail now to require this
> change?
>

Nothing recent.  The window has been there since 1c9de5bf42861 ("usbip:
vhci-hcd: Add USB3 SuperSpeed support"), which added the second hcd and
left the group creation guarded by usb_hcd_is_primary_hcd().  That means
the attach attribute goes live during the first usb_add_hcd(), before
vhci_hcd_ss is set, and survives the first usb_put_hcd() on removal.


Thanks

Deepanshu
