Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2B2414A3E
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769980; cv=none; b=UbgXspKv8HsgB+LSawj1UtZJSYrSqIzb80hvEAsDuM5fOwD+hhBwqx4h+EPRw8KzUnDvtLLqaZXRAe9oP2cGF+GPwXujOOBj2KymLXdkYhdzp9H3kZ1PloEBHHurzjrhxllT9rTcu/o22NTXUISkUx1eEFHvyb2xeqli1RR+lC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769980; c=relaxed/simple;
	bh=3vtIMbYe0dxXQg4HGTmjD4UpnxkAM1+Q1cUtKCU5Vq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4EWYMBSWpVdDAenaFb1HE8F5KIR1QtALY4KxAOryUOw5krdRhLGJAcQK7g4N8ePrdIM+OjyBVv6FbCwsVK2AovVOUPaahnSdu5CxO8cWIMlmSXt5n/0XQuJBaL4/bKDTrEY9390agpaUyIsyHBf6KfiEWCNkWgEus+6QTB5pwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NOmTpjhe; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NOmTpjhe"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482dd6ee390so3718873f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788769977; x=1789374777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1zKmOTGIIL+pRRxcESuIVFMk8iKWFzVbSRpyStN3ws=;
        b=NOmTpjheI2TZwvavLhjXmCysXfikFgDFGVah7+rRsb2Mx8/zPGZiQnb38FAImNWhfM
         ULqvYlfvnKwGAK2IPAIL1eu7dky7lLEZRLsLFHmStAkNNSjaOXReQwWyOnH7PuRfPQ0N
         BVcUmFcY9n68CVei/cOhyraEjUCNbb4iuxi6ZCcvyVz5LKrwPB1HNIs4o/jYGB9H16aJ
         1FtTDskJZDfGXMg/J8IZa7H9VmRy2fbX3BllMNFTkMT9ICx1sWspM2mlE3OeTfqC3AJ/
         10J2BcYnqoaaSLjUwHlzMvdpHHQpZsBa2O4dRQ7s7gH88aSD9feApwtpPmDPxMdMEVBz
         CooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769977; x=1789374777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1zKmOTGIIL+pRRxcESuIVFMk8iKWFzVbSRpyStN3ws=;
        b=QJfg4uunzzEjKmnLMidBX/TRfG6JX/C8v8GA+OFYUTpvjQuESyII1NJp4WLLA/LwP3
         W0sygRhIYI1Smws+T24yt16j1w+TrLVM2hiphZ2qeM14yNauNx3+egHqOl+/4BVc4Gtw
         CYXkp8GShOFlki0LgO3auctrTv/DKn8OiIfysRXYcb8bv2ICD99F2Y+wxP3ks4IoWIok
         Xc0aX7+HYXIXJAgHY3HvFj7vfKuMcl0p/Iyp39qnlFveCd2Pkap+nVyX6YscXQCBqsJ0
         UV1pBl3DTXKcdnQ+6TJTnqDZ9khI/Ybz1cblJDLC7pBbNpB3kcyND0Dj/9XCf0Fa0y4s
         agpg==
X-Forwarded-Encrypted: i=1; AKwUvBy2jUrHp1zJxPzLS0RNew/QQ02R44k+N72d5LTt5oqQ1uFk+dEf/Rtcheqvo+B22r/uoKHp9kS2Lpw=@vger.kernel.org
X-Gm-Message-State: AFuF++lEAdHLBDc7HJtRxNRtfLlwyxFO4Lo/oMhp1jXng4aytIg+gUA+
	/BFaT1ALK7lptsuYLbZkwMdpz9FTj3WcVi7snKxJniOnouq4qwl/HkAM4SJhqBhQlPA=
X-Gm-Gg: AYBFou3ABk/C3eBOIG3Vj37iIagrRLlL6bBbTTCveCnQ0HnY5DD3wp0cDch+QvOGVOJ
	7VvEg/tCX/+fVKbSAZ0YcxVkeYX2EtbcVRv4KPBh4ghTa1wu5eEViABHDSYx4UbyPX7TGO9thft
	zXnyuKOeXm9nYa8UwRn+Lk/ZN9Se510cOvfF5MGYXJekDkDuouUP6uPHFs5N9SH0bQu28dDlhj1
	EBrt5YCZyj4Q7ZS9AdXrWL21tpL5d1F1pev1aAbOZjThgGjDfwzmk0Ljj5ReB1doETEdrXzjNjx
	wMqhNFvtcPfFPsWriYMXzWiwV01THgfwJh0HoddevOTFBc5BjtEEi69tmW4/905rbyx3nsWfA09
	sohb42g47HAG5MKzr8EDaW7s8SgBkGOMUL7XU5twzXK/JLpxUBiivsRczTkfEhRE1IsOy6urkfD
	/JcWeJbwJDz9zbhZHn7xOGV4LI2d3vXMPZyOY1oDtvFH3rKmMAGBWZvb0KJtYjPHh6scs8GPZZ9
	PGZlc8d0NP0AruVjW4lPqaIPT8fIsU3TkFu3mXrZkNI2TqM/UI=
X-Received: by 2002:a05:6000:644:b0:485:847f:fd89 with SMTP id ffacd0b85a97d-485870506d0mr24554219f8f.9.1788769976952;
        Mon, 07 Sep 2026 01:32:56 -0700 (PDT)
Received: from localhost (p200300f65f19a9047ae53bb37ada872a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7ae5:3bb3:7ada:872a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-485883c6ba4sm30820390f8f.25.2026.09.07.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:32:56 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:32:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <ap51p16bSY1Ru9C1@monoceros>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
 <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ho4liu3hrz2gwc46"
Content-Disposition: inline
In-Reply-To: <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>


--ho4liu3hrz2gwc46
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
MIME-Version: 1.0

Hello Shawn,

On Wed, Sep 02, 2026 at 12:59:38PM +0800, Shawn Guo wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please rely on <linux/i2c.h> to provide of_device_id and (see below)
i2c_device_id. Alternatively include the needed files below
include/linux/device-id/ to not introduce unneeded dependencies.

> +static const struct of_device_id fusb15201_of_match[] = {
> +	{ .compatible = "onnn,fusb15201" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, fusb15201_of_match);
> +
> +static struct i2c_driver fusb15201_driver = {
> +	.driver = {
> +		.name = "fusb15201",
> +		.of_match_table = fusb15201_of_match,
> +	},
> +	.probe = fusb15201_probe,

Don't you need an i2c_device_id table, too?

> +};
> +module_i2c_driver(fusb15201_driver);

Best regards
Uwe

--ho4liu3hrz2gwc46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqedrMACgkQj4D7WH0S
/k7YgAgAs4m8lyJ4DHebmlSmZntV4mxfgROfhi7Uwq7HpI6Zvchr6fGHr2xXOV9F
nWYl8ZJ+ADjYZ7LaAHy3nSz8i8IeAQst2+FhnNS+USYuNKfo2uB7I6/I5eTWbwkq
4hYvG80vost649UpY9qeQ+V+Ya/rh7q4ipYctOqYGh/lsN3KxiWpQdX74vBbdWLF
pRygWfOFX/jY3/x1WbPTU3MaXqexQvnkTJbIH6iJI+oBMyQ/N4emnBf/RlTpB6Xr
EXY4Ctpi1sy7GcD3/MoYNESHR9+fR1GLsGNuNq4b+vS2zIY9KLAqrAIdjOZ/EqlQ
3aWssAJJQhcD2K7qbTLjoe/4CPX8QQ==
=hzRz
-----END PGP SIGNATURE-----

--ho4liu3hrz2gwc46--
