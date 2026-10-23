Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751995;
	b=CsEVISVTI5aSFJ4I1u41fI3d6GdM01MMpi+0vPCTj9gc+qP9zSu/6T3g2rqxZ8qi4mhM
	 oMBmFGQRbaaQqt+n07iWmmDRTQiIyyeU7tiF8bTv1kzzGl8LPqZWcAgioXHrjtrZy494S
	 AxMrpXsMkh76MP5pnGA0BRjxnCDt/eCK+8P4IzPNWL3gVUY2ZqJ9VT1PAtJB8O6lqOBHf
	 FV/OeJLEHjbqw4h8iprs7FvautQfE2QCqOOm2SxS8AFXWWN5qhKIofhh6PhF3arIc/+72
	 45LaGLoAPR6gD0b5dtYT38rG/u0RUkNp4CRXmTzketqp3cU4JMVjE4/Exiu8P3xdsTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Organization:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
	b=OkUdO/VxMRtbUC68He45Xb/XYiNKyXvymRiZWYm6D0PBzOlbPJ/qsswZCrzeTGZfmR44
	 4gQX5NyxxxQYX95+cyHJqcKqQweEesoXuGepMz+BpPZu3OZ4ya3xDxPFGtsLL8Ee+tLVS
	 p5VmAWVypjum9bFgm/vc9VJXunrbzOJwHIdjpkAzO2xJc9iUWqppVa3u97nZklpJ6J71q
	 AD9720tJ16fiyp4MH/cHeQclL5VFSIBiSWMtL2hpPrWHICf5eKwzD6UMArIE6ygEeJuCW
	 bQvpOh7cG78vEM8676FZAQr3uB8A+Y1x8644X9HhcxpEk1ZatNh+xZbo33Ploz2XXPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrhlYS9J;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E4606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 10:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrhlYS9J
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso780185f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751994; x=1793356794; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
        b=QrhlYS9JPq7JnApjBXfRmjqqe4dNo2BW1dKZxKhsHlgdnG8+5QiIsK+sTo8d5NTrR3
         uWL3U+s6CEPmNkiIqq8g2iq94WIayXCdetnfnmIzsQJ6Fb0WzeJ88NN4n7lAwX5pKl1C
         YZCnwU82I/rXc5kk9r85ZYypjhDys7+VJfnim8KgFjDHVq/tDqBu6h+JiplR2skAxuPU
         EyxVXPRizn3ISu46j7omzgg8DbvKCwxcC30/pjVcFjQ9HkAGMWBAN/xAJ5yu0MIi1o3K
         VhhP/x12m9ZrTl6La3MGoRKwN+cZDV/qqKuKyENAmh6vD6S5wXAZEVaGJiAq8ERCgAXX
         8zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751994; x=1793356794;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
        b=R9LaN7gfSDRtIpfU26hFbqUARp4Qq8gH5xd7zm/FHtbY3VwPqocIATy0Yatr51P8Cq
         KxiwjrJPrR/s6rPNowH5dIekldVQgSYtUEwp3ycrPeo+7/vgVaUy0krKEuCmBI+DKHN5
         nwjHn9Z8N6dr5wT0SKw7aL7LUwK6GBWB8qDooXb69LsMvJtwnlLEc3jHMzm8EkX1CP6s
         RIHa+lVduhyWtD8HoNQP1GjVm0QPJeWWASN8FzV/hc068iYN0ovdwIegS0rHkZsRLNFW
         AJt6SptNilaUg9JQNIxknKiR6Z3AvtfCt5vrCvlY9Ca3LDzmwoJsOwBL/aAmseseDa45
         Quag==
X-Forwarded-Encrypted: i=1; AKwUvBzjswIWG6QnLrz9cr00LFAaxF3AUkM2btbNU3GtndkZd3Rp3CLPnDkbHd1KRqsUgxxPF8gtXOeITQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhNOojniYtZxCy45e5B1ET2xLL1HLTkbMBrdtRCVTtjMxNcJs6
	yaMJpItTSes4tJJG/6Hm9BJjy/48Me/u1EjEc4OEX9PReTmRuVeEheFLKzXokQVQstM=
X-Gm-Gg: AYBFou1BA1tJjrjrKnMKMx+lanZspjzRlicp2lMVo8/hnRx1CDGZ6sze+6bAbJ/U8I3
	1b5aI+FZbLWhg3F7W2/lt1sdKA4IcvYqhnZy8Q1SwBnYC/BVhISX8z6sBCXsQwgKqxAFMVa74ga
	eVCMPOhzKa98toqv0IkhjXVrDRA9++aYphVJ+dmjNGmxBaGdQGhoPB4ajGWhwX/3Qp/gbuziu+v
	8L2Xsqg9VNXu9QqrfCbu4jNXyVUfWcAWirQZ/KoIKcI3HWJF8NQI5P7qx+XkJiUhziMqccI1j1g
	8SciOB2rKeFEnXsOFlarG0O0yeR3r5SippKaxVJJ286l7eJh/U/3+aN+aZ7FQXwMUInGA2C8k0K
	kDppoNM8YaoLshohi5FN8+EOPUKCOK4hSFTMmpqAr6RpXelXTD3zD5WSJmbJPo1hb7iz+JHeMZH
	Mb1TyPafzQK+X4OU7I9pnjfLpKH8+tgJ32YUGg5O8UJpCA/9oydB2lMP1L3ubYYl+5JC/t/V0Wl
	TAl5pt/s6mzUudiEZKg8yvt5hJUrJYDdI04eXnjb995xKWJm/W+9zxVQiBNUntVqsp03Vb1bUEs
	Tl6+NGqWKJLB/oBprxzW
X-Received: by 2002:a05:6000:186c:b0:48c:6cdd:ba89 with SMTP id ffacd0b85a97d-48e385bdfeemr2784852f8f.36.1792751993862;
        Fri, 23 Oct 2026 03:39:53 -0700 (PDT)
Received: from ?IPv6:2a0e:439:c2d1:0:bce8:4acb:ee53:8d19? ([2a0e:439:c2d1:0:bce8:4acb:ee53:8d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce4fsm4566663f8f.6.2026.10.23.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:39:53 -0700 (PDT)
Message-ID: <0bb53b3f00e9a1a834e32979bd1e08ecc4517411.camel@baylibre.com>
Subject: Re: [PATCH v2 1/2 RESEND] usb: gadget: u_audio: pass channel counts
 explicitly
From: Francesco Lavra <flavra@baylibre.com>
To: Kyle Farrell <kaf@nwlink.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Fri, 23 Oct 2026 12:39:51 +0200
In-Reply-To: <20261016162534.384844-2-kaf@nwlink.com>
References: <20261016162534.384844-1-kaf@nwlink.com>
	 <20261016162534.384844-2-kaf@nwlink.com>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-16 at 09:25 -0700, Kyle Farrell wrote:
> u_audio currently derives the channel count from the channel mask in
> struct uac_params in several places.=C2=A0 Instead, pass the resolved cou=
nt
> explicitly, so the shared audio implementation does not depend on how
> an individual USB audio function represents its channel configuration.
>=20
> Initialize the new channel count fields from the existing channel masks.
> This preserves generated descriptors and makes no change to user-visible
> behavior.
>=20
> Assisted-by: LLM
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>
> ---
...
> diff --git a/drivers/usb/gadget/function/u_audio.h
> b/drivers/usb/gadget/function/u_audio.h
> index 9512b8fccfaa..46e1d6b5ca4e 100644
> --- a/drivers/usb/gadget/function/u_audio.h
> +++ b/drivers/usb/gadget/function/u_audio.h
> @@ -41,12 +41,14 @@ struct uac_fu_params {
> =C2=A0struct uac_params {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* playback */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_chmask;=C2=A0=C2=A0=
=C2=A0/* channel mask */

With these changes, the channel masks are no longer used in u_audio.c, so
we can remove them.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int p_channels;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* resolved number of channels */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_srate;=C2=A0=C2=A0=
=C2=A0=C2=A0/* rate in Hz */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_ssize;=C2=A0=C2=A0=
=C2=A0=C2=A0/* sample size */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct uac_fu_params p_fu=
;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Feature Unit parameters */
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* capture */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_chmask;=C2=A0=C2=A0=
=C2=A0/* channel mask */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int c_channels;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* resolved number of channels */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_srate;=C2=A0=C2=A0=
=C2=A0=C2=A0/* rate in Hz */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_ssize;=C2=A0=C2=A0=
=C2=A0=C2=A0/* sample size */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct uac_fu_params c_fu=
;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Feature Unit parameters */

