Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697373;
	b=FBRRTLGIxncXJ0eWf2PbqTRYKahF5Kj9W2M6bo51P0YD52Bfj+fvCnGK5VTbNVOrNl79
	 sDDclphFCyVV1oIBuHJn2FmODEJjvann4aI7DrQ52HbVurGkK5SKkuLwK92a+paLjjJSx
	 NQ+hbXt6xN03UjUu0SBfpauqxUhGPmrbcjamkRmxBbndQoVzDlrSf0ddByMhpYsyRQzut
	 js33O2BpMU9Enq+wZ+MAp2y3L9nBbyDiTmHQKMwoKgP15F0FBsx1iVXzcInJHuCl/9qPH
	 +ZJcIXVS7DXo2HDtdPYaDYMyYh2p0Qy2+1v5zLnjoU3pLvRn6AQA5dzbJ7FBPY5L/bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
	b=cAI1+2ShVbxFk7y5OE3Kw0Q+Gy3CMpoUVhgaRv6Z17BrzkycQIX60SgvhRjvJ2u3alqo
	 U5Qii9Xu4W2xRqEV0THSgXj+T57cpBo/6pbCXzknbuDus6grQwJcauPkHd7HG5vhBhs2e
	 m7EvXKY/p/aq6awbcDlwzvT1Av4IoIfn+3rzTGybb0oYvnR6u4ZhFuWYfbQHzOSS/fIzW
	 gVM504a3awgK+a49raU8kEaECTC3WtFVwnGEddRb1Kvm7oY4S886KdOqprWcksHxaf8WS
	 peDi7fn4yIV+4ZRZ48H3U5t+D4GjGTi2Oqp7rK3a5OocpxOJP4IMBSoMGbuKDHMPyiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bvyXLUsN;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C249606A32E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C249606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bvyXLUsN
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so5437389f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 04:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795697371; x=1796302171; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=bvyXLUsNIqR6c+7zaBgO00QS5lwpt1s8YI+73qDqEW6pwpGMj0ZCG4Ele7FK5wO/1F
         JdRPOi5I+Fe2iOvU9908OPnaOE4MvdcMKW0PujeyKAPTN0o2kyInJs3jSZ9Xic+BULOV
         bm6WMOIz40qlEG5XsT8W48Bvt+uKsoXlQ/ezrqjetJxoFvgtGTjfgOMA1xNc+Q3wIxfb
         ycf9DbfZQstSMiueaJkccFvkEyp147oqwStk13TtdwdKbGfpGc3TDViSipTZzXAVDI2f
         upaPR2+y15YGvAFLwww3+uQWuarmTPJMp9bZANDRMXwB6953BI0WpUmF7Oy966ac19uL
         m8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697371; x=1796302171;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=Ro6cAA4RLKyPkCE2ZGbG8IMlPTSOx62mlZopIUVIUJgcuGKj4hLDYg+MfMEHN1K6JK
         iL1ale831SLCBoHoK1GDbuGhO0JSVH0nerV1pcxnLGcLalU/IUy/oaeqNgAuNiok77Zn
         8rlh9mzfINDQAc2TtUugOhSALrLkGAcQ+RohTLLUx3++dJrlez0A9l8u7+aTVEJrJ9ux
         YwKoQp0AApdVlbEd9b+9FFsg5oDclL86SEwFuJ0oTtfRkqibPD7/QMs/5x7h+h5yHy2q
         5/kKG+vIsOwkEbji/ifKsV/DbuqDQVe8/dGlq9LrZHjZAnFfjVNmin/o3O5Tk9wdU3MN
         h6vQ==
X-Forwarded-Encrypted: i=1; AL+hErGx7E4zDYGWs3L3hiqEzFcl6IcKQNfZkVavssW00sRtpcvim/3eYaaIH1l/yfv0Upwzd+EFfIAdP0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mwQhi2djCT+rU5xIasgplwOwIpAL9uIuhYuNmeZorc3H0GQlo
	0z3MVeGnK/u9CYp9M84nPFSizWq0B+3mPhHZ1b0Z8xW6y6GTbuQGOZM/m2S6jS2yoBw=
X-Gm-Gg: AZFdTZcl+Y2jJ6s3sW5yXLBTPQuiPnsyCvpiG8PfVG+gSHkmNaCWsruOASLN3rAxufz
	4zeu8Y+LOZAedJWaPOyKtqrP0bjtQd3l8ktrdkm9ukah3iya0SEvNFnUHaEnjh0LKhgEnAz2MeP
	WKr/Pl4BsoWM5qQo6okai4mfRr5PEfxld2caS9LqPRZd7DntQw4qjB3JM3SeZOHC1VaW2O6JRrH
	Fs0X2MaePiZw1Gl1fF8aRxZUbxkMDCXoMEkDmQ1KJay7PCkL0aaO6vHYEM9QKPchngQEwghpVN6
	GyZYwnhxH2jMRNdWOrsVwIQT4e3B/E4YzlcBQqd3Gab9aq0cRN/UhSpBbObh3sKquV8ET23kl9e
	GJAGYHIp2gIC7+rUjH4501aWFwAXmOJZHRapQaYNc2O0PnD/yPuU/G67mN8taAoac5dRg0TqwfK
	wXUYK5gYomSDz8U/M/9mRsW8T+7bpCKQQIJ++z4dhh/zPgq01ontSSzpB99wQZ+8Nl0QJcmvvxx
	WDq8C+iHoWDUzSR1QFkBGW7swG1VAEy+UuQcf4WnorCxHhw0SXe+6CXz+IrCslojZq4Vexi/QXd
	FFHlAyxCF9mCfg1ZAwzy5I8NvwyJFUlTAg==
X-Received: by 2002:a5d:4452:0:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-4abb5bcd524mr32707915f8f.53.1795697371481;
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm38969506f8f.36.2026.11.26.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Message-ID: <b1d73b2f842c8827e6a2a0ed6dcb1d0b979265b9.camel@linaro.org>
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Frank Li <Frank.Li@nxp.com>, Sven Peter
	 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Peter Griffin
	 <peter.griffin@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>, 
 "linux-usb@vger.kernel.org"	 <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org"	 <linux-arm-msm@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org"	 <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Neal Gompa <neal@gompa.dev>,
 "asahi@lists.linux.dev"	 <asahi@lists.linux.dev>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Nov 2026 12:49:47 +0000
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
	 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 22:59 +0000, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
>=20
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
>=20
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> =C2=A0drivers/usb/dwc3/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++-------------
> =C2=A0drivers/usb/dwc3/dwc3-apple.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
> =C2=A0drivers/usb/dwc3/dwc3-google.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-imx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
> =C2=A0drivers/usb/dwc3/dwc3-qcom.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/glue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++------
> =C2=A07 files changed, 27 insertions(+), 32 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
