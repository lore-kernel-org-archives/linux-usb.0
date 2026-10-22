Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664667;
	b=hgC33gi+CGn0RJ6d9ev747WxXwP5Hsmns0iNiR3e4kTk0IZG28HgfqEg0uRXJJXaVPMG
	 3ANVEUkeTM1DJF5oiSFm+dDO8KCfTLn3Mtuu+ghX9bgQ9UG2Vjb9NU+WTHEIRi+EbSzfK
	 rki7hxQBfPX4iYa2S55JvhagCmiV241IPByJZt7FVFqfOOrxnT4a43S2yAvf2EJqchIrn
	 8NM/j/LhGNk2epAX9PnN53+mXYTysUchCejQTksa5+uggHwD+Jl7/9AUuvlVS+uXCshz9
	 Hh2JP9qAm6PX8oBChFPrfKhXQali40zzS8gBcnpt3Wlm331sR4ifBNy46k0tw0VcHqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Organization:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=jdwPVJavhkPjkAdhtGK5hpqRdwlHIJ2X3Vlleax6CyE=;
	b=a0rXw+6EKqsBcRtd7jzlOnvyDDEpJvOUO+vnHZe/IhvnZFMCZSOc4H6vfTn+nmy9x7HY
	 YcxKn4unyivr1ehkGr1rOyxUXih8REx+qzgRyPkCitsaKEqRB53gfs2QuLMIDN0Ngqa5c
	 dV/osXqF32dpes0/aybRFvSieEyN+S86bTpdBXw8yNnYSZ+GSlUiCkF9uw4saoa5aGV1r
	 oxgBbuCkM9ECgIgt+vg629OQFEQZkd/4YsADLCQcyn6x3UV1lzWhX2UH0MCdpAl1+CDi0
	 TET7X4Ae9sKkb1xLbHUA923coqR6Bgpv0t4PtkSgZnz44qfDOnYbIZpGqUuGm8K/dWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=plEe3jBc;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79A606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 10:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE79A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=plEe3jBc
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso13936845e9.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 03:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792664665; x=1793269465; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdwPVJavhkPjkAdhtGK5hpqRdwlHIJ2X3Vlleax6CyE=;
        b=plEe3jBc0xQaXh/Ty0vKnf9UJx161m1G+p/7xDxAcdG4wzYmUcLLia6U6+a0Xi6ZQ6
         V6SjiOXfamYC7ACD0s0EjpQTSm4ryd65y47af5utVx4MOOzNhGwGtKnEfLxZ7Kqk+1Z9
         qjjENd9Zbh879BrpL1ftWztC5jBLyXfe4S0/zF4kbC8pyuFo/ay1i07v2Ko5kmTUtCup
         vXa+1jJokTM8RiQsHj9zFqYSUU0i4qRDQUz/Hdf+c20W7u95SkWfnOOm7lnYAttrEF5H
         4KhbbO8SbDvMvKOJSKCu4B62SBKsZZQsKqZvqxywCmtgq/ve9iRgwDZKh3BEt4WS78gW
         q4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664665; x=1793269465;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdwPVJavhkPjkAdhtGK5hpqRdwlHIJ2X3Vlleax6CyE=;
        b=RqVqhPknSFoYDrtJxJlBwSxpgHLmTm1e1Hm1rqrnHfziThzLOIQKOvkXx2xUkbOEhM
         vSNaGaEd1zQRUsKbfdCsF29+4VBUI0xAGj44ztxcR0uIgaesT/qICf49cyeQ95cfH8SM
         tkATHFy7L+Y27UdfQ9zOc5LBXAsHMNRntabJC3CLtDqmOdAE6+VFM3ZradRKp76rvQxa
         zR/LBmfmDQ58VZbSlnz5MImch2XxmX5fY7L/FnXeXsyyPHHM0HI6GQfI3eB9YEXiEaGy
         PKBOveFmn6mJ5necYG5x20QRqsTH1xjVJtLd1WJI1ZKyQ/Bexx7WZzweE2P9lhxO0dJB
         CrZQ==
X-Forwarded-Encrypted: i=1; AKwUvByl30p2BYntelRjH1XMZgVC18d3iCygZSKiT7RtUM+3AL6zj796WxjOI854E84Febyftd+Sb7Has+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlPNjJcmbIxR/YRph0ojSge6+hJ9IBoS/ygj+0oZrLTFDB5moB
	j7LYaDtx+r8Lab2IOlpdu6rRHG9wuC3JLkqbV26ryARa0gke4TQVRyYbvVBPbKctUHY=
X-Gm-Gg: AYBFou12wW8AuFIlX60gkd9grhAfTr7Kj9XShVHMHqNjOhR8qT9iP3ADqnLOMc2t94e
	LgW7sGSK1PTvn0qtK8aH9uyO8hJxrMLNBc158yjb8QTcWy9vtbGeqykqsTkfRMJg2Y8exeDKuGT
	9+Z+i1WZQ0IjHPJXYuWsYdBlE7cRBhckwToym7ffH5JuRDmqoOxZXw2G2F1zLp+a4PHZ6MkISwz
	mM3J35IbChnNQs7a5rlKNawI0ELbK4A2epeJwKga7wQhLHZcxcZ22OlKt+D08gT4Fr2Cm7QLzOo
	ytf9uhUVayIKReh1+um2xT6R2ITn0gIgMmGQwyee62PMJFoDF60Wi/h7k5rLKVYn7BBvKCk8XxJ
	T4IZ1stGkzUxfG5092SpnP+zCIhre1irnPVmyTm6qwegUrS1D38/sI5Sxg5+ByYDG3/widOBBvE
	BXBBSF+rzuzP0yWvGNlHxOlPRGyt1j47WORun/7QDIdIhqjpNEC+vwL8UCHqhEMYg1ae7mw2+h1
	TeHXcgfiJocxZXM9I4pgpZV2RDVSqpDlweCHa+BjrumECzm5hxSriMdDUmsd4tVbvAau4WpgI45
	d2Q1L1Te3MM8Bdbc
X-Received: by 2002:a05:600c:4f50:b0:4a2:903:a220 with SMTP id 5b1f17b1804b1-4a20903a35dmr22703455e9.1.1792664665114;
        Thu, 22 Oct 2026 03:24:25 -0700 (PDT)
Received: from ?IPv6:2a0e:439:c79d:0:8b1:fc5a:8f54:4a5c? ([2a0e:439:c79d:0:8b1:fc5a:8f54:4a5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835247sm11373901f8f.41.2026.10.22.03.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:24:24 -0700 (PDT)
Message-ID: <d1534d72eae4fd210bda0b485ed05d3ef0147728.camel@baylibre.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Restart timer when eth_start_xmit()
 fails
From: Francesco Lavra <flavra@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kuen-Han Tsai
	 <khtsai@google.com>, Kees Cook <kees@kernel.org>, raub camaioni
	 <raubcameo@gmail.com>, Sonali Pradhan <sonalipradhan@google.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Felix Schladt <felix.schladt@gmail.com>
Date: Thu, 22 Oct 2026 12:24:23 +0200
In-Reply-To: <20260727165441.1969927-1-flavra@baylibre.com>
References: <20260727165441.1969927-1-flavra@baylibre.com>
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

Friendly ping

On Mon, 2026-07-27 at 18:54 +0200, Francesco Lavra wrote:
> The ncm_tx_timeout() function is run by a timer when unsent data has been
> sitting for some time in the NCM driver waiting for more data to be
> pushed
> by the ethernet gadget driver, and calls eth_start_xmit() to trigger a
> flush of the unsent data. If there is no available struct usb_request
> (which can happen when there is sustained network traffic from the gadget
> device to the USB host), the unsent data is not flushed, and remains
> there
> until enough new data has been pushed by the ethernet gadget driver to
> fill
> a USB packet. This can cause outgoing network traffic to stall for
> several
> seconds, during which the gadget device appears unresponsive to the host.
>=20
> Fix this issue by restarting the ncm_tx_timeout() timer if there is no
> available struct usb_request.
>=20
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---
> =C2=A0drivers/usb/gadget/function/f_ncm.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_ncm.c
> b/drivers/usb/gadget/function/f_ncm.c
> index 64eabda2f546..fd84086473d7 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1158,7 +1158,8 @@ static enum hrtimer_restart ncm_tx_timeout(struct
> hrtimer *data)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 *
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * This will call directly into u_ether's
> eth_start_xmit()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0netdev->netdev_ops->ndo_start_xmit(NULL, netdev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (netdev->netdev_ops->ndo_start_xmit(NULL, netdev) =3D=
=3D
> NETDEV_TX_BUSY)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return HR=
TIMER_RESTART;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return HRTIMER_NORESTART;
> =C2=A0}

