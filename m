Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410588;
	b=5pQ3ZrtzqGAQaDw5SdUMy1kATSKJDNkwfdY50fXHfDuEbCdOwPI5SILCCKs6vqL3F2nF
	 0xHBJ9CmF8Zg1/2zdCJ2ZcppKYwPdWXBV1aMBm2heIrvJlxrKnLT2oMtBnO05eLF8lN6J
	 QzVd22lxu98u4N/ccv/5Ojh8KxFRduVSY/nfmORww8WcsOS+LdfsO//rB6SccYPck6URQ
	 jUePlysaJjMjh2kAPLRtVocd4BOK7iFAPx9vYPbhRHEE2+ZYt6ttIyrtKFqhd6xkVsmJi
	 bBb+IPr+QCtIkFG4izOZR/V0CI/vUEc+R3ugfjVcnPwRdx3Tgx1Li/VavbgM6RyHBVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410588;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GpH7W9DRdHNMppgtAopwWNR9MwzZVzX1w5b/9y+zy2A=;
	b=bS9zYhjJSAh2QfdjBEd16q7Z2lu8WRK2TSlVTz4t3/mkDsDraKkHA7yd7TRlF89HLbfC
	 Jd0C2U5kXvkTzkV7G4kX+pnVdp8z8amkroEKaH9c3Wl+v2WhbUOkRbmxkIm9DD6R5NiFy
	 H7szQcciGZp48weqWat0N0sOk65Icq1fqa7j79mNZJN6U1eOPcanzQVaH0B3jIIlI8CMC
	 Dn1Cc1b/oN2/HMLUC6efOek3YpNCG5yezRK2FNQPH/tdMfTYmmYhg3/hKky6ATsck0fJ0
	 2YDFQAG7WVKDWH9FNPkVBdspEgjrVUwjBEUAgOpH48xkHeN2/gCKbPhs+CqUpTFdx2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZxUW1m8v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917FF606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZxUW1m8v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8961F000C6;
	Mon, 23 Nov 2026 05:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795410587;
	bh=GpH7W9DRdHNMppgtAopwWNR9MwzZVzX1w5b/9y+zy2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZxUW1m8vrBjmKzbt5sz76lRM+TPTzdDL8xetR1ZSKk92/6xu5VfNnLYjPdiCrq5w+
	 tHW4DbK6Kzboluyx5F9ZHYI2Qfv6/P9ayj5asZqbtSVzKTlv1bBl+OLWUsmep13nZB
	 gyDpzAqcgnFygRuOpQNuKIL6eAChXT9ZWFI914Iz3Xe9Ee7/9KS5yQKgUXnj7Arz+0
	 AgOW76xRVM5HMoK/2jdng3tv8OxfPgq9QHZ5RF7EwR8VgIgxO9RmkfiQAPvPFeDtex
	 j/RuLR+RQbQiBvVnspC3R02l/ZsyOnYl6JrhtyLz7B3MdBQTGDFhviiUcY6pJZdjD3
	 KZX6SYuTAIR0w==
Message-ID: <sashiko-outbox-228703@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 0/2] usb: typec: add CIX Type-C PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123045815.812561-1-gary.yang@cixtech.com>
References: <20261123045815.812561-1-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 05:09:47 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123045815.8125=
61-1-gary.yang@cixtech.com
