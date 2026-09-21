Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0430A4FC347
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015551; cv=pass; b=LyOOvMukWGbQVFr0O7EgjQPvrcvEYRJuHMtj2U+F2gUHrBFm8bgTUrBoQ4Q63FDOPvfX8dKl9qzOgzSgj4dRTqThvcE9AfHDPfoidkO0pAylY5RDtFIiWzSzVD9qx3erWJqtUsumxbYwnU192j8HjzVGG6T7NA4pODaNZb16g8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015551; c=relaxed/simple;
	bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNPXebIsdqeoZD6+uZp8HhGL//KDFjcsxGhBFceJOrjt4T/7iWn5sSduM7oOG3wu9ZUGy9xsrxP2egSMwx+y3MtiR2a/1ECyJLtgisx76JExNDHRgEQ7JMiVFCruyjElnuiftBNRiLCGTnN9EoJHA/tqHUf+p6bk2Xwz8oNZqc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe7IN9f/; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe7IN9f/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so5073090e87.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 11:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015547; cv=none;
        d=google.com; s=arc-20260327;
        b=NwXSVS+42bD0lg2WD53g1PZBIcOxwbZF+03z6V0Oen/bCIz0q3JZxpRWtSLSH0VNd5
         zzpbAHsbPkiAArpHoHowFgRfhtjunHwLGMqn+oFqTc+As9TEHhepG6d3cMS0tI77qayk
         z3cRV1Bbrmaf4RvBYj2U2KLTyfu/cWBvY/Hd/OPe72+ZcJ9HmYyA15anP5iwRExJPX0x
         jI7N8LNm+xxA+iVW2bSb6Z/I2KXACauhl5QfrchEDPZinsVDhdJMYs0nK2fPKah0mSJi
         IAnbNqh2V31B7PXFqnIICZoQLhmDs/QkKqMjYQf6ovjFTLz6kr//eaPsR2itCqD95v09
         halQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        fh=FtLe7RNAqMXn0pugxsOsv59YvodCAM1Yx4p/WHa2+LI=;
        b=A5SAE/91IdRuzXqml2s0EygpFle9qSV2FT7AP5w4tkMSIs5M+odZMA6lyHnIXdM6UF
         XezAiEGdda0dd00jdrmCKjY66OpOk17iodn1psWCeKSxY5W0/oSVbaH3PmNeFYfCmJ7+
         PVtAH8qg/SCZyEVGfqihiAa5WP22ny2jgm8L1oMB5eB1xekN+95AbxU0MyXO0a/KCrlp
         f4CJBYtd2saLc6ODX9Eq+VkliHWu4jGidlrqIdJUi/CosEGWu7cBYCBjaFDmJzG32vsZ
         SFOefQSJ8VGVqqEOrkrPcp3znOFv8AhVk+dtEo0OkhF+/Ift+2827iy5QpXKoVlM2vcG
         M9Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015547; x=1790620347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        b=pe7IN9f/CQzF4VA0m1JpLqlJX4z/u1P4pQQOICgdkgWZCZtv1rB4SroMZ4XoMHwypn
         F98ue8R4Cr+gy8ZiPDUM9I1ZF8y3cHKp47rDKD6NSQb/ino+xYLNJPvF/fWgsGn+Hjmj
         v42iv54wgUAoSTG+YbvHj/AO0Fi7QrMa6A7V9Djv5ucvEfc93KSCxkx5dj50iu3vdN/8
         l6LU2t/s7PcwAU5Rvr8qCGalMUJXFyVfwrhYw7cw7Nw61ZmQOrP4ppnDUpVjXN/u6KMw
         wbR0/qFcD8KtXjF1JohMhEJXsmBp2EzQNsVBMWZMwZPKABaktVgU7kbLxaBF5MRx/NeV
         5r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015547; x=1790620347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        b=ZcdFj/yLBp19ajo3d09r3BYAl+c2bNdC02+KQ5UA76BdqbFdu/FG3+guSxbpeKn9yx
         vVeE2VH0oOXWVowRWpAeDqcFIWmym23d1GVxNiJok5jVHByykJCLjv8ROK58QsTNjWZ3
         uHH5/TkDfC/P6TsqyPUohARx9jg6T1jd+T2sA/cy7evdWcveMMGJJs40Vmt+64YOHmwi
         o0WdRtVo7rpcD24fjYl/yl2T9um7uecwPVWZ311nHX1ff0CTGIcnf8slzGTMsEmtOntV
         Sxf7J0AtTmAeDHtdQy//gWm4L0k69duMX5bT0isIr15LMoF9aePiG9twFdePhbxvOcaK
         aBlw==
X-Forwarded-Encrypted: i=1; AKwUvBy0Srk8f9xEqIBuDegYVqIccpbza8ClGWNRmGFs7kKlF/2BTYj7PkK/0tisxS9MNh5KyR6d9eGJpK0=@vger.kernel.org
X-Gm-Message-State: AFuF++nbh5tK+d9HBdcovyQBIVFexGfaQV3qjfL8jzt3vSvth6PY9wXr
	aAxgBLJHL5qPWFAt5O4B/XLazRCHqBpdvZNtbkNTXyMCRyVoETYIojd2BsziWGp8PUqLcy+WXQI
	rcCXZW8Q0pb+vMuEMqbAf9kju86S7An8=
X-Gm-Gg: AYBFou3SmKbrMgi9f6JT8p+V1XasDBGaZGeFPPLui8JKshNqfW6jZ3y1JMNzmbZpjEi
	3Qq7oBKgskGlFO4i03boq9Zm63E0UByv8AcacDk3TY5LatARLR4wygJKCIK3MRypYQ4fk0YcE8W
	MaARVwGSxDUGXcvSd8P0hQonkEfB9d5Ax8r5fkomNBmOpA3l6hneTYEWMh6a8Gl8o69RM+8Zg/7
	wj4ULULyaFsz8w9lLx2PFYMVqzM8iHu7I8BImUi27c8JEKEUy1Zw7eqAN+ekPWwEYnuBBiDvMrQ
	Mj0PSoed7nJeRKIPhI6TYk7zEnpqNCcTjmlvur7nP+Adynav/WkJqS55ZP3sW4PEY0to6mOxPiH
	X8ElhXmneaw==
X-Received: by 2002:a05:6512:159c:b0:5b2:9f7a:29aa with SMTP id
 2adb3069b0e04-5b8c179de22mr3976341e87.0.1790015546739; Mon, 21 Sep 2026
 11:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920211356.186967-1-rosenp@gmail.com> <20260920211356.186967-2-rosenp@gmail.com>
In-Reply-To: <20260920211356.186967-2-rosenp@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 21 Sep 2026 20:32:14 +0200
X-Gm-Features: AcwNN1VdL-Fqcu_uP6CBPAY_SNwPGWfl7hrsVO4b8Qj22YVrcCYQZRsojkFfRw4
Message-ID: <CACna6ryP-ZySxcK_b+BH-5ckDJxAOXE3tVtLYWP6SYA_Re3HOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: bcma: control VBUS via a regulator instead of a GPIO
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 20 wrz 2026 o 23:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> bcma-hcd drives the USB power line by grabbing the undocumented
> "vcc-gpio" from the controller node and poking it through gpiolib.
> Besides relying on a non-standard binding, this cannot work on boards
> such as the NETGEAR R7000 and R8000 where one chipcommon GPIO powers
> both the USB2 and USB3 cores: the two controllers each request that
> GPIO exclusively, so the second one fails with -EBUSY and its port
> stays dead.
>
> Use the standard regulator interface instead. Each core obtains its
> (shared) VBUS supply through devm_regulator_get_optional() and the
> regulator core reference-counts the enable/disable requests, allowing
> both controllers to drive one GPIO without conflicts.

You should add support for VBUS without dropping "vcc-gpio" for now.
Deprecate it. Give it some time and then submit a patch to drop it.

This patch as it stands also breaks bisectability (because it drops
"vcc-gpio" before switching to VBUS.

--=20
Rafa=C5=82
