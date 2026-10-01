Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C176F3B4E83
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 23:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899108; cv=pass; b=RHHnIXyDebhtDtwtRDUy0D/mengA2khC1EEthH0dTWsrsKwnooTxFvuivpsa3t/Jv8Ml5N26mykqggIG8bmAyCqSWw5tziqgK9nrf1M/AekMMckpMh0wcdnTuW6d17pGs3bu5zw0b4bo9ECePbYzhywJx4QQZOikLkgibRY4u1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899108; c=relaxed/simple;
	bh=AU5qx0SsPYU3uJ8KwmQ0/fUfZYMcTpVxfADD1eUqY6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBSngrCY8QflhVhP6/hmQ1Bk82dd8zwoc9kg/q/yejeaIfhFgF5ilJbghhj+dnrFI78bgKGFFGBMPdHa5ZL5vbWc2Al4ByyotIDuUu7vCZq2uA6HIN5I2vgnu4474Vje8grlA1QyMx7A0M7Jx1r4fKy5SwGytn7biBhEGJwcCk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdUMZqDM; arc=pass smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdUMZqDM"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14e1fe551c3so1153125c88.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 16:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790899105; cv=none;
        d=google.com; s=arc-20260327;
        b=FN8DG9D0L3OnqjUb0BdGweu5/yK/e76GQbSiR6NEr4VxMrjC8IXNK0PcgOKfxRxrl2
         lSLJ8AdRhna6gxYrfanr/1sjfRmw/qJs6STG03RwiHLUrhp5mqkQtdsE4xAf5UGy9gSo
         d3B4OeTm/QPV248wEBU5T6r8NrpTzelTdCbWt1dA3Gm0jRDzhLFTbhPB+4RQEGGyUPRp
         1RMV03dz3p6OJTGjIraMKEXY6/PpyrJ8G5YJTL1a36rmX5aOBwP0Bg5OvQ/WH4ouIRk6
         vZmXaeygdYwtCQWFk6NHc0pTyI81OqBCvw9zP88YG31+LO754JVFMXVLHknWbry5JwmE
         DR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AU5qx0SsPYU3uJ8KwmQ0/fUfZYMcTpVxfADD1eUqY6g=;
        fh=3B/L1II5O2g3rBYhVOVqzNqWKquVOu8UQwIyKWmWeTE=;
        b=Ziea0F7A/6FnuABSLX2kjfWPRlng/PVTdkAJ2mwY9NLldrYoeZN02DTYnRzXhkGfqC
         nJ57nWmgRLJaQB/cazDRCwnVMBEOGkJ2g/zFCZfaV8qViLDczdb3jcFqn0IgoTJKAK5U
         0WCCfmLoKO4Xete7mcvK4BI8S+xnbRgYZfJZhvjNLyLnMSzTNkX2/c4fhDwOhbwK1Vg7
         lXuzG5mGHKPjpSi3x9yDLWOvXsm3Ps8sP5OObs9i3WTCg1t0wEHbKmyeG9dx9dOIQx/m
         B3h3LZehH29FmEFDFnq6DAokfqxXHzgJ0gILuVhK7/osor8Sk+P5LEGi7NSRwx30GTae
         PPqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790899105; x=1791503905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AU5qx0SsPYU3uJ8KwmQ0/fUfZYMcTpVxfADD1eUqY6g=;
        b=cdUMZqDMwQu5oJ3RKznrcUG0HfrWQ77MDKzSIVN7yLrP34fGPPx4horPviI51zytzB
         66lHD4WLa4ozUFAae5NYIRGuYHnU65TiIF4EF/zUCR6oWSSekNHADJe9mmSQjJot5VLI
         guWGrHYBt4WkVBwJa8bby9y/SS9Ie22FOps7y/5i21g5FCv1KDMxrPJVK9ltgjTUuCJm
         4rlj16mZaMvL85NC9I0c1JpqQ+cJy6z/vcE7OU8jArNXM18uVEaRZ2S/BtCj6Sg5d9kk
         PNjQq2os2caVnEWh16vrHjaE6BqUgDhHIN208I99IEIn55s3TJyYxcFw1OYcaQTKpi3/
         3mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790899105; x=1791503905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU5qx0SsPYU3uJ8KwmQ0/fUfZYMcTpVxfADD1eUqY6g=;
        b=flg/R0f7gB2EfeCFXAcvzj478tUEg6fQdvrQT2e0RP+7wpBF6jwKyMKH4tszWYYSXy
         doozUGafpvsZh29Ci9cjimG3WTHAmKUaWnuk3TC/+6R2h7pTqsc+Zp2OWLp6pYy98rEv
         UrAk2u9HUnoVjfi/om9QMSkCdCKyLVCFkAlgGPNJXBnDMVDKZ8CyOtipjFJ6nKWp1T7l
         RcBDIqvfAIgdMiwOGYV+mIg/KHzIiRYZOZVKXQUYLFgLoDXRidSJEot2UgjlRvg7M2u2
         yQPMgsvnfrcyqf81xPN8CH7Ixp49wzNz8m97kae4b1tj7qhArxZ8WjzpVha7vbQR2o+o
         C7eQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEvqXYKj0ClKLjQERaqzbZ6ZpNfosu2njqq+47aFM0m/IxNJsnUPkZfA9hnvqAZQP210KgSatdwgU=@vger.kernel.org
X-Gm-Message-State: AFuF++nA2f1iJsnTt8JQ60pEuNFq+/rnrvPpI51mhXEYWHkBBL1X2/yn
	DySxieJQ49Gfpvf/7kf2SiYcRbhDOc1QYjzacRRnTybX0/yZbK36CKTzJN8FnpnkD1Gvno56Rg/
	85VlNVPbVQRpbqL4PiqRXfKW20NcmmrPVVvadXM0=
X-Gm-Gg: AYBFou33To3EBWTUt9PFKoxSFTIkrf6zHLalXUMHC2tdt4/gqwI2t/VbWWKJsJePqXD
	7xdLUSBNYpojy9OMBPIrqJ1j23M9mbMOK8OmzbbqJujwLljJtrkMGhtjgAHzohR6j+WUhEUJRyJ
	fZSjEcPFyA9PKG/FpHlA/e04aVC42inWgalk3z24U95SfbudJPG2lzxExorxV+nuFoa6IwgSOMV
	oIN+B6fj55nZp++puigQLN2FdfMh6br6Tfkezm7GYWpo0kYwh4Y2gzAsvujA5OgHk9YdlXxoi6d
	HajaPxeiS9sLwTa9aKkG6eN7MzP9SuKPva3MXwvqDSjiDSJDiOB7xRlyLB2TSXDsfuOKgmonrOP
	jG7h5fxfxAg/v+KnHX4OqGSq4NA==
X-Received: by 2002:a05:7022:150a:b0:143:5722:55be with SMTP id
 a92af1059eb24-14f5c2ef10emr1139903c88.30.1790899104864; Thu, 01 Oct 2026
 16:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-tb-dprx-fix-v1-1-da92659e491a@gmail.com> <20261001034839.GA176164@black.igk.intel.com>
In-Reply-To: <20261001034839.GA176164@black.igk.intel.com>
From: David Medina <b2amedina@gmail.com>
Date: Thu, 1 Oct 2026 19:57:56 -0400
X-Gm-Features: AclHuK98N9acfHTGaWAbQzc_UJu8LzhR1AJw-KZvb2e5NZcBn3V2zswzwxEWLcw
Message-ID: <CAGTy6n-voghUysgDmvU5bU+zuBPyr_svGXU9m-zm+vKXHYf55A@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Fix domain reference leak on DPRX work cancel
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika,

Had issues with your mail servers kicking back my message - so
resending just in case.

------

Thanks =E2=80=94 I tested your fixes branch and can confirm it already
resolves the shutdown/reboot hang.

Please disregard my patch.

Thanks,
David


On Wed, Sep 30, 2026 at 11:48=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Wed, Sep 30, 2026 at 10:16:35PM -0400, David Medina via B4 Relay wrote=
:
> > From: David Medina <b2amedina@gmail.com>
> >
> > tb_dp_dprx_start() takes an additional reference to the domain with
> > tb_domain_get() and passes it as callback_data to tb_tunnel_alloc_dp().
> > That reference is only released by the callback, tb_dp_tunnel_active(),
> > which tb_dp_dprx_work() invokes once the DPRX capabilities read complet=
es
> > or times out.
> >
> > If the tunnel is deactivated before the DPRX work runs to completion,
> > tb_dp_dprx_stop() cancels the still pending work. The callback is then
> > never called and the domain reference held in callback_data leaks. The
> > domain's reference count never reaches zero, so tb_domain_release() nev=
er
> > runs and a subsequent shutdown/reboot hangs waiting for the domain to b=
e
> > released.
> >
> > Release the callback_data domain reference in tb_dp_dprx_stop() when th=
e
> > DPRX work is canceled, mirroring the release done by the callback.
> >
> > Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation=
 asynchronously")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: David Medina <b2amedina@gmail.com>
>
> This should be fixed already by the patches in my fixes branch, can you
> try?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/l=
og/?h=3Dfixes



--=20
David Medina
14901 SW 87th Ave
Palmetto Bay, FL 33176
786-280-0880
