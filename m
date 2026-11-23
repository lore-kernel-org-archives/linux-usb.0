Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417238;
	b=mi/JADs+e2PPKl+4REZG2Y3D3klc1vSzDPjU68VKs6y8DHBwPDCmHQLvIfvHbAm4jv17
	 ZF4MUl9aCy3Gw/T7ojXa14OAtqVFxHfxfUyOM1Ko+ix6meWOdAOQ3wccVldi8Jyf8/KnS
	 Tla7QjpVh7GpzEWb/Jbx5yBJ1sfwgRtavsxQR/mA/4JPCrHMNoyfOYzutly2vra3Fw8tJ
	 VErav7lvfq80rPuwgfgXfNoQYIAL73OQwnHBFRrr8XOEg2IEhuNDiUwWC1mMpx+KBq/qb
	 FwS8VD9OGhCdsZ5FrfqO46qQXrKtHigcKfFj7I0KfZpf+wxdZlD1/qTG8/FL9pyT6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417238;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TQ2M0PZ0GUiTemHqLeaMkU3rS1gg4Ad2RMaWplEKSFg=;
	b=Rfk18ukxZ9C77lRdzpaRbdGMkqtBAQvM42L180IBZNlm5uPtPjOB8K8SBlti2RJ2wfmX
	 4TmFnTLQ9Jg4bH0EoJZm/Hm6l3t2ve2YwrWdAYQFANzha/5JvOJmxAbYM7UrEpJdzB1VC
	 f11WyG96V/Q1hRGvlheBwOI6ahdBpOQK/wUv26m6yPfFNQ/TQogj9vbae93h6bU9zUGwW
	 3F3e7jx3ZRIuPG7K8Tij8yyrEm9VRoMaFGFPxbUX3Oik3m9cRzR/VoBv1f/iwosLAQIly
	 tnEtb6E25fs5e6jtTRjM9UI1XoFycNkYUPUP7FFjdHIAfNKwqZ411zFeDM9fDD794xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etjtCr3m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563C606A327
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etjtCr3m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCBE1F000C4;
	Mon, 23 Nov 2026 07:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795417237;
	bh=TQ2M0PZ0GUiTemHqLeaMkU3rS1gg4Ad2RMaWplEKSFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=etjtCr3m4AnBBSr2WOXE0viacbHW//+rptiX0CMWXXLtH7doZrvHxA3Ern02WZkNm
	 qUn7hk3t5C78wPtOwQofpLRTyKdtTaxsjJVxVsXZRJMfC3Bs/cU3iAfUluopu7CGHp
	 An9nm4EgJq4guvPN0dnZt97RZ66ytQz+rkq2cEvx8UUHFLJSmNu23XldFCm4rZzUkW
	 wxVOKQoVDuvVY9nOzE/3XMPeE84udgaKC05ebnLM7E0jSH31AM2rLKFV1PSO/iq4HR
	 pDkc9eAy+IF+e6l2qgSggOGIQxW1NqToUb29iXt9h3ryPqB9ejAfBBBQ1XVXkyngBm
	 U96uUNG6a9u6A==
Message-ID: <sashiko-outbox-228789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/3] usb/phy: sunxi: Assert reset before deasserting
 on init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bobek Brzeczyszczykiewicz" <admin@roadbobek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com>
References: <20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:00:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 2 and 3: no issues found.
- Patch 1 ("usb: musb: sunxi: Assert reset before deasserting on..."): 1
  potential issue (1 Low)

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-usb-sunxi-=
reset-fix-v2-0-4e51d3a64964@roadbobek.com
