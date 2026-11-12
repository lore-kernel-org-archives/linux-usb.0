Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473446;
	b=oQVOlleWGEZSGLdBuG/xC1tATUSHuTbvAJJU0Z1aoHM6hlpx3JaxokWl6/3nxTQsau/y
	 ZAJeE/gJfsINx7sh1mnAM2fF4qbpHyYC9BsQro3cczxpETf/qr2vII4fMFqOXsLYYTOrt
	 r4yUf1zkLjN/409hzpi4oAmbVj8UsrhIrytzZG4gj/SjlmocuOo6cLVcbXMuv6lXKDuzN
	 pu4uTUANznLTzH9+YgFd3c3juQB1ytFqzVuGCu8GNZTH8wpCfVyNGqxpfUZgyjEP1ccH0
	 yHQk8tK+GVIx4FclIDqy8JyP0fSTRFthcrdb6TWPYBxUOb8Hu8LIZqwZ2e7avwSyIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473446;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t1KNi1XW4v8bYwZmHkXQOBpzP8JHCHFcUG1hDD7t8r8=;
	b=bsjErC0VAJUF2pcV4jdD+ImSNj0OZIVckSu/anZzjG2Kglvk98nZEwOw8VvsS9xQoDVO
	 EEGvM3LTIhmYbgkOys5FACAq9WLxok3HNngIamMJa9eKbHUgXXBN9Wa2ZZcikxmreyqIQ
	 RND0impXQ/Y21rdlR0pChcLWMgS3Kh9vsQZeVhuBfUzDh/SSVyivJ8Xmdi/gqycm0O4a/
	 dmkoUTt5vDW8OpG1LavnIoz0h5NuUBNtjaguPimPbkL2KO8obe9KLg/+goQoLLfLAMuWX
	 EhfxEtkOpyhjyEI4RCGqt3Kau4Zk6TND2iyZkqTmoozkl9A1HsdsmiIlmWlKmgMlh+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9CmoFx8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DABB606A889
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9CmoFx8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220C11F00A05;
	Thu, 12 Nov 2026 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473446;
	bh=t1KNi1XW4v8bYwZmHkXQOBpzP8JHCHFcUG1hDD7t8r8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U9CmoFx8RCb0VnPVoVo7x0HkCVrlvmu+hWNSyuw5DnMCVtPMEd69KVaXA4BYeD3qb
	 e0KgsAG7ddQlOzep2y+UA4pSk487S6/vfbxcOkri0ftsAZw5BgI6bmtQM16xC5ZHop
	 hgyjJN8opCxQsAJ4usio9epQQjY/fASRiR1e42Odxi8ZHT4cYKXOIK1bWrr3aInhM1
	 3JCU009T1+vItf4jmUoDqYlLBFnzXr098uttU7moiqv5qDVf/xKLhEJVRAizXPWL07
	 nb/dRpZ6WNDHIr+m2LSr68eNGfOxNNMZzw/KrPj+TEHAe/5z528bGhj0UnRYFtLV/2
	 3C5wZFAJ+TDPQ==
Message-ID: <sashiko-outbox-210789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: core: Pair ports of different hubs through
 their connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-usb-port-pairing-v2-1-45f5a1a29f1f@gmail.com>
References: <20261112-usb-port-pairing-v2-0-45f5a1a29f1f@gmail.com>
 <20261112-usb-port-pairing-v2-1-45f5a1a29f1f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:50:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> A USB 3 port is two ports to the USB core, a USB 2.0 one and a
> SuperSpeed one, and the core pairs them as peers. Root hub ports are
> paired with the same port number of the other root hub of the same
> xHCI, unless ACPI gives their locations.
>=20
> Some SoCs route the two halves of a connector to different host
> controllers. On the Rockchip RK3588, USB 3.0 host 2 is SuperSpeed-only:
> its own USB 2.0 root hub port is not wired to a PHY, and the connector's
> USB 2.0 lines go to a separate EHCI instead. Default pairing then joins
> the SuperSpeed port to a dead USB 2.0 port, and nothing knows about the
> EHCI port that really shares the connector.
>=20
> A usb-connector node describes its USB 2.0 data lines as graph port 0
> and its SuperSpeed lanes as graph port 1. When a hub's or host
> controller's graph links one of its ports to a connector whose other
> half leads to a different hub or host controller, pair the port with
> that one instead, and keep it out of the default pairing. Connectors
> whose two halves end on the same node, like a Type-C connector on a
> DWC3, keep the default pairing.
>=20
> This lets the runtime PM rules for peers (keep the SuperSpeed port
> powered while its USB 2.0 peer is) apply to such connectors too.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-usb-port-p=
airing-v2-0-45f5a1a29f1f@gmail.com?part=3D1

