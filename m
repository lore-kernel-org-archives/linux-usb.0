Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618918;
	b=isGCezNJMG90BqLAix/dBJXsV3flOQRuzeujAYtHCEDGDI+XasdShd0YIbtD5vICHGWs
	 Wn9aefYsYwUofbdeNMmLxTFq260nGYcF8VCooAEBMMGEfDiNDOpxP8ofbe/CzHftyeOXK
	 9lS4iDHcY52HM68RCopTithms0vHhHzP52bjWWK/aDYaYggk9lfOYUGcGuRDVaUjO6PbC
	 0MqrGUZMvJVnlEXr3VaosohdKNQOv2Wig7KvS98GLBqT780CPU33/4fepZD8fqc1VbJgB
	 XwF5twkkrRxkfIGISIFKy63selGeamB292eE7UYL5nCBIL4EI0n9OoMAsegEVUH0OjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618918;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P8eBl8GoIl+tVMBlqXGOBRgfrRHChn+8WEY7lYhPwMg=;
	b=cMJ+yPZDA1jSvmXRJzcpXmVEnYxU/v+sN0dMBeyK4MPPTVwvtSGmn8lZoFAmFcLNeDis
	 J1kV7K+DSVCtWwxlrll21mMOXTCuGp+PanyKriJ5sJiE1qC20uw6TcRijoLZkd+tGQcaT
	 bi+ZGNJ926sCcLnOlXXibO4nzfleC0vg1iVeluZiC88pPkmBpWF4S/ot2mX98FmJXqgXx
	 gZ2O8rW5UGoizM7OsAuOa2g2ma+FxC379d7/JrJHhmqN2VoQyhW+rdvu3FcmovWw4usF2
	 AW8TDejmfp9cNgewET76xxgKJfBBChi35WWy+cL7iLQOI9rqQHDHt424TjQzP5QPSBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJtGJOOc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D783606A329
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 01:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJtGJOOc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DAF1F000C4;
	Sat, 14 Nov 2026 01:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794618917;
	bh=P8eBl8GoIl+tVMBlqXGOBRgfrRHChn+8WEY7lYhPwMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJtGJOOcs84l4y7U22rhh3/7FWCRawgwzT0KC30h2z1c8CVshp/H4A3VUA7I0GYnA
	 1lN9VzXG4evrHtTJCPwj4HkxiDqcGNQSCMPoxfBhvpYVWZOvdRXsIXM1YMaNP6o/9t
	 MC3xC5J+aTHp6u52E3Cly5px37NfBY6XA6j4ltjGHaIV6XycOyKGSDESb2PeTlnJSM
	 fryaSmX8K0G8KxUrui7/Siuj0OyqMIZBn1OXI9gZ28hUizVSci2o2+Gpm3is8bRiFn
	 Xh3BLvNQya7fvyThUokwZ/EtfkSmCrA9h36+vJ9OhJn93qlWzhKPACMTNCsu6vxFqb
	 PGIRKH0USmQ3Q==
Message-ID: <sashiko-outbox-213980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 1/6] phy: rockchip: usbdp: Track PHY power state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-1-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
 <20261114-b4-rockchip-dwc3-rockchip-glue-v19-1-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 01:15:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Track PHY state requested by software for DP and USB3 individually
> in preparation to rework and fix up power state handling.
>=20
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.co=
m>
> Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-b4-rockchi=
p-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com?part=3D1

