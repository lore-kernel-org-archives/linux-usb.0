Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85884EA36E;
	Tue, 14 Jul 2026 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784048408; cv=none; b=fImOnwIXgSodgqDFyL5JnnXFOHLX9he94PgSAYuYR/5QnhZtJiL+03fi0x5OOgeGQS7Vxrtevx1CblPFHGYyjcs/Zn4xZfVvQornO7jXdSI9OyN0hR/8GTfAzQH50mAj4mLR+CyOjfbrFaCBysWzmGjx8CIuI+XNmyLICJtZTII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784048408; c=relaxed/simple;
	bh=/03LafYnHnY/h+awnOY7kNUQSKwVPr+TieKjnvCbEqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZSPTWdkWgiINvvm8/UpJwwBOt0RVEaZCP04ABZv1Rv0kX9YS7lMlUnEiBgtQZos3+BiqviZK4QT1xZww8nJTUz9j7gWGC+hjy4Hqws3xohh1C2dDeaPaAdWfSZFLZqs+Jeht3mQzkzJaQE8NSZNQSuuYpPNRHWXDWwBYHulTI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noqhCsTG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noqhCsTG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D1B1F00A3A;
	Tue, 14 Jul 2026 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784048407;
	bh=/03LafYnHnY/h+awnOY7kNUQSKwVPr+TieKjnvCbEqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=noqhCsTGuMeHBtwuPT2TJrT+3ajfC0I24hTRy6RRNUN+WPSmYHTx+QNLxv6kkEVlI
	 U2PTYTP4RyguzE23uafQQh/m5lo4Jkk+F4Iy/PNAq/tph1tQRg47l3z+N1EIpNSOfV
	 6kGfrPNmBf7XUMf7lgi517bYk7SsZKkRa9ZeU0V8Vjmk9FVKvU4j9fjAbjTAnVyf+B
	 10pC6XH31cJl/ADryOHZACyO+NR4Ng0qcqTxrpLPeGIQ7UIBc8YZnhCpIuDWMtCHNe
	 Ag7jPVY6SROwk/PdJM/5HZMgP3UtW6MNjuIcmam0NVitndcmwzbAkMqtg2WDnW+vYQ
	 McANPMi3z3xQQ==
Date: Tue, 14 Jul 2026 18:00:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: b-liu@ti.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	daire.mcnamara@microchip.com,
	valentina.fernandezalanis@microchip.com, mturquette@baylibre.com,
	sboyd@kernel.org, claudiu.beznea@microchip.com,
	jassisinghbrar@gmail.com, a.zummo@towertech.it,
	alexandre.belloni@bootlin.com, wsa@kernel.org,
	ben.dooks@codethink.co.uk, heinrich.schuchardt@canonical.com
Subject: Re: [PATCH v2] usb: musb: remove dead select of USB_MUSB_DUAL_ROLE
Message-ID: <20260714-deflation-campfire-a760a0483e57@spud>
References: <20260714112047.2304856-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fzodwwu1nR7w942y"
Content-Disposition: inline
In-Reply-To: <20260714112047.2304856-1-julianbraha@gmail.com>

--fzodwwu1nR7w942y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

--fzodwwu1nR7w942y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalZrEQAKCRB4tDGHoIJi
0nOzAQDZ2j38Zjj60YxudQO5DsRIL459kXVKoOCCv0+ivNwrdwD+LWFp7bNBWnQj
wnzkXDPPsQGFRcdED7Knh/zUiccgwQc=
=IAxc
-----END PGP SIGNATURE-----

--fzodwwu1nR7w942y--
