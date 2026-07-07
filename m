Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BA377EA9
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414036; cv=none; b=up+yC9aa6wBCEP8tjaT8+B6zXoacfbsp1NbI3ZVbgSm5gymbO8LR7SSo3weHqjjSYmUe5HPqVMIM7GAOSgDirTB9LSb+COd2uEc4lrYRaXxJoPXNObvmJlQGWYkQFM7Sxc4VYLItbPT0TfMs+x5CYaZnSeztntYbARiL1n4RPNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414036; c=relaxed/simple;
	bh=HaOi752Q9s2ZSB9N39UHarVB3ub30pD1pu6mhX9wzR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azTsjiAF0AuW0m9BGA4ie6QpSoU0fLCrV5VANtUuKL0Epcj52HICJguq5cJPxHf/JM3FfWS7puSZc21no3kNApTATCCDs6mLU68m8fidnPFPU41G5tWzFrkTjSH2Yu0g6BHEcFLyWl5Jc4Gvw7C8xjK9MSnDvBISpS+7jgqd+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pQ0dVbro; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pQ0dVbro"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC74AC8F1E8;
	Tue,  7 Jul 2026 08:47:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43EE2601A3;
	Tue,  7 Jul 2026 08:47:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8465811BC1043;
	Tue,  7 Jul 2026 10:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783414032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0lSkUa+KkQqtCAF+/jdKYreuMadWhG8lO7heGruxMro=;
	b=pQ0dVbroMRf7GY0UHRhG5MaRCZWb2znR0AsK0vR86XnaJw8FSO/DBfUA8MLMzgayhv9d9I
	EPTkuAVvpdjV1mjRHIYftgqvuQar+EaaZtc0DOCsW/+wqrFmz3FpS5qo8kD11g/T5qj5Ux
	seJwNNID/NYtyjLyBe99aeKHKbM4VZkMneYx2acgoV4GGAFASmQq2fyOZNSm1WlMf6hcBx
	tJQprYUN3VzftWZdZiTlOb1Rs6gwURxRwmn0X1B6I9zSZWyulzuyM71U1iip5KJIeyA3Ut
	EeZenWJ1k5uk4ZQJy2CKYSDvZaHIm9ezotW5qrl2jeREJpPf/L0gGO3tWzbW0g==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] usb: typec: mux: tusb1046: add missing MODULE_DEVICE_TABLE()
Date: Tue, 07 Jul 2026 10:47:09 +0200
Message-ID: <-fYRkNfmRlGE9g_eYnGyjA@bootlin.com>
In-Reply-To: <20260704124714.18404-1-pengpeng@iscas.ac.cn>
References: <20260704124714.18404-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartq-o-TpzCTpaCB9Fv4LCScQ";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3

--nextPartq-o-TpzCTpaCB9Fv4LCScQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 07 Jul 2026 10:47:09 +0200
Message-ID: <-fYRkNfmRlGE9g_eYnGyjA@bootlin.com>
In-Reply-To: <20260704124714.18404-1-pengpeng@iscas.ac.cn>
References: <20260704124714.18404-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0

Hi Pengpeng,

On Saturday, 4 July 2026 14:47:14 CEST Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> 
>  drivers/usb/typec/mux/tusb1046.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/mux/tusb1046.c
> b/drivers/usb/typec/mux/tusb1046.c index d6e1289a4945..34ef81f75693 100644
> --- a/drivers/usb/typec/mux/tusb1046.c
> +++ b/drivers/usb/typec/mux/tusb1046.c
> @@ -178,6 +178,7 @@ static const struct of_device_id tusb1046_match_table[]
> = { {.compatible = "ti,tusb1046"},
> 
>  	{},
>  
>  };
> 
> +MODULE_DEVICE_TABLE(of, tusb1046_match_table);
> 
>  static struct i2c_driver tusb1046_driver = {
>  
>  	.driver = {

LGTM, thanks!

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

--nextPartq-o-TpzCTpaCB9Fv4LCScQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmpMvQ0ACgkQKCYAIARz
eA5jFQ/+PmB9sEVHPdZTcTi5VobJs9Ss0SuWj5d6uzQ+RM++lboM7C7h60P9ibHE
aYJtgLrQvJnmg+OBXdwk3hX41K+y70HcIoxlwbl/SAv4YBQFnSZsagnQ0yi4QiTN
12nYE+UtwhTJwSWmzxWbZCnHP0OvSvEUuDIwr3WRldbgtEGwlkMTZVvKPJCIZUsW
XsuPrPLIhwJUyUH0feYQsp8mjF1KLjql2KV+bS6637n+Fh9RNts3b5WVXcLxZwcl
nuAaD4wnxNa/O3MnV3J2DB8EwuOGLXQMegWcs0labPGTTa6fKVqWfAtGnXXrwqEe
WhIVppFISGwzJ9GGtne08YId78wqK1RjZCYoae906FHFCtwmfWkTKUx527cf9Ht/
5FHhkSXmDatlUFPYAoyg9kt0BYmZoOmOVBd6ctjojyWBTUgnKUN3gUZD+STTeq6M
nPmU0Kbinu+VxG1zfpd/eF+/w9cUpEBeAtsrZtqzMszmtK6f6zm0bvba51Im0cV4
TGgDWxuB86tI16r4Y6J9pff1D/dHPs/gr7JBC69w8tcyGlWezXZfWA5QQHLAcsNq
IVSMjgd0sFa3LAS007WirIHY4lCpG9Rdg5BRlapEeW855Pocb/9/MqumdxbU5LVN
GNTCMbypM4vCgm3oQThA05BFLsHONtEpnd5Nz4N5c1Rb52ozJG8=
=SkRt
-----END PGP SIGNATURE-----

--nextPartq-o-TpzCTpaCB9Fv4LCScQ--



