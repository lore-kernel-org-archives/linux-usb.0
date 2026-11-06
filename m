Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957829;
	b=ND976o6ck641YBFo/jOyAAIP5+KXOI2BiftgbFG2LQY3xMBrNd5MkFCBtbbJyP0E3HDW
	 +sToUo7QSzGV+ZN0pXiFeyUtpHoE7TKqChZw9fD9GlAE0lVn/ZfeVhkY06WSQ3Y/3hnEz
	 KFwzIQcuDmgKeYMu7ETldoHar9klAvj6u9roNSkRDtr5RGW3FuVx6iZiETXmS71bIddcX
	 dOGPC3UJWz8mvB1oJSiGUNEdUoNXHZK9LjHNQCuhWEUH9m0NstY4tkoeNaH9Ieg08mrzd
	 MQkh1xia2h2AW1ldoOdQWh7EGyc36dItNPibrZTq5mMwqpJsVLjUWwowlJC328uelGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957829;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gHLjT9gK06drc9O3eC007QEhp7bvR+BlF+oiNmUBLAk=;
	b=O6RLIEokVpIPWZaj9yL9hk1aTITjOMlLWP1DfLbqC14ERbbv0v/JcIazTmzwP3W3OIYZ
	 2Z8njs147FI68ivibQuMxZ49G3dEvq2R1Svm8QtDtcvdnFR+XyL/rad4Yuq99guBAJo0k
	 vdWuC+xn8mf2eI6kLCL7fHDF3Gf1qcgCeBtCgKKHVbLh9a2xBzMLjP0DZO37EQUlJj+aQ
	 ChR2+5lbrrWzX8yraCOu5BmLsfTfQk6F/veP6oih3UG3QllBk9V3JIpDMRTPoHDSf5Yss
	 C//rDvuUXv0j6E14iPq9uN7JSzntIlZTeiyl1xgbBp/OuYoAGg3yKPW7ObUZV+3rl7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEGpp8EL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AF26077CDB
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEGpp8EL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD0C1F0089F;
	Fri,  6 Nov 2026 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957828;
	bh=gHLjT9gK06drc9O3eC007QEhp7bvR+BlF+oiNmUBLAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nEGpp8ELt0zCBlRdtsGr2MDOOJMGm6fgqoinJDkn3XLvprxo6U6u8/8O3eMjsBMH9
	 zi2DExnA7OpN7WPlgtHkPeMFRADg1q0oMqgTGWGY34z4XY0UwAtWm7NCi8lPVXkWKg
	 ISQGXpoGpxTGOPMghX8VqKUyOEabZarZNRJNaZfVs9JvWw0S/5fIkAytjsc4W64pFZ
	 iyrJDe3JnCS5+AflkwvXJua3yWcS8U17XWg8IUBOYCly1VJsYMSNiGL4ncooRAndTr
	 TnhP1ZLmIigtreNmWPAjyx2i9Nu2X1oDVNRI5VGjOp5dCVALTQy3GxImCEVTFRTYqd
	 UqPvE0xnXWGCw==
Message-ID: <sashiko-outbox-201133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/25] dt-bindings: mmc: snps,dwcmshc-sdhci: add
 Metanoia MT2824
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-10-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-10-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:37:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 integrates the Synopsys DesignWare Mobile Storage
> Host Controller for eMMC/SD. Add its compatible string.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D10

