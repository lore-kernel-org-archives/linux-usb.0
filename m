Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109200;
	b=kukN/F12jmL/c5FSl1i6kVY8As/czYSKBR/V7MoDaM3f3xCAUSoKgSJXod0HYvv7LKSB
	 84L3cARdJvvTrco3pz+vgf1MwDD2DTKDEa05a1Jwy4u26Ps9+/o1pguiG8URmRQnXZYuY
	 2qhPrds0Rf0zgz+D54tCSRtnpoyLXethqnqZTqHZgzgsHUymRmYmgdxGHckN8JbMPrUUP
	 SjvUF+m5LgtV2RzaUxEhAgn3qnWxqF+JYdtVpaB0kgI0smoOpJgFwr93zvvk3naYPEpLC
	 /omjR0hgxOtu7OVY3ZavU/lIwW3B4HVJ1fK2wc8noqaDb48hWudxyNNIGg+PqVof43g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109200;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kndk6vkg8JYwW/gbdqUJwa3LsNMhxGbgJ9VQRSWevxk=;
	b=kmIHdDAuIwqegqkXpwxld/TxspvhoX+KvzgjE81owkXdJUZUrVsmtYu0U5mr7ag9iagX
	 YwIrjUZtE64hETuV9Y24/fu1qvf2W82b4gzSgcquc+al9jlybCLfbNBpb/MA/0XMXoe05
	 kmiqwtEAukK4dGemNAtPfyglbR2axPNHquGCXrbRzZoi/tonfv0UFyd0epGuqby9gB45Q
	 c7F8u7YeaMN+Em+I9MuhY5KpR+cJDcLp2WsZZso+4oUFsQA60RWoxcQtHL0UqgTl89GOt
	 Mk5WEgQ+0rwreRWqWh7HjEBM3IMz9uacXHZ2kZkykTbIuVQ+TznU3EzfAq/FwEEdtug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xt1dwmE6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FA7606A32A
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xt1dwmE6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED671F000C5;
	Thu, 19 Nov 2026 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109200;
	bh=Kndk6vkg8JYwW/gbdqUJwa3LsNMhxGbgJ9VQRSWevxk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Xt1dwmE612lsup98vY2VAerFvLoIhbIy3amrCHUy6U1jNiFsRzOcXVk3o0lIzv9HV
	 00MT8nLLiXzMJo4WjVXNHdeebCnNQdIVmtAobQQOqHOR8TOWQlAtdNFul/w81PqS/I
	 NX1Mb/zjS+zeHONSQDExYLBjYb1rZHGfimjzwSGeLLVTcer2COc1wuOdSPmaSKFM9z
	 jwpjtEGyf0kZc2rxqwDe1QOIDVK9ywtQX/3otirQ4cjmaEr6I0Onkd9cgxIaN7hLUN
	 6fVAB+pstZ2LOjKOch88ZBBNSFwvBx58XPqZ13EjDia6WuuVZXR6dj/ilKtdlS4VIY
	 gD9FkWNkz/MUw==
Message-ID: <sashiko-outbox-223691@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/18] thunderbolt: Drop tunnel discovery without HopID
 allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-13-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-13-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:26:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> The only user of tunnel discovery without HopID allocation was the
> resume path from suspend-to-disk, which now resets the topology
> instead. Remove the now unused alloc_hopid parameter and always
> allocate HopIDs when discovering paths.
>=20
> No functional changes.
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D12

