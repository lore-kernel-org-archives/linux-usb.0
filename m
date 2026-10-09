Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E63A1683
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517916; cv=none; b=s5rDMZKJhnro9fPg7kDyKLAKFOZ4tzMMzj/yxfcuHr56J5eYcnA6axmxz5LVXdPpU+Y5Z8bqwNjI1IZEju3xiD9FlQbUocOrjAM3cNrb1RDYWUjT+f+zBPng8+ncbpVlBxOQ0AlQah0CkAOPHCfnY3i+28o1/zXkxZRnYoCfgXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517916; c=relaxed/simple;
	bh=S3ThdiyQ+IaSU/O6/HzBRS324B8onkUsAUVjNAZJlbI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=efO3w/2++qahiXTF0i2Z/OhTkvrfcRlzE52Qqprx3f5VX2Qt+FvL8WQRrZ4VMvaGk6HfP1qTjPNhR7tdpXJ/Dt+3DCXatnfAUhSIsGxyejymi2Vdng4sHYu0d924/u1kvTCNYjw6Fi48j6u8m6diBmRidHaHNh5tU4qfY0W3NH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rhw3nABu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rhw3nABu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234A51F0089F;
	Fri,  9 Oct 2026 03:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517907;
	bh=S3ThdiyQ+IaSU/O6/HzBRS324B8onkUsAUVjNAZJlbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rhw3nABuevn+KVqAYa4Qskw/3HebQgaix6qnWMVqNJ72cXXTUS0nt6sZZcc9aXf9k
	 iaSeIxLeOwG3VJDv9z6RYunVwwlZxKU1YE0GSAhPQHErswij+hHU/vU9tocWk9ue6h
	 JKgLfvPDMIThoeAERrJmHkSbJtL3DmTzhlSsCoJjgbJPRqK39SVwrF4iqTPzSJqMsW
	 5ndTrsWlD/YbHPAVRLAdynbiCAaakK4IUYKu59iuPhxD6tmBOdYj8COuLbwUTK3Xi8
	 Ua7coAsVg5GpiwXTrZmTyRCDrpcE2xZgs7V2u7Nv0Wjv+J8Zg95LV+GDZip3fFF2KX
	 FQNLeQlpa/OnA==
Message-ID: <sashiko-outbox-164802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 12/13] ax88179_178a: Add support for
 AX88179A/772D/279 EEPROM access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-12-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-12-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:46 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The AX88179A/772D devices have 32 efuses with 20 bytes each,
> which can be randomly programmed. The AX88279 has 16K FLASH.
>=20
> Provide ethtool read capability for these devices. However,
> no write access is provided.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D12

