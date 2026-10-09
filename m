Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD4D47C107;
	Fri,  9 Oct 2026 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531385; cv=none; b=LE4ibpcUCfwuHySK9ejV/iQdWKBRB88DrnD1yXl2/NDmI244YZfCkv8L+Xj431mefW3q/HhJsv/QMJppqvtVUNecgnCAy8UeEu8zV9Rq3CnTJMvMfo26l9jf37jujdvjZkbgFOgialR6jybLDYdh9JGE+zJitzXNScw0+XsMa3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531385; c=relaxed/simple;
	bh=n7zpzz+Y17l6Py8KpeTtvAelcLxx/f5LgE3+gvKoNUA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OdFacImnH9wk7hmnmwgYQju5xlUdDUCB38Vbec3WHAbvm7bdCdGYRtlyUhCGApS7wt+4ssnvP71p4Hokqsd8L6O66Mbed8CR/kn1ElTXXy1k/q6TniLzgB4f9bUMJl5wCZ2u7U+fsnkEPaSHGMqqonzP4GW6wRPlm7yPiXGN+R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2t0Ds6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2t0Ds6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEDF1F00898;
	Fri,  9 Oct 2026 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531383;
	bh=n7zpzz+Y17l6Py8KpeTtvAelcLxx/f5LgE3+gvKoNUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W2t0Ds6uqkSxDtnFTjuILD4TjncopsHSedc31eCXKyZxTsAIVRDrckOO9FSDaj7/7
	 H7unMNE5y8Vq4xBDLd9ad7O9+aai4HaJsKmBISrylL6ZC9rqZ+w+On8t6Ftlvz3j1Y
	 Lt2XNejhpVAJJh+S2sCnZdbqZPyWZl5BQ7H2x/kZsjbVsZuuIJi5ILhIQlIU8CkKnf
	 hMFVkASvChQa9emLEjyiIl4sT7c1RWacHlPTEM/H6wjmFLmnDscsr0oPLywO3OayN0
	 P9gxus8n9vt1tCxhksqtvovNzLv4mhiVpMCMCIjX7UiW1uD2ZOQ2Ukc9JZPduE9fT6
	 /1fb0MnAuCnUw==
Message-ID: <sashiko-outbox-165015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] riscv: dts: spacemit: add USB2.0 controller
 nodes for K1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-5-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
 <20261009-b4-spacemit-k1-usb2-v4-5-2d98e5324d9a@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:36:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The SpacemiT K1 SoC has two ChipIdea USB2.0 controllers.
> - USB2.0 Dual-Role
> - usb2.0 Host Only
>=20
> Add the controller and PHY nodes.
>=20
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-spacemi=
t-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com?part=3D5

