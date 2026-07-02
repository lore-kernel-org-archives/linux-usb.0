Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E33D093A
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031977; cv=none; b=o2z56ba3KhbhBKJGNzrTZx3s85arkP/pFVfGt00zwbTP0Qox7kb82OATs6aYbXrDxjWktkDzsb0CtedABKNm+YEMS2NJl4lvAG306sVWRF25oWBGBnMf2Ws+0jwkliVqru9/k0IHV+rkOlP5lzVvwhQXyH3wMY1WpFnNbeX2wa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031977; c=relaxed/simple;
	bh=jUEFO2dYlrUsHq/npRyqqQfPXBIu9PI/KDflitAC56U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnLt+Jbs9SFWpdMn6cbCb2fClLMENjAzW0Fa3WO/l7cr0nfXkBFOmm8vpni9tve8HD+nYzXGDS/W4nyKBk2I4U8JkRkUPD7ssS5OAUa38zqMguwjfuwajbxuu/EAaLsRuhV51avdl+dKQaGqIo5arRsLTlVabeNk1opTyv14KFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fY8f0CR1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fY8f0CR1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so16197965e9.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783031969; x=1783636769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jUEFO2dYlrUsHq/npRyqqQfPXBIu9PI/KDflitAC56U=;
        b=fY8f0CR18Nr4Lr5ltWqWyO+UKisUH+DPeTY3TFNHpAuvo9/aDWdcDLalh8qcEcon47
         Kt0J3oMRFyn7bkwPYMywUg2BAr3rckUUrqLt5KV37CScCa8RNdiJKgvlTi5rtqVw6VMe
         vnPuberaUAM1Nz7vZK9BoIxr7IyzE2eb6dBIOdrxS1iI6s+Y+9bVxsxWLZAvikvKZbuV
         JV2zJXbtxn8orgs9NOu2+YcGHfCeamhjAKZhG6mW/u9ythRGSGnmyRlKNSqRKOr1kyNF
         byc9qsBCuq2wMwhe5+smmmH6DE8L4pTLxLrdeWvkKGKgCx1XbCz2/Xp5VHLUjzGlBRMW
         Nt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783031969; x=1783636769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUEFO2dYlrUsHq/npRyqqQfPXBIu9PI/KDflitAC56U=;
        b=Hj8ZOSk15nFCcrRhOMlOp4xJ3HpMPEwdE2ySjuSAZgzSP1wZW0bYe7DvWxctMfSaSK
         4MqwY5vUkl/F27KqI+0SoM5RMQqGtv9GN+8HoPs9hwMxVDhL13U2pIlijN83mFwoEMAQ
         wL9/KgHwWGE+Bv8tsc6xIZ4M7qnpD4bK0F/G5u4HaEsJln65rJ03nrtvCSBRLC6bp7VL
         Qf437qGjKcBvSUOUQGxirtqXVEsBIClWfox03ge7BLwcoLB/Jwv5MdHDJ8q/a37sfjJL
         TdZpdQgCoBDtzpIvvnvYdwUyJF4eJzPgN1/xBrwZpOjV5zm/LJVWyP3+Swr8L+MV/AqV
         994g==
X-Forwarded-Encrypted: i=1; AFNElJ9oxZjm+qBW3QTQVpCw8cdxbGHahGmM8Cy5tTCA3jnSVF+LQcfNxG2SiDV6xD8tc+nqGAHjETIP9OE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQipbmqaVyWe31llH3TtEekdZPw2d4pehE4Zk8+C0usdCDR3BL
	+K+1JsyhDtSfHc1c/meNj8j7tPsWFVSHmihuUxBvP/j94a/SKB6zuW1ZwS56xxUO0PE=
X-Gm-Gg: AfdE7clzKGRb96z5zLGpxkX2iDcHDFOtFJVEYChTZpj4gzYNih/+d3iadCBP1T4nGXB
	dmPNW2zeJNXg9I+9mfFekljXZM8/3LAqNF2GIRLT3m/bP8ZsHMDraAbG3HuYG2yRYfbikYgObp2
	04Jzyteb7Rnu7Vf+m8FMTOYNFcUHJHWQRG5buwnoNhG3Lx6Zo63J/bkiuzk9qIPURBEOMtodbfU
	hMQ2PK0dYsh3NcId94P+EOm4IeBYJhWVGBTqK5kbk72XKvufRKjywfcDjVTnEGkbyodyx0kWS9k
	HIclo2iv6bNP50w/CQgjcpFlyeKfGnhMdWy0CxHvdVc9OALDmr3Lwu08z44xrHnLx4hG5mQYRCg
	q6IjxwTTAHqXbJ63kkzMEZHviwqQHOUPACeAlZbFXNt2/Lc0VeA0FbQrq/AX090yHRNVM8k0JWy
	g7zITmWFWiBvjWA7EpvQ==
X-Received: by 2002:a05:600c:6692:b0:493:bb6b:5bda with SMTP id 5b1f17b1804b1-493c2b983b8mr111151595e9.29.1783031969110;
        Thu, 02 Jul 2026 15:39:29 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c635c41dsm155275235e9.5.2026.07.02.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 15:39:27 -0700 (PDT)
Date: Fri, 3 Jul 2026 00:38:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] USB: gadget: fsl-udc: fix dev_printk() device
Message-ID: <akbmlZKNiF2z90F-@monoceros>
References: <20260702141536.90887-1-johan@kernel.org>
 <20260702141536.90887-4-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nulx3wvnaf5kt2p5"
Content-Disposition: inline
In-Reply-To: <20260702141536.90887-4-johan@kernel.org>


--nulx3wvnaf5kt2p5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] USB: gadget: fsl-udc: fix dev_printk() device
MIME-Version: 1.0

Hello Johan,

On Thu, Jul 02, 2026 at 04:15:35PM +0200, Johan Hovold wrote:
> A change replacing custom printk() macros with dev_printk() incorrectly
> used the gadget struct device instead of the controller struct device
> (including for messages printed before the gadget device name has been
> initialised).
>=20
> Switch to using the controller platform device with dev_printk() so that
> the controller device and driver names are included in log messages as
> expected.

I don't know about "expected", because before 6025f20f16c2 the affected
device wasn't included in the message at all. But I agree that using the
not yet initialized device isn't nice, so:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--nulx3wvnaf5kt2p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpG6FYACgkQj4D7WH0S
/k4wnQgAgH+bRzd/g47MZIWPVDUm/GIRllQkmHGQpbbPtH1l42O12kHnutcWShhF
29ExqURXwq7jY9SaSKB0Eoiv7kVto2Y0I3VVL9qTWA9icwCt1KRzjXjyxrMSWxwe
OgBxCb+cTzVfSM3D2ZXbP3ZqY3BVoxLc1M4aAlfO0G6lwaGJ2tWmaOxRR5P3n+le
f4GuNJP9DVvSw5TSyY4vUliDPLwN5g3MLfeYEcpaqDav4eW1bPKTpC7itWX2jdTY
6iTNkWRxiEYLn/VbmPca1SusZ4ViA/0hHIIjJDD6BNYm6IyzaCq37abkiI9w0z6e
hfxRl+hHKTWLLbm2i2JNy6Cznx4DaQ==
=JsLz
-----END PGP SIGNATURE-----

--nulx3wvnaf5kt2p5--
