Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699825;
	b=1UxLNDCBBhDByx2QimydJ/UyQO9leQM84hRbWF9HdxbjluX6z2+m5OQ4gBVZCVz4yInj
	 2pIqzrQHODMsa3cWYZ2FVMukw0yVc1oRhuEoNtYtNMvsu6DqIqPRsRjy/JrRPS7Y1Ygbm
	 ii+TFzZShegYt+EJ9FxszhISyTC016HEKQPuqTpXV0QfR4AWiRwLg3lY4irHmAKqbN0++
	 7wULVfR5IMUHSDVIo5BdH+4O/n6wiMxjEVg43p8B9cgLkt//tqpPwOUo7DPbI55nGUi2J
	 kCB842OVBhWunXIcpjlXsW+pizGxrBBBiH41B5COyZRU+0WBjJJo/RtjHat+bzhNeOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699825;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=riRy1xlLl0fqH9BcpWeiXek+843FkT02sb86wYjz5no=;
	b=hwddVcNmldtxgBwj1lnOvuyvLt0vQzpLJUVm1d5LVJgEXVRYLiKMOl6/AbabTYt+pXSu
	 jm/IPhNa2CPvYmoYaROunKATPZDXew3oqIW74iyIObLZJOUS2aGuUiDEC8Bn/w0gFk373
	 FqbIo6j8Di67npBRNn8jc4ElBo7D0hOiLkCsskjej8W1NH2ELjp2kZPqaAldietvYxMj/
	 LxjVXM+NLsxOeSFJBKGrIZC/1cxRQAglnIZm5qTV85FDMYLEEHb8GLv9FNUx55JjxG4MR
	 +bAO21i8VGo6EWHJnBe3sfoYP3LTDRlmLDuA4/9SSKLvydsia57vIFnQ1mjgpdPRzsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7J7puln;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DAC606A32F
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7J7puln
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F258C1F000C1;
	Tue,  3 Nov 2026 09:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699825;
	bh=riRy1xlLl0fqH9BcpWeiXek+843FkT02sb86wYjz5no=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e7J7pulnv54iSDuRvsi/0BaaAcxipZj2dcTqbumN1gkjVkjZvjsLCP2Aai/nwbjP4
	 CKf6/7x3OvCxeCmubm9XlR/rLSe4ftMQP9NbNvmeoD43oWqghDVcy/adl0ZqDGhUX9
	 gZPaUvJYNm8vtCZXRorVvtk6di50eJh1VvCdPjBfODoRIQvWk9IdaE0UFTFAau7ixq
	 CtMCiooJkCkRVXdr2LtJOYPLXalFZX58CFasyNTlY+rZk/oQRGoyvrJv9jzunUQxOq
	 xEUxu24Ax9m2ihQO8xBfZjDI3s/OgyYJGM1WdiROStrvBSdZi3xnRFmxylltzqHHV+
	 7qfRaTHyaHYRg==
Message-ID: <sashiko-outbox-194989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ti,usb8041: Fold in TI USB8020B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103095425.3097720-1-wenst@chromium.org>
References: <20261103095425.3097720-1-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 09:57:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> TI USB8020B is another USB 3.0 hub that currently has a separate yet
> similar, albeit more limited binding.
>=20
> Fold the TI USB8020B compatibles into the TI USB8041 binding, thus
> allowing the TI USB8020B to correctly allow downstream ports through
> the common USB hub binding.
>=20
> The requirement of "peer-hub" is relaxed, as done in commit e44297dd2b75
> ("dt-bindings: usb: ti,usb8041: Support nested USB hubs"). The hub chip
> might only have its HighSpeed data lines connected, and thus would not
> have a SuperSpeed peer hub.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103095425.3097=
720-1-wenst@chromium.org?part=3D1

