Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653177;
	b=yEhEeL0NqQFcE5qP61sE5ZBkScXse33AHSLSg7J7WH/hTCkz5wj59itPIfyA4r0zbz8E
	 v6xtTzMsiff/U+0z3WFOXrVsgxwfwZ9hqlhmZvislqVEBXzX1opfpr+kMi0DFbKjmxaMu
	 5aKpktE0PqvEtud++ksDK3r8NN1n8Mc6AfkwDMYVbKtOIypU86DyM+OPABXD5OzTzvnjX
	 5uhbyI6niENnkXl15wk8YcWKV4qh2b5dyWraLvS/5hGdHQ9c/UcFR2Qg2dku9heZA7h1Q
	 6VtsEAEoe6Ht653fxCN3/AI4+zOE1Y9ifLvJDHA1kF78L7aZvoPvn9kcfwXW2i+15ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653177;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uDM/RsCO2OpXSgXDK5IPr3e5xcOqFbHc0jY+3z7v1no=;
	b=UTpaN5FThgld9ZdaCqVwA9Y/MyyVuvenRYFx/2Knaad1lp2JKV0ZWt6iZe4Vpg/Rgrli
	 9fSNfAL46ZltGcHH2zm2FXqcoDli5xFT2Xsox9OdhX6ydd8HYCqYZlP9ssCcL7GopOzqr
	 VEarUkAtNawD9VuHAwOSDN0iaTK1hr1irP8zkjXh1a4MQHeXhB0A5GhJ/ZlGHMiYtvKaG
	 4LwpeSQ9NEjVxjovM9odEZADbygTqxG8E5aUr5Wll4UNSjgc3vtHbRARnojylkIPZHxKJ
	 zDNr4DBFSLq9h2XFY6CCHqrKf3x9qflV+4S88/MDGK8qhxRYFWTD2hZK7nuXulobtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flLKwNqZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19C3606A31E
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flLKwNqZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD141F000C2;
	Thu, 22 Oct 2026 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792653176;
	bh=uDM/RsCO2OpXSgXDK5IPr3e5xcOqFbHc0jY+3z7v1no=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=flLKwNqZbhd5qi17zCGSVwCIaHgmF6VUOwYSL7MubNlHXS+zE4ro4pmFuSsiyN20h
	 lu3zIpx7JBZoQLx/4yl1vbEoAsAsv3vKLO2KTTUEl7yhsDPyVSFIvFeXqVHYRwJRHT
	 pyWJGNkDbR3s9jAx69m1fokqfMLFJww16vaHj1fii+KZ+VxP3RpxUAvgjME34q48MG
	 Pa+CVOhDAmtvGDrXHi8GSaXit/j0zYM6F2op58mSP8D0KcfAmk7X2epzWesPiLGAX7
	 LOZpNcku5yiXgyd/gLK4FezsZiXWQ9IPDkRtruvIZK0SF++ui/nLQTtaKPIUUT2EUd
	 cf4y3i+8+DLWQ==
Message-ID: <sashiko-outbox-181118@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 4/6] Input: mouse - use usb_make_subpath()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shihuang Liu" <shlomojune6@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261022070929.20820-5-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
 <20261022070929.20820-5-shlomojune6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:12:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The appletouch, bcm5974 and synaptics_usb drivers build their input
> device physical paths by appending "/input0" with strlcat() after
> usb_make_path().
>=20
> In preparation for removing the deprecated strlcat() API [1],
> replace each pair of calls with usb_make_subpath(). The
> helper formats the USB path and the "input0" subpath in
> one call, avoiding a separate buffer scan and append operation.
>=20
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022070929.2082=
0-1-shlomojune6@gmail.com?part=3D4

