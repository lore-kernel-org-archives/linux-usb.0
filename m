Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676011;
	b=5MKWXvq+slNCCuj7MBpr8pf3eAptDab4PBEt2op5FJCwdUGe/jC/y8Freq8Hrp4TlALC
	 /VBwQBdorNK55X6KY3czKseCWZjkd+1g+1cOIEBjYf042gmkfCnY6BSdGJdSJPE/fPHcW
	 fmQvrkafgnVN/+B0yQ0vfIlj1MHPC9o7JUDRwTfTIX+6ond5jFtIqFXIbiCVYXbSU44RD
	 M39zNr+BKLSR/8JMJKcu+rab+EegS4xlb4Imec4ST2FAbHoVEd8JTggj0PY99fXUcPON0
	 jI4myZD585z8KCbqHwnEK0hZpk1nBSd432RG2H1AyMV+90vXFvKwizY/i2klAiHMNSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676011;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XVfmgX+94+0/nlvjtEloksbuQful7Gak0W18Os2wdGI=;
	b=GLUoaQXeffjI4spOMTAn2KjgCjfaHl/GMGwggYSnx1dyBNuzPJ5aEFHjnKp0iWQgOite
	 /a+E+hxJb4yfv3QLt9d0xHf/6u4ACErbEP4DAmYxaXIDVn8SV9UlC0MT1WcCy6C60ek//
	 dVSNbMAH4jT+LdYcpJaCSz+mYTVOcnJcMj+h0ezxHwblLNMO54QEpNxZVdisCIINGC/y5
	 Oxd33GQ4vxpozC1gsclpYBBrAuDXhJs9gL+2I8K/hB7f5xXJVgwusobUbLmKlVmoVWxWw
	 Kcb+OZ5uvdG8OQZHYPzqX0Gote1kpJFYsWecDvL3CvQzRA9oN1aETccJKf0edz1tTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HQo1DAJ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96DE606A31A
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQo1DAJ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305B71F000C1;
	Thu, 22 Oct 2026 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676010;
	bh=XVfmgX+94+0/nlvjtEloksbuQful7Gak0W18Os2wdGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HQo1DAJ/ErgBppKsviajj8zr4NCfwo8a7bRU7x5ikNnw5M3sWZnFq2iVArz0e6yk+
	 QaENYZIZgBXDpwXudd6kmZIKsigudXemLKAJyjDNf+wj0Ohw8oC47y5e8UuQGrvHGA
	 gXQfeeP3Rn5zRHDXyxwTGMmMmFwLcnjFtFbbywa/iKEbJ2JDfebucWFPofh/yrwEdC
	 /JT213fl7M7YFolsqd2+0hMld9+p0OaZ7sse6cxzsxNLft2U1Fs1UlOo0mkzMpvXN6
	 dyXeNpEpgUU+Y7k3PNZKydF+ShtE/Lng7qorxqSclfQ05BRhqwmYQTXaUXQhHUOeDA
	 exHydIIDA87TA==
Message-ID: <sashiko-outbox-181545@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022-hpd-irq-events-v6-8-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-8-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:33:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
>=20
> Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
> to be delivered to the DisplayPort driver.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Bjorn Andersson <andersson@kernel.org>
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D8

