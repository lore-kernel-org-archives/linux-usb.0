Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262919;
	b=mKSDodVQK7/2pVA4puHqLnJIMKVApmSixpfbKjAoPeE71XDHbi4xnfyZx0np7d2XX5Pb
	 HgqEruOicyfLl52JZTzlqgQwbcpvfrrWpQ8cGMqqSEws64riZCQ4nX9AIqJYQ0XRtsK6a
	 WZZfeS5YGSRYpbrvrQSfXpWGjzz/kYl2lDFLJtLCiG0m1wfbky0tZVJUlsBPhf09Dgk3x
	 NWOq2XFzMz7MBpmeY3vZFnujEYUIRFUzs+311V8CD1+FyocIEKNtWeZ/6+0fbUvubgg2n
	 KV2pWGUKAlIVkY9m5JK5NlCHFKIpPZQmC26QjDTlCCRlVFcODp8zvG3baO1mFkrH/hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LBmyH2/dbqiybtHogHV9SF5IlR9ur7SoYOJ39gweTu0=;
	b=168TDCaDIuWx5jT6dk8sAOLinn/EeZSURea6krI2X+kG3VKR7z33kBDveuHsSUio3fpH
	 hjW/xSAZe1fOvN766NBCXAjz10FzKxKNWhUN00iiZ3DAawSWFU32xBSsjtfylj1AtdDb0
	 T6i/oheWVguOhPRIY1E7yNhpdXBX8xJO+ABTMZwDP4sKDUUdSbfa14OAZ9G5rdus4xXad
	 3BnVEsK7Un/smGxqho4Xc2rfx9+xn9MgfhSy0OqshIrqFc9SDNPnwvXSYkTGioD1f/OnY
	 hMVj2wspyHeGBS/VzGLzJBdfY8usAifVPj6iNEcubw6qUnSLVN6bUsq6m4sZlYAktGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MjTTLcQZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF6606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MjTTLcQZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F208A1F01825;
	Thu, 29 Oct 2026 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793262919;
	bh=LBmyH2/dbqiybtHogHV9SF5IlR9ur7SoYOJ39gweTu0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=MjTTLcQZRIhvcDfyBG9c17NerVJRK9abSclJaKl3IZ04zil8Ci9/V89PdY7R1iT0C
	 BvYnyQMhiZ1v5nlBTf7hfxzLHW+D+1K8kLcFAheNZa8sr/8R3uk//7tMHEI7hFcW19
	 /pR+5zw5pQjaDptSSiwmwa9+VPtjakmUYECt/vgas5r31SB4dwfvqDKpJk400feCOz
	 ZTQ6p82Gnz8ThIsdhdrk5fcpkosFp28H3+FruUcEHyq8/sacI1MM7iVJbp71cQ6hEa
	 BwMatb6h4lCHFzQKsQfHYfGjKV9miq8mu8tH0fyqR5Kbs+f6rO9kkgTDggDn3XnDOD
	 Zt1HAhbAJsXHQ==
Message-ID: <sashiko-outbox-188972@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thunderbolt: Send header-only XDomain properties
 changed response
Reply-To: sashiko-reviews@lists.linux.dev
To: "JaeGwon Go" <ceo@logictree.app>, linux-usb@vger.kernel.org
In-Reply-To: <20261029081834.91559-1-ceo@logictree.app>
References: <20261029081834.91559-1-ceo@logictree.app>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 08:35:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit 19813551701d ("thunderbolt: xdomain: Avoid potential stack OOB
> read") turned struct tb_xdp_properties_changed_response into a union of
> struct tb_xdp_error_response and struct tb_xdp_header, so that
> tb_xdp_handle_error() can safely read the error field of a received
> response. tb_xdp_properties_changed_response() still sends sizeof(res),
> so since that commit the response Linux sends is 36 bytes instead of
> 32: it carries the zeroed error field, and its XDomain length field
> says 6 dwords instead of 5. The other responses changed by that commit
> are not affected, because their non-error members are already larger
> than struct tb_xdp_error_response.
>=20
> macOS sends this response as the header only. macOS 27.2 (26B123) keeps
> re-sending PROPERTIES_CHANGED_REQUEST when it gets the longer response:
> after link-up it repeats the request every 1.5 s, ten times, and then
> resets the link, about 15 seconds after it came up. thunderbolt-net
> [ ... ]
>=20
> Fixes: 19813551701d ("thunderbolt: xdomain: Avoid potential stack OOB rea=
d")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: JaeGwon Go <ceo@logictree.app>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029081834.9155=
9-1-ceo@logictree.app?part=3D1

