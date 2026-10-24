Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792803751;
	b=e8e43hV1RODXQtwsrn+SA+AAEIuOtCv92x/Rwqza7NqD3RVs3ZbR8mV9gqTePsG/8aSu
	 S6yGA+n+6yhXETff50d6Io7LE7edvpTFJ5+8a9YY40GvrkzmaIsPyJG77OLTyXLsMhQZu
	 C5OfN3Gb8/cJyyJpNyQ/NhMMiw2xFrj7Eky17AyoVA6zGf4CuRSPltcNV8XfRDP1YntkQ
	 AjkgCjfrZ8Li5IjWl7J56xTecVGz6sEwB7EEoITl8v+amhQcRRbePvRztwMiiV5wf0toP
	 d7ij9qMGN8Ss8d5krnJ7Qqygmii/VquHL9SOufIL8kuJnANXHiOj8OhYazNkeirBpPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oDzvj+xShohDhW41Zdjus/8bwn2Q2oAdGVZHK4gc8Ik=;
	b=AHT5ATG9RR0d+WYq791g8FWbJ5P4iV4I14D56NsgyckAt8jEQR3ClIElQMcaqCSzxZ6F
	 qOd4UcJJUvF5LQsn8K3eO9b9uCADf32Nhgx5lA1XtYk6ILNuW1a/CS4HJPfL7m3ju/Cm8
	 l10/sFOoWjLqUuaMmbMsLqCOpEDHGOab13t3KZNbLmdgvVMexGYUy49GZ7/mBDmMhdoZ7
	 ORgKkK5RIkw8s4wFIebdOsOojPYJEkzjIdfY6SacvfWxfotnkiQKH3qLDVPUDntaC+gGL
	 sR/tZ1NLpUJTAlJTg2xROrxj47NB8so7zyqtEh4pYwMc3SFsU/RFZHO6RXWV/bYlOtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Eu1Gynx9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78D7606A31D
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 01:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78D7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Eu1Gynx9
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c45551fa84eso215237266b.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 18:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792803749; cv=none;
        d=google.com; s=arc-20260327;
        b=stNmLaF/VBYi4Mw7bkhrXJsDPBQT34DUk0PnyWELLpzCtC85fiDemNI72iL775omum
         35a+TxQ6k8MKzi2ZsH22lyoi5IWKOmNgQCkfRIME975BXvcViYi4p/oN+Ur0WzH7J4xq
         17GyZZS616VOmG+LigLCX/daWc/plyUS0Ot8Wzo1Xgb5nrVF65jB/Lf9BGin36Y0vQsO
         QnIkig3x8Xb4jAW32/mHk2U4KQMERq6fnp06PHnsPAOrbiHwbrzp91hGfs+24Fdno/Up
         a/V/jFfBASERsdASNRaaERGfZsab9y5fVlIt8y3FRdlMoVxODEjaFuX1wpWDjZu4TsMu
         XGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oDzvj+xShohDhW41Zdjus/8bwn2Q2oAdGVZHK4gc8Ik=;
        fh=95Z1NpiVJCz8XlCgtm8eSTz1dlXzzSDMJ/XP0UgTVk8=;
        b=pqumiubmH6cRBOQIokGRZNFOC3iLiuSFCqe0PTJaRmI/Kd1z4CxCT0Jv1K8qBKq0aK
         fOGubylg7Yf/hfb37V/YyvxrRuvXQNACesWP6jcHrIZz5WZt/yEa79cgb4unQtgpZqdA
         KrR7+bKIp+DPB/3BLf2lQ7b5FSjhG6RcVhPu6ZoZ68UhrmCANkFyYx85btS8Uqm3pLq3
         tDwrmxU+ZaX01cN9i5ttyeAbMgaECFM36u/Qz4awkH982/OkkYQs0qRs/MnVRwoyVKi9
         ViT5Bkkp+kHb3y5kpuiNQzre50mSOll2mHQ+FybE+9I9XzIy4Ct+Y51RDFa1v8Ohiewt
         kQCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792803749; x=1793408549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oDzvj+xShohDhW41Zdjus/8bwn2Q2oAdGVZHK4gc8Ik=;
        b=Eu1Gynx9JHdZJHAzWpLJCRz23RJUI/tpfHb1S6OGcJpC6jME3983wgnmf2ZX1sgPDD
         vTdB0MZMSc83zja3PDPUOijtvtalFMssIM6HtntODZMvrSKvocE2NM8C3NqhbTjq46v8
         0s7eNmu6ou6IN2Ro6cU5ns3aUppu4AE+ab7KI1r2jMfrMPf6R3+T4+GDG2iF5s1mYuyo
         2V5ljrqaKrLRCIszXKU3XTvNXcaFR3zu1Zr5I75arVF6A9xFfWBLikXgv8CIQbfQoL+l
         8Yw+EDGgpueisHXXBruzAF8tFTmWwQeMxTw/Y+yx+xTO8WPL5hJKahhZ/B/ffjgxU31c
         OQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803749; x=1793408549;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDzvj+xShohDhW41Zdjus/8bwn2Q2oAdGVZHK4gc8Ik=;
        b=waDpMCoaZ8fY08LY/bupmH0AggKd70z7SIIMA0UQUI3bdiWdbDDkdrWzXv5eettAk6
         XMlEDK1d8TB+q1uAuLuMoaSCQF145qiIFSiPSKSVndra2wJutdRrVKr2IJXvEFBUuVjo
         4n+nkDDvCN0zk0lWv1QM7SZVUaBdGK6ZUnjeEjjVkdFFkuZ99bx0IPkgNoGF6r/IL3bu
         0fHb6TjO6FJnLAwdLK7qCbgci2UF33cm8YjRX9HneLk5MJk+3BNJ+ECHSDmGiB5R4N5m
         T3ifKtOoXvA4/+2PLTwEHcT93wCz5s8HdDXiTJAwC5JW4LXoMYENqbwwFO3nYvXYkhtr
         DpTw==
X-Forwarded-Encrypted: i=1; AKwUvBzBEbtFG0vcsX1nknwo+1jVH9xOsokUUPvDN94GNZzex97bvg3ZcxjYVRr0pZnaamuzCqpz5LQfsiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU2cS5mUKrbgpZHXnPEMHsuR2Zht13fDqFsXiiXatvciKO6FUe
	opiS8GOiPDdVQfVNGMCaE/H+yfUWevOgk4rS7HDcjZu11PCOvp2DWzjzPCca0EEUxcKw03XXlNN
	7YVb660bP2J23L9NTOSDvFtHDg5kNBn0=
X-Gm-Gg: AYBFou0YlCx5yYXE2mzBYGs0Mjo8HWjQfAsk3JNFl5hZ9TB9c7GxhLcQz1jCw68TDYr
	ni5xHi2LcnkeOvwnqJKhCQI3Y0MjoP75sAsT9II6gL4DLxtRGAMQ0WHHAdEtMcx+qkCBPXBvMuK
	Z0Qaqk+F+AgIyQXXoGgogSCgOSa/7NS579GmoEv3Bd07wG835OqvXvEvmomkVaVMxJq4UH/V0Qm
	84Vos2TZvkGrPdDZf3dwvEdDTmB9CY/UKJI9vwn5kc7qB9qqrKVr5pWNxGu4DbY03c2f8uh/w7d
	tnGzcikOYzfL2aJva05Ju+ZQHj9t2+u82EMqwYt7fXRI0MSJTggD8pqg1+o4iKiHgiuuDKzhcyA
	yG6eepqA89VisOfOgVHBtpbvsbZGa1k41SmFhhHM0IEJrp7+MnlzoTFapITVIhzztVkkptkw=
X-Received: by 2002:a17:906:ef05:b0:c46:b9b0:8e8f with SMTP id
 a640c23a62f3a-c46bde21c02mr62177366b.41.1792803748727; Fri, 23 Oct 2026
 18:02:28 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020201537.2465655-1-prashantsengar25031@gmail.com>
In-Reply-To: <20261020201537.2465655-1-prashantsengar25031@gmail.com>
From: Prashant Sengar <prashantsengar25031@gmail.com>
Date: Sat, 24 Oct 2026 06:32:16 +0530
X-Gm-Features: AclHuK9Zzs_3WSZD_RLY-M2lGy8SjI382zxLf5M-4bIkPQ09NRQHeqm8GF6KJo4
Message-ID: <CABW1sBnq8nHsm_B9xffgrcfVo5ht_XHEQ9i5T-F=KJ1KtCdEnA@mail.gmail.com>
Subject: Re: [PATCH net v4] net: usb: lan78xx: avoid NULL PHY dereference in
 WoL setup
To: netdev@vger.kernel.org
Cc: Thangaraj.S@microchip.com, UNGLinuxDriver@microchip.com, 
	andrew+netdev@lunn.ch, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Regarding the two findings from the netdev Sashiko review:

1.MAC-level WoL capabilities on PHY-less devices

As discussed with Andrew in the earlier review, fixed-link WoL was not
properly supported through the existing PHY-based ethtool path.

The intention of this patch is to provide a minimal crash fix for net
without introducing additional WoL functionality.

Andrew suggested keeping the existing phylib handling for this fix and
implementing proper MAC-managed WoL support through phylink separately
in net-next.

2.WoL reported as disabled while pdata->wol remains WAKE_MAGIC

The observation is correct. With this patch, get_wol() reports no
enabled WoL modes when no PHY is attached, while pdata->wol may still
contain WAKE_MAGIC.

This can cause a request to disable WoL to be treated as a no-op by
the ethtool layer, leaving the internal configuration unchanged.

However, the default WAKE_MAGIC configuration and its use during
suspend already existed before this patch. The PHY-less ethtool WoL
configuration path was not functioning correctly before the fix.

I kept the changes limited to preventing the NULL dereference,
following the approach suggested in the earlier review, without
modifying the existing initialization or suspend handling.

Please let me know if this reporting inconsistency should also be
addressed as part of the fix.

Thanks,
Prashant


On Wed, Oct 21, 2026 at 1:45=E2=80=AFAM Prashant Sengar
<prashantsengar25031@gmail.com> wrote:
>
> LAN7801 supports fixed-link configurations without an attached PHY.
> However, lan78xx_set_wol() unconditionally passes netdev->phydev
> to phy_ethtool_set_wol(), causing a NULL pointer dereference when
> a userspace WoL request reaches this path.
>
> Report no WoL capabilities when no PHY is attached, and return
> -EOPNOTSUPP from lan78xx_set_wol() before modifying the wakeup
> configuration. Keep the existing phylib WoL handling for devices
> with an attached PHY.
>
> The issue was reproduced using USB Raw Gadget and dummy_hcd in QEMU.
> An ETHTOOL_SWOL ioctl triggered a kernel Oops with the original
> driver. With this change, the PHY-less configuration no longer
> advertises unsupported WoL operations, avoiding the crash.
>
> Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
> Signed-off-by: Prashant Sengar <prashantsengar25031@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v4:
>   - Remove the unrelated blank-line change noted in review.
>   - Preserve the existing spacing in lan78xx_get_wol().
>
> v3:
>   - Report WoL as unsupported when no PHY is attached.
>   - Keep the existing phylib WoL handling for attached PHYs.
>
> v2:
>   - Use the phylink API instead of calling phylib directly.
>
> v1: https://lore.kernel.org/netdev/20261018151830.643511-1-prashantsengar=
25031@gmail.com/
>  drivers/net/usb/lan78xx.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index 5655941f1478..4f100bec5b3a 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -1764,6 +1764,12 @@ static void lan78xx_get_wol(struct net_device *net=
dev,
>         u32 buf;
>         struct lan78xx_priv *pdata =3D (struct lan78xx_priv *)(dev->data[=
0]);
>
> +       if (!netdev->phydev) {
> +               wol->supported =3D 0;
> +               wol->wolopts =3D 0;
> +               return;
> +       }
> +
>         if (usb_autopm_get_interface(dev->intf) < 0)
>                 return;
>
> @@ -1795,6 +1801,9 @@ static int lan78xx_set_wol(struct net_device *netde=
v,
>         if (wol->wolopts & ~WAKE_ALL)
>                 return -EINVAL;
>
> +       if (!netdev->phydev)
> +               return -EOPNOTSUPP;
> +
>         ret =3D usb_autopm_get_interface(dev->intf);
>         if (ret < 0)
>                 return ret;
> --
> 2.55.0
>
