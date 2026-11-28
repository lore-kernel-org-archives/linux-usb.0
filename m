Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852940;
	b=C+JPZ4NoIxQsWskWjdBrXCa6J2N1GSNqo12GQT2mle/mjzJU+J5d7MDgXGKaobSeVWQr
	 pqSyXXa9w6g3VWc5U7qwH8Y0YYEZAjtblfpbb/pB7htgtgO0oQgoFucdFm3cECKCM2Cjb
	 wy8s1nw+dZecIZ7zEsSigVbgAmiCQ5tOTnNHZm4oFMMskAlizIW7HDh6rXkZpd2I3XXjW
	 OEbokA95yqvRBRIWLGoShB4WLBU/udPNtFBej+2Stw72MvjSvCLxbwF5rXHONKuQcrzEI
	 on20mlzocbSDF+SuoZiMMx11XFN2SYhq8+EXQxScVLeWUhRmT5tvTlEzdsh7YV7WFEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
	b=hGpjEeEmX1EpmtmBaX1fTUPVHcO1TVJ+Tuf5l284SpbwDznRErukl9WM/B2lOXXCHToF
	 7sw0r5rnBsKBCtPJQLx0asopCAzo/XnG0q5LoSaSakkbWhSHnRrnorj0KnW83bAl8oo3b
	 DP47pTRqlyjznMw7cK7mcUdkHx7PK4AlixLKRSBrNoP1a4WxXoCcP/5xgwfYswdBURLeq
	 HLA45T6EHFIghwPpWOaUWDFxQtSRkHcjQ5ayAkIaYKuUt2iHm95kJ36LkE0yfa0CE1j+u
	 Ne0fn2yNELixdiQVPXWeIdn4Zk/8XZh+I2YBrVxFjRMmTfPy1hiVocWJKr9PboW78ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LdeAbaCm;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52588606A321
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 08:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52588606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LdeAbaCm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so54231985e9.0
        for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 00:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852939; x=1796457739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=LdeAbaCmG6aGvR2nb8gxW5A8NUpC5be/ax/tgsLkZ3JfclnVHSCztMsXwwaOxtfCbs
         Whn6R4Xgag5vvedOlLOOqZIFnO8p/ma9v3ewdMLMmUyJbXJcCYsbNL5BU8NrNcJm0+oO
         eSwAcSAwqLPgE02R/6QTtbzMaR7x4ACNhuLU3ilAUFgQLJwW15oDv2Zj8CLXGoYhlgUI
         KPtuMWxjbplrMNqe/O/GPbWscg6EDpj7foYgYY/edB2p0i/glCFuhZ0rShexO1TvOxJ0
         V83OwMTYNND+twHG115GRwZtJlnojvLS57hCFDQamb/4om6vZZDhNJMq1HEeB6yzOL4r
         qeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852939; x=1796457739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=N2ShskEfTU7acBI6uwNmN6X4JfKlhw+dlXlfV5zRGyUdisLny5OHDxvSTmeSAQb1EU
         JSu+3hBuVNOprXktA/SOYC3V/Wpqum2TGu7Hjc1hV2wLo6shzde1sFXnrh0eqXLLXC1x
         OSKslF4M0cQWhddbiMIPk7dlwmzGfn6ogpn3AkcTSxBn4aSfZdUc7N/E1q73ctyQ691u
         b8HJ37KlqhnWVxULZtHRZ534l7GwJxm7EIL8DkPrpK80I8BwjnarIsbGFCOhZPoEPVmp
         9JF2XmwiGYAHYrl3R5YjcEQS71DfiNvWGRUIQRc9HIelEDDbHriBfT/4Wd23R2d/uobG
         oPOA==
X-Forwarded-Encrypted: i=1; AL+hErGqduZJXIdTxCyo6z1Pcga1WsjovuS2jFEmP4hRJh0lAFFvilwDOpH+7ph7AEmuvyiw1il3/Anxb/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qpgE1zI28jAe8HZ54p5HpKz7JkxcnSLeHll52+fj9MMQllD/x
	BpI8N/62kCFtOJW8SCXDRkNszzdLzzHo/f8T8RzyETdehUElgAkGAmTe1szBihLgBII=
X-Gm-Gg: AZFdTZflNGv47H70Ki4GmD1OxIsoRIhIyWl258k5AuG+5c1/vL0D/T22KKIkZMsljH/
	08qK6pS5F20FMekujOIhnX91EjPXKSzWqmLIRAtcLZGKzbY6A9AujPkNeCUXL5Ii3GqBC+iaGMr
	sdt3fgtHHi+U5tnAoo8a7B1wabfuAdUXUxt1+nGnM10WmXyXk0zCe7WwqU9Tqkr8la9aL7FpVmK
	M9+N0iyHh8h2CY+fpbqBFgEPQb97uEu9GzSvNeZdi2mWeURgf7DcxgtgLISCSuQyPWqAO5Y0lkJ
	NzrvUZ0NJluzkKnhhoUlbtMIqHKErcRu45KS3BQDTmm4HNaEY1aoZmOUtz2er9GfK2ywXRSApHG
	/0AKuhG7oudOU3ijsqd6KlGRcWycplJQ75NKnB5WF0sraS5SqS0JnOAsnRII0JqwBDkY4qiN9Z1
	+DdIfBDiXpCKDnakUuaTsmOsQguV69hfkCpOaEFCbpjifIL0ZIehvPu6ojGvFvD59NKkiwyUXa9
	IrvdGeaVOurUeUa8R2u8GsncQR4/jFncg2yjolutc8ABJg43YYzDoWKLoVIc/mhdhjaSl2TmIUm
	88PnRsTRsHnTETbavLHMV0ChkgfIJ3p8X7OrMkxXlw/QrmdlkFO21qiKcD7BLFNacTdNFLwHwgw
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr505581765e9.9.1795852938637;
        Sat, 28 Nov 2026 00:02:18 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf680fsm59330195f8f.14.2026.11.28.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:02:17 -0800 (PST)
Date: Sat, 28 Nov 2026 09:02:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
Message-ID: <awqKD6EufgpjsjP8@monoceros>
References: <20261127073231.1776847-1-alastair@d-silva.org>
 <20261127073231.1776847-7-alastair@d-silva.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xgu3d2pgo3fouvi"
Content-Disposition: inline
In-Reply-To: <20261127073231.1776847-7-alastair@d-silva.org>


--6xgu3d2pgo3fouvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 06:32:26PM +1100, Alastair D'Silva wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> provides of_device_id already without the
unneeded build dependencies that <linux/mod_devicetable.h> comes with.
So please drop <linux/mod_devicetable.h>.

There is no need to Cc: me for the next revisions of your series.

Best regards
Uwe

--6xgu3d2pgo3fouvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKioUACgkQj4D7WH0S
/k7jYAf/QI/UwQ7qh2BbAqLJFatOOEv5i4Gi+vBVMqy7v16wMvrk3u7U4/ECqS/O
C2/R+NZfyAK6CTe/5t37K/v9LeyvsEN4IbMSK3b5rwXFErl5KgfUZIBdgbD/1BJJ
UP2X0g6ABsQZ5fNkNJXk8nerljU4Pxf7OUuWsz42+HHHKiq9AcZwAZgrS/TttgCN
xeKamMt2XFYPMdjOhAhO57r/l3qPChmlWbT2bDdzM4i9nTyLBXrDRghnJWItoaN4
puwi4x03yymrmDrp7IH2TYfNTOy/Lcc0OcjvpqxxhIG18CeOOMBMdMXQofE0HdQ6
Htyr2kbi6xiqECUEVFTnuPE7uy+hvw==
=iKhd
-----END PGP SIGNATURE-----

--6xgu3d2pgo3fouvi--
