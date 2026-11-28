Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847832;
	b=Z/G3KFSUqFgQvcp3cXZvbo83SfrixKtd2cjJuJ7o+z/C4MsS/rGBYHHWuc6fphj2+dtC
	 uKm/ZVUzZwymTF3RD8DcyLJVdFSoO1Dw0EBD5L1Fj2pSSqntU2HUQeMSBhvcvq1cJk/rd
	 KiE2ED/jK4VzgIpm9F1D4AUboIxqW0XBajfmNRJW9sypxkR9BN/o3H0d8NuMiFwfVZKqB
	 sUznDPSLH9qlNN0MP+BKi9OFOdqkIKHety9fUKSmrrdtkHwj/dbtsT3i2Zn4Ys7QwHlI7
	 tPe4b46O9kTj9KuLCPp36lA8mpmGuzc5M2lCGsUjzbSdH0XbEnzSbblbUOr8CkJl/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H8UuZBrEhbbHVPDHYIvaTWpcXMFzBZ+Te+jVq4ATJbM=;
	b=yHSJXUnvIwV+tKftg59y6AFD9kXdZzmDhqA0wYcPZpbff16Nge8uB2DixivcFEY4z415
	 mB3UDx7C/ay9q0gFa3OAsiJU+C72sD+xgWSpzS1qyATAEEgkCJ3iK030xBoX7nyAKNfnb
	 gjEjmKxSPHN4jG9Bg76sfRdUw+6zvISMaPwdeCIJPLPRwABd/S43Omvttll5h/1s790FI
	 /eR7wY67CJRgWeugKBnGrW6LoPyDNjKU9LxpFR70TKo+4VtO3uQhNzfA6wZ/G7Ywy3fUq
	 7iCtJiWJb4UYmH7oBoM7yhpjaP0JFNkuo5LQeLdblkfo3ww/rjhob2OQwZHxf74lK0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KJe/bbQI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFDC606A31F
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJe/bbQI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864D71F00893;
	Sat, 28 Nov 2026 06:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795847832;
	bh=H8UuZBrEhbbHVPDHYIvaTWpcXMFzBZ+Te+jVq4ATJbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KJe/bbQIsBrjl7WeA22Avz3fan+U2WaoxPoP83WOwoxIVUQo3N2q29qZHBaoT/hXp
	 ub5+KJoUitGtow3zk9G8ccKC2yEmxMNwzXlT1IWFOtcN12p0ay9DQ16/exBTcjYKKT
	 XcFQLCa+0Orx2+qOH+twpRbQrN5oN9ANgQ+6xgoa3f0UCfsMW5BAsGC/FOiTSdizwH
	 wgmEjLhTgjnKKm7K848ixgPyhIBT6S7i5u5OOIfdSsjc2NAyiWXrJxu8xzbxNZrySZ
	 8f6YD7hXwbq3NSghBhkNOPKTzbmn127Ent1Gi3iiNXcb+Ll0lhr09XYy0NOif7p9aE
	 C7dTBDhX3ioLw==
Message-ID: <sashiko-outbox-238501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 0/2] net: usb: ax88179: Support NETIF_F_RXFCS
 and NETIF_F_RXALL on AX88179A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-fcs-v1-0-0c4ede015bf5@birger-koblitz.de>
References: <20261127-fcs-v1-0-0c4ede015bf5@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:37:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 2-patch series:

- Patch 1: no issues found.
- Patch 2 ("net: usb: ax88179: Support NETIF_F_RXFCS and NETIF_F..."): 4
  potential issues (1 High, 2 Medium, 1 Low)

A detailed review has been sent as a separate reply to patch 2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-fcs-v1-0-0=
c4ede015bf5@birger-koblitz.de
