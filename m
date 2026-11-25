Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615843;
	b=QJppoo79TrvPXzNzZbNCyGxpKw9Qfcbl6GspJgro1AFqGZudxzyVBkf7D/zMOx3QRi9u
	 XhuIIfItVUg9JGE+dsV55gHno8opYcMqrPpn15HirJsYYQ8QTYRECIF+b7J2dYEnNe88h
	 4uA7WU32uU+tuXoC7dGWzpREHuxBLvuFk1yW91KiqJ6SvTRYUi2ex/iIkQaQVKvwJvRzb
	 yNX88yLf6HrsLz+2BcOsyMoaRPYIDq9fyQ+3AimGKNvMrXl55BozxLelXUpG2/pqifCsJ
	 qYCImnE3vbBfsut+6Bq/CParstDeUectTfjzMsdTAaGwqgdZ6pvHF8vtQYQ09P/68tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615843;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=beOd+L588CqTM+mEDjXlHJPIMYmN3fL/E1+aXe1n2cI=;
	b=GhDGwD36wkcuZyW5utFORgKE3RoFiy4YHCzuGztPfFyKpzZgRGsnm20p0KqadG92ryYN
	 HAcL8jR7YHjisDg3Evg65PTkbtjZtbHSgwlWybg2oP1QEk9UbeEju+kt9P7WA0/x7YLPK
	 FlsUC529znUEoMxG/jitzuZoqb79xECm8Bwz6erv6V3Pm9HoU0ods0VbiOuk12pJzi/Jp
	 KfFw0i9+KhI0QbvYkCi9te92NXsQ1r+OskwC5FLpNhl6rn0Ygmxp0emlxgMXy0dJZ2eLI
	 1matnr9h5SJODVJ02FStFiNESoDiscvF5JEwqG6aqU1vDH2qpInzxuJxC19lk/9oBRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VcdBSHBT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5D606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VcdBSHBT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD331F000D8;
	Wed, 25 Nov 2026 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615842;
	bh=beOd+L588CqTM+mEDjXlHJPIMYmN3fL/E1+aXe1n2cI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VcdBSHBTXYO8V/Omga+8ClKfVESAMqm30kpc6gluVuVMUa6CFHlQEvTpm1M2jGI6E
	 9oEhZHCuediSS8BBLtRfvBNLg1WfP1rF0SjVPlf2svv4U2oN7I+iLec8U2ITHCeqdt
	 pRK59/nakfsC2E1bC1UE8/OIZEg/Z+hyM1fnIVWQkFVuENOsw3dgOJNCkKhscDZVog
	 9ab/xZ1zkCWZQzzcUh8XL9I4F/RGMmJJDJMcMHNeal6TshFJM8qDKSOTSq6Vwx+Kic
	 BsaNGyQcrxz2XzZhdlqBxMdn2dohGA2pnXFrL00cDKLfRtPvU7WcKndegty98nQtLG
	 fkU/IA2UX2qSQ==
Message-ID: <sashiko-outbox-233529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/2] usb: typec: tcpci: report BC1.2 current limit in
 tcpci_maxim
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-tcpci-maxim-bc12-v1-0-656e01201efb@linaro.org>
References: <20261125-tcpci-maxim-bc12-v1-0-656e01201efb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 14:10:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-tcpci-maxi=
m-bc12-v1-0-656e01201efb@linaro.org
