Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792479919;
	b=AglIDtU/KTkXwGK2/qR4HCHi6vSksSI1y5YjC3n0KZnJa643d3MBmLoeX6kc2NLxRyzr
	 NeTw7VswfFU3mxGyem+4WboZnc8EHroi+bbfWsCvxn83OQLZ6byWaYciHyv24ZjHx7POM
	 t/1yUmjYU6r1SXg4bMD97g+8nIVGfE0haDWbQ+jYiYYZE/WYmOT7EuX586DwjwuvFHa8i
	 7q9QqA/6vtgTrSn6Ljwd9BueXq4pl/6INbqBkRotKHY7/D4d+sG5szyQNsgJWGd0KS/md
	 EaZWH/pKmk9MA319WNXCSJxYULIFa+NcsaAZG7crlW30hUJTqkXaFNfH5tFfdeAjGzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Cv2JqhQRLc+jCz83YkiL31u7vtPW6A1fRdUTLPUppjE=;
	b=YzFdtwZbtrYtrCmoFMQVYhRTMXhoQEnMF0FM3OiHOkJBaXqpskh/JHSH7jcvGMszerDc
	 ylzutp/5sXDmP2axnpfAF2h0KekrabqlKeZLUACY6F+ES5HVFZ/XxGLRexyPkwJqZaDS5
	 7p+MrEXMWZeBTzGdyEFVMmf8hOMr8R850bqC/xz1XouUpzRcecHc881AJki5npM+y3/Oe
	 CQrZ/gr9uB+bf9MToaqYXWZw6yT6+75jwKViCCqISb6TaTv7SDIGkg+bblWNnLRwK77IJ
	 99bk4WbzIwz40KdKt4J0BFNdpqlQuKnkXi2Mxm/Ck/bf5+GWjlSUq9uGDuasB4gxRcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ci7vn84H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C72606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C72606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ci7vn84H
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c43373ae89aso307150566b.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792479917; cv=none;
        d=google.com; s=arc-20260327;
        b=bSV58Xr7vwiI65hyjMTBAiK61lO72kPpA/k1+qhgE1FmTy42wAvkQOJW65pzirG+RM
         XmtbtRLzHnohxt87+S+z9oH+RF3vcfZnNAdhQhjL/J5y80D7a+6t9Q3sZ2KVDRmaCs2i
         /RWX+U8zS2NXMQpDI9/9Z1JqgDatTDvhWIs4aBgEYHKe5BjTzEIFRnkFyQDQAD5MBMr4
         wsrr1AQl4Y89lGM5cqnFCTzJ1EmCR8n40uKGHPiSQl/rKldG53gEsvBz73PLy/R6GvE9
         qRpB09XHbEky3gdCPdleA33HsO/53bzUvk9GTcnCRBTdPSVtK28Orss6+C6P2WDT33hL
         W1rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cv2JqhQRLc+jCz83YkiL31u7vtPW6A1fRdUTLPUppjE=;
        fh=aEh1CSUjo1aDzXe0vDt6lsKJU3lQhiexRCdLVqg+wnY=;
        b=gQdVeZO8yL8pG2yNLzVn/M4x6YMjbqTBR9T3s0S393BL6t1f/0jG3FBKb4vpvjXslG
         r2fCPiPmOKtPf3LcBn35FzK+bph2dzaVnvhTHBjSU5LW4+lBaHw95wdArfMqyh8EK228
         isF4yWBLmged7BANDVGlxXEKogB6kQ9QnIlAX0DS0AWLiXJSnHaKudvqPoVeTtg+e1tS
         rPlXi+QkiLvFTejmArybd9IcvrWJ4MPtXl6uj22ZxV4BbMK+M0mBg7vypjlmal1LJBjX
         LGY/EvcFuCCzFTOMxO+WhoE/1MgawEIUz2sY7cfg5De6lJBdp9CzDmEc50Zge+kucsjy
         JDTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792479917; x=1793084717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cv2JqhQRLc+jCz83YkiL31u7vtPW6A1fRdUTLPUppjE=;
        b=Ci7vn84Hm3XDopKmFIkGRWeYa/rtCTr2roBS3xPoMSFZjbIisbzNmyEcM/ndv212wh
         DMJ1HWpq4I225TuzoGZ2f/dsLIAvpZJ/gBPOV3CjDBBNdRGi7UWcpJIKQotGnbx7o7mo
         r3oqNk7Q7d/tadttRra1TS+hMZ8obuLx0uh1biFsaiuL+sn6zzROA3cniMuryeEwxA2M
         /PxQCnsT9A8sgeMHZ+IABdW2S09M4hopMKt1STugedoUGQQ4e0q/c5rlJYsN2uliTj9t
         HVVizhLHnNFGEBvtVexw80TxFhZLmtMrw7dBWTjXH6iCO+UfO+g6IIN44Y1rFh7HLwZb
         f9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479917; x=1793084717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cv2JqhQRLc+jCz83YkiL31u7vtPW6A1fRdUTLPUppjE=;
        b=KNYcgY/YoyDdoArzg5VAbNDMCOih8LOqxoo6AO7LPs6qymAALRmWrbOnYin5+IGb94
         kJM/yh0W4s9Vsc8x61VDXrly8R2mOReYaKaGy2PqJE4cESYjT/XVjKmKKsbgY2KLFKDc
         k2wbdX+n+V/1kZ3QeXWLLyAZsAAwTYJdnq81f/tyjQ1nLm0ibcqHqLMj2Vfb1+Hu6+HJ
         Pj3QF8pY1LAaYGe8uNigBQa1PtgdD5AszxiRBUA50xE64fvOqOurLhGiIx/a5neXR2EP
         xGHm8EEWNAngJIIuGpHvZnWUAI+6EKvCWVnyS7fXTOWAXSEMI0ZvCOr9fyPswoMDWHpS
         pG5g==
X-Forwarded-Encrypted: i=1; AKwUvBwAfStneOnvSltihAR2elU3ukyDJIflHkgendlTKTWz2+Hw2432vXNbCvv+StbdEaCB3iQeJeC/R7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmxpMlms6/fWHjjaC7lI5LIX+0P4e0xB+c9HmaVe1W4+4Vfv8I
	ajJAzmHGlj/q3uOLotNTvTIgIQkROqfCfapNF42BaPtTEcGLTfBddigBQJEuuRR9drKDYxGUOyz
	bXe859DBbjkj9T/6X+/qvbQ/jvIdQZvU=
X-Gm-Gg: AYBFou3KDEZh0tiaJjUw5ijlL8Qzgy5q9AIce8zYUvN/UitB0bstppJooaPMoeQEjG8
	FUeHgB0rGvbMOPZKWXoRmpyK0saTj3vSxq1v84YEWeSQyRF/AI3KMLMHx5SnBqibtydzpgS1Hkx
	M3ZFpqTULTmYqF3wqsEx4ftC2aj1j6i3HBDhGPIa9NwEi99uSnTFbyPwuauklOUnjugCuWkuKsQ
	vo54klqKUgLDmbXDKsiG3vd4fZfAOBDD3MV2bM3UL8+b1q/e2dlD/mo0jTMcHAsQCMWkAOpJVuC
	7O69H+kBnAHt5El8jbvnJiAPJwucAEwxzSgzUy8rucgh9jzuMCnSl/yZSYfdKfuVR2iiCW+iFM5
	OQtd6b/4rYPA=
X-Received: by 2002:a17:907:2d10:b0:c40:5de7:33d3 with SMTP id
 a640c23a62f3a-c419f416e87mr706642266b.35.1792479917230; Tue, 20 Oct 2026
 00:05:17 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019193148.1381545-1-prashantsengar25031@gmail.com> <d9177176-75c2-4273-b5ba-d0c6afdad6c5@lunn.ch>
In-Reply-To: <d9177176-75c2-4273-b5ba-d0c6afdad6c5@lunn.ch>
From: Prashant Sengar <prashantsengar25031@gmail.com>
Date: Tue, 20 Oct 2026 12:35:04 +0530
X-Gm-Features: AclHuK_7y3QBi-8T55S8hZraTXagD4MrO2PiPkvzXTg04An0LfQcykZBh015bfk
Message-ID: <CABW1sBkKtBt0gipBNsNRWbwYy3GSDbe2d0TMBX8=whwu4WQmJg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: lan78xx: avoid NULL PHY dereference in
 WoL setup
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Thangaraj.S@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

While testing the unconditional phylink_ethtool_set_wol() call, I
noticed that it returns -EOPNOTSUPP for the PHY-less LAN7801
fixed-link configuration in my QEMU USB Raw Gadget setup.

The NULL dereference is avoided, but lan78xx_set_wol() updates
pdata->wol and the USB wakeup policy before calling phylink. I
observed the following when disabling WoL:

Before SET: WoL =3D 0x20, USB wakeup enabled
SET WoL=3D0:  -EOPNOTSUPP
After SET:  WoL =3D 0x00, USB wakeup disabled

LAN78xx currently doesn't register a mac_wol_set callback with
phylink, although it has its own controller-side WoL handling during
suspend.

I wanted to share this observation while investigating the WoL path.
Is this behavior expected for the fixed-link configuration, or am I
overlooking some existing handling?

Thanks,
Prashant


On Tue, Oct 20, 2026 at 2:54=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > @@ -1805,7 +1805,9 @@ static int lan78xx_set_wol(struct net_device *net=
dev,
> >       if (ret < 0)
> >               goto exit_pm_put;
> >
> > -     ret =3D phy_ethtool_set_wol(netdev->phydev, wol);
> > +     if (phylink_expects_phy(dev->phylink))
>
> Is phylink_expects_phy() actually needed?
>
> > +             ret =3D phylink_ethtool_set_wol(dev->phylink, wol);
>
> We try to keep the phylink API simple, and put all the complexity
> within phylink. Hence it would be better if you could just call
> phylink_ethtool_set_wol() and at the MAC level not have to care about
> fixed link. phylink knows if there is a PHY, it should decide what to
> do.
>
>         Andrew
