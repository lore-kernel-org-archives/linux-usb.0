Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297112;
	b=nNI5kTOWA7v61IxDLvPLZzNvKGQn06kr1eVjYEfEursnnYx8mOSoCRJNbD2wqDxmFW9N
	 dPzOLEvvKgzvtxvixC/LucMRyvRVoVXSo+D+oWwtd2HqyCO+YxDe21uC8iV5oqgUamLKa
	 qcKP+QyJVYjUXo9nIlcGPTCE56DiKe/pZDGGh/Iw9C5Tv6eW0DV0IFJkfds34IlFVrMyz
	 gM5Oc42tnkVzRQL+LkJXu+XVd4vJQmCoMZ/aWZlBZrnnBuZzQdhNMV93F+h84FhO2QLmC
	 aTsAckukKMxLe+9Rpys+L30aHkJm52EEN/EiavXHs2f2m2yDz3qnYQDRpHkTbX8eYXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297112;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oqHuT2InSvrbGqRT3tYIxny9xYFIiHOx1Izum62fQnY=;
	b=df6cw754ED4gFENP750w/6IjP7sDUODhrIZlmkUzqnc4iqM7mmvU966bDcs5TQpEXxck
	 1w5Xu7oHiiMhDlL8IUcniTZFIU9KPLRQcL4y00a2mUWsPKIi2ruVbadK5MKtNM9ZVR84J
	 6XBTIzyHtSB6cAjM+Rl+TdQWryY0+Jd+B+4MRpYUUJ/f25D0t6gQpIxbKSSKMKNKcV0W5
	 O/muOSPauyEkkZWUo4uVvkex5sQznuV7dMYmRk2+2NDtzZVQZEtusD3p6uCRtksO77/r7
	 M/ImX947o0nNBpyqV6xZ0Bi9jqJUbVB6VkramUSh9KdOsotHG6x6B/irc7KLxWHZedw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etva2baK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8127D606C637
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etva2baK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8091F0089F;
	Tue, 10 Nov 2026 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794297111;
	bh=oqHuT2InSvrbGqRT3tYIxny9xYFIiHOx1Izum62fQnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=etva2baKou411oOoN8VkQwKJPJDDGw08qMs2tmrobOShgebzQaJHK0g/4Z8DarKaW
	 RDm6B384byxynV+WIMpfl7TbmtSR+ZWtXJMtdmu5uC1PQzK3KJikg6cSMW4i5p6bvj
	 Z3zXgMhHzlxAgpYdy6jcH/zerGEM6w5yBA+94T6DlBQOIpb88f262u9TXi/UzASfbW
	 b6Llm1wXJwmAdf68BOeQk5ZKPEPrH2m5mkLent7dVQGTXKAIfI8KACk/zzgNgiLJce
	 Y3HpnIyKy8lINLCZRQaeUhro5UDFVH2hISNjemOXQuom2g8fnoNyrtxukhgVVR2cE3
	 m0C8v0vEQTedQ==
Message-ID: <sashiko-outbox-206536@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: core: Pair ports of different hubs through
 their connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-usb-port-pairing-v1-2-9307e29d2ed2@gmail.com>
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-2-9307e29d2ed2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:51:51 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-usb-port-p=
airing-v1-0-9307e29d2ed2@gmail.com?part=3D2

