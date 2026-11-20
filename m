Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169037;
	b=Vvp6XYidnq5Ze4XuWJ84+P1Yu9SYB3RdtRWzqwzzBXe6uKRrSTUepfRzLVcP1eojztq/
	 XafaxtZxZ4B2u3BKYX5dpElYu2Xd74m4gXyMj2D4ya1Ubcaj+H8eKxjhDRgoNrB0JTQms
	 BmJBWGTiHCr9B2I+SEzTZIiIO3CCrWouft37Exr/OUZ7IPMcwM3m8VwhVzgHOOQPse7TA
	 wdvhnu5LYMdm3qWwyliZXVuzw+4x958pckkD9tocZL6GNAVHxRrfUsRh7/fzIXFYdYtdK
	 +4mj141vtUQ89bm4PUA07yXejQ0woDbUvmcejdasaASglJiU+NNcIMdFWwD4riWznxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169037;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y3IR+OfDVIGXqDwQMFTm6/G8tTYGtBsIUVAArbdvAkA=;
	b=da3z5nHNQSEc2BVaErLufYvWKHmQs4OYEq419DzM39PCw6CN5kOcMpOgQxB8uPoZDiH8
	 SZkpshN/wtfrVfqZ3SBlXAErw9tND8E6W6JOIAWNuJtwfWqNzPDR1M0PJVP3DhCpdbJQo
	 C/8PvUdltK6cAJZu28Euxb3jhIUD09h+APO8z897BHoXwlUgnXlsQOyZPbScu1Qw51mEB
	 /hxf3SZuODSfX+9z+ToWgpVi8339sNaPr/PG5qdT4L9gtLnsjZJXtraBHY9xiI9uNQVh+
	 K20JBueOT4ymmsmUcnONpWzwQSK5Q1ls37Pb3FEdv0vpWA9Ty8d6IWXZSgYRUAW2b9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVORN5sw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B3606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVORN5sw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76D51F000C6;
	Fri, 20 Nov 2026 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169036;
	bh=y3IR+OfDVIGXqDwQMFTm6/G8tTYGtBsIUVAArbdvAkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZVORN5swHATJGECJqxwP1jDhui3VzsVPE/4psOlTokHAAG6IR4Pg+5E0qFWqJfOHc
	 q4jUNsEDPAqyjB6rQnfUIfLSp742Ah4Y0HSzv+r73JltgpqVie2MCcgR/nEdH2mLE1
	 lN9JQVutgfpCXIlP4FRXkoMyz70IgIGb/hZ3Xpb87cWVLvJfN21HI/pv+/darM8Cgu
	 e7zQIBaOIE4aRvgiEwM0sKyqquqzuR/gttKBZSUuQ/6EggTI7o5igZzfDAsokx+6S3
	 UIfe7AKR3Mg0tOjI0/k273cYY/JomSGjacIhcR6fFrhG1WOE1pW5IX22b+DOY4Tlil
	 xfRaKJUfJ1CUA==
Message-ID: <sashiko-outbox-224904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: tcpm: unregister stale partner sink
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-topic-tcpm-core-fixes-v1-2-c753d1d286bb@linaro.org>
References: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
 <20261120-topic-tcpm-core-fixes-v1-2-c753d1d286bb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 10:03:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] usb: typec: tcpm: unregister after register in
  tcpm_register_sink_caps()
--

commit bce11ccecca861664b61850ba73a6eebf8702e1e
Author: Neil Armstrong <neil.armstrong@linaro.org>

usb: typec: tcpm: unregister stale partner sink capabilities

This commit unregisters existing partner sink capabilities in
tcpm_register_sink_caps() when new Sink_Capabilities are received.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 1d007e59a2bf9..c5a4c0b6da16f 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -3563,6 +3563,8 @@ static int tcpm_register_sink_caps(struct tcpm_port=
 *port)
>  	if (IS_ERR(cap))
>  		return PTR_ERR(cap);
> =20
> +	if (port->partner_sink_caps)
> +		usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
>  	port->partner_sink_caps =3D cap;
> =20
>  	return 0;

[Severity: High]
Should port->partner_sink_caps be unregistered and cleared to NULL before
calling usb_power_delivery_register_capabilities(), as in
tcpm_register_source_caps()?

Because the old sink-capabilities child device is still registered under
port->partner_pd when usb_power_delivery_register_capabilities() runs,
device_register() fails with -EEXIST and tcpm_register_sink_caps() returns
early at IS_ERR(cap) before reaching the unregistration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-topic-tcpm=
-core-fixes-v1-0-c753d1d286bb@linaro.org?part=3D2
