Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763077;
	b=Zowuy822ItCXEvdlhaR8MiDIbuGwpZV5Qtffa8QXUE+S48GePThpOGrL+r9odbojcPmO
	 Fsngl8RosakXxjZmP0aMWvabNCPcYBJcr58s2NWt/vDJ1yNcr/XFk7v6VfScktPyCyHbB
	 tE8yKVZ+ufZifPeIJ6H2j2m+bqh4pbFUBH9sruaJyecBADwguk6GEjg1P3S0A4l+ZhLLN
	 nv9cHxZ6dIASEq1e//bCkO6Bdog3eFCGGS1r7C/3samMP2tG6nxSnXAyyJvIfniHrr2rR
	 f5XZUQ7X7fu1h/3hAoDFbADLaJBH1ODue1sc9yZ5p2diVPNBdXWh/FF+xt9mCSOpVNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763077;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TtcAYASLsCca5WzryCFlAICVguFngx2DcvlUs7rN1UY=;
	b=jg+koADxryTI2iFeZuatR4c0zH37AUOgQNUHksMbi94HqLlYQfT6u05itT4f9KhsOhgI
	 CNd/HCSzaTwOuj5hxdTrMBm1pKuooJZ+26PPECMCBoOzQ1lvynAn/SXgK20MxGg5eXWzQ
	 cBBAUJ4kGRrJiSmldBIgHxJTJDY+JyfPKo8Md/KCxMXYQX3Cynz6QJgXBLbnEzluJVUuM
	 iydXFCJd5wuBOaVKUL81eIiwoN5RIdlwqw8CPrkRqzfx1YvC4HrWvMX356Kwc7TbJxoRy
	 nTq33A9FKGNVR3yYV30N8N6EYGkwsq4V5Bc3KZkXyhxIpBKssekLNzLks8X/428i/IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+kyEDaO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB92606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+kyEDaO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D9B1F01825;
	Fri, 23 Oct 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763076;
	bh=TtcAYASLsCca5WzryCFlAICVguFngx2DcvlUs7rN1UY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J+kyEDaOBAY++dQdk3K7WPTwYxRdX7LinRVlrldOV5XoGYuvEHVVfWu0JdWP3DNEU
	 rvUkIwhmju99DJ2cnT29dn3XchCQoZxxXkPW4suJXENlCitn1EOPG7s2SsRsbTYfZ3
	 vVqeuxS0AGXaX37ivj2hGEDHKrUpQbdC9hvskYgtmrYaBiIFos2TIo14joQ2hluEra
	 3fEZE9MMHEeCrL6F71IUF7aNIOgYh1rMIUW4vP6fNzRR1/B5dmqR11lBqAB3p+7VS/
	 ncJhpc6Qw0PwIwt7fzEYircDnU63fvt6mkUNBpmc/2MGZI+hqDFiO/CMjwSqBhZy6o
	 bti7ruwRVd2NA==
Message-ID: <sashiko-outbox-182843@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023-hpd-irq-events-v7-8-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-8-57a3aea3f09e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:44:33 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-hpd-irq-ev=
ents-v7-0-57a3aea3f09e@oss.qualcomm.com?part=3D8

