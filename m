Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771055;
	b=VlPFoB4xIberRy9gPX3kpi7n8/VmogipWdFaH/xzsZ22WCJi+C2eoVaMlXRVl+ou1H80
	 mrK4F565UJFXYH8To4OyWnRm/R4bLvTEeukPxmcVmfOawtbidR/iIfcP67Pm7JQ3OHeDm
	 s16/lVDBSEnIA/nsWnCuoWQ3CYZnHXM9B/0G1nYNaT2x1L0FIjD8D/KXLNBSnF8BV5ng/
	 HWCX8qx6htKrj46NGfFlT/WrraHUH0wdps/3yZ2OtBbnStyPgYym0hEETfq+N/lM30p74
	 9f9dh8HrAOAk6B2m4eH1hkXnGuOfdInMleof8+MQxMQw3Raw8uv586YWWaCNcPsE7iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771055;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dtMtKzSGfwV8hZw7OYiL1XZrCuy+UzWLU0Krk4f8zbk=;
	b=F/K5Cs5Gj54pWZCtjBMyD24tNTPKySAcAB1OCGV7daVEMyd+7GQulODBK1VaqYekgOyf
	 srxOzZySleHkTGf7L58ODIvLP6U53nMx3O1n9C4hWhMASLsvjmiqHbfDD911IgWn16CNF
	 DRWZ8W5tSy++idbB0tBwcHZWYlOGeUrDNU4jYCu+SYXs3Q/jQPbQekWsiznJ2/Ba+Rp4k
	 4DLsr/bNLbMHmNiuyEYX64wmPb9LZIR7U4ePKds5GZxFG+Eka7WP01SkgAXKn7CwhZtrN
	 nYiB5ekkWK/Z8dZ1ISJuPR7lm41j4zUHdGBqOPU044T4B5nRw20kW1yB+ONxZUuSO8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dH/YXkG1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2BA606A335
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dH/YXkG1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13CA1F00930;
	Fri, 27 Nov 2026 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771055;
	bh=dtMtKzSGfwV8hZw7OYiL1XZrCuy+UzWLU0Krk4f8zbk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dH/YXkG11TxxvIaIwFwaGmdIcVavCXa4YytHIfd2BiiooUGfMmiO2Y0L8HUySyhRA
	 1lwbRqcWwyPkK752FIzEumUfbIPSzazQqUZjWUR36vYNJTElw0tICtu4j10BL1rNnD
	 8WKZIi8y2kx6vac0kQpwPPuVWOMF+qvA1cnvsYKZt2LiOxiQDTYpFiwU1QzfXwXhAQ
	 60LlNL0CjPWDY1SoEcCPBgv8FFe4R1Qv5NVk//Vo4rBh0dbWVtfto7lnnKIvCFtuf4
	 xfjBMTOxe939sxgg1j77wnCKtL3zN3+JStnC21/ByzvM40IgzW6lxFYXUg8wWzNrTG
	 ESY9AfCkmjlNQ==
Message-ID: <sashiko-outbox-236959@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 0/3] usb: core: fix three use-after-free
 windows in the USB anchor protocol
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179577006613.23588.1120308700542393912@kylinos.cn>
References: <179577006613.23588.1120308700542393912@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:17:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 1 and 2: no issues found.
- Patch 3 ("usb: core: Close residual anchor read-to-lock window..."): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179577006613.23588.=
1120308700542393912@kylinos.cn
