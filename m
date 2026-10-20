Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507148;
	b=R33UBumCMoB3yhb24C/1WpwTj7LfsB4YOx+anE3z45FV+KUyDReewwGovYdOWoKAq6rd
	 jrCsY8W64Tttbu3HHKVpkalNMvofa/RdWR1SmDRiHBCJK/hhgjT6NYhSFDAZ4RAUKnnu7
	 5GHjPxvyHxoaj+kpQVfDi+C6dM1g5XN6c6pzqD22Bldtq03eaOhqgaBIKCWo9LxbH3D5Y
	 ggLHTVLU551GSecCoE1kRO6iYHgaaCBdjkxfN08mqPBMpRvgcIc+XxlWzcL8WbybWIeEX
	 Xy82Equa5QLxjkK1fJauLScOmWN9O3P76WqDfHIZWFt7oTFbl1gnhveCIShP0y7lddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fd0OI87yrZHP8sGTFokZCRchhM6v4K3QxP1A0JaKUQw=;
	b=133H+gBz2l2vxEG1qSTezDLprxlH+mxKCU8OtR2CMupcPvjQ22I/d1yXi9YKf6W+xjdp
	 Z7vplTrwASY10jY3YdnPbhGixq7WzMyuCzAAp/AmbgzFw0jD+hcyG8dL+9t6ht9UB/FH0
	 j+6iL1nZjThXpt5kwSz8VoYkNP7vWJAdCGip3rkumdzRQF4A9BlKn9mGWuy5Ue1eKANqs
	 DWnOggQb2TsBEWihPk4clsPg4OBdRBKTClKdx++I5nqXAStMub99QDyV3LOD+GT4ksiXk
	 wLYXBWnI5RCe8N5do8L8GZnrQEDBfj0Jy4G/DMrx4FBGpStHB6g/9dCVgPiLC5Tjxcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJZprIMt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EFC606A31C
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJZprIMt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD2A1F000C4;
	Tue, 20 Oct 2026 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792507147;
	bh=Fd0OI87yrZHP8sGTFokZCRchhM6v4K3QxP1A0JaKUQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PJZprIMtOFLDHWhY4nAxTcTamSmjI6JzyPT6fBtk9DhaflGEsP/ZrFY/Vw75wyHbF
	 mreQzNo6lX0WOu5T4EQCovT6fCc5TZxkfGEt1tVjTc5+fa+VvQGeRpxmi2L608unyH
	 IiZtyTnTi9JOyzsevbWgK/5Tqewmqk+BYbqnE+p4k9EIAUe6mis1GuW+MgAEQXckEI
	 BGnMPFOlNOI8zgy33XFwFCF56H0/+I9uiJcXUrl2oJPYtM1iDnqM6iCWzYqajHcpAF
	 JhZCwB1GT3njVGmrow/Ge7j6U3B8aABcgmQdfIr2ithltF17D7MmeHhea8+/pKY6Xe
	 8p/AZNHkxZfUQ==
Message-ID: <sashiko-outbox-179171@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: usbtmc: handle undersized high-speed bulk OUT
 packets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-fix-usbtmc-short-packets-v1-2-903f4d029193@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
 <20261020-fix-usbtmc-short-packets-v1-2-903f4d029193@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:39:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Siglent SDM4065A-SC hangs its OUT endpoint when xHCI sends a packet
> larger than the 64 bytes it advertises. Every transfer after that times
> out until a USB reset:
>=20
>   usbtmc 1-1.3:1.0: Unable to send data, error -110
>   usbtmc 1-1.3:1.0: send_request_dev_dep_msg_in returned -110
>=20
> Limit usbtmc_write() to URBs of the advertised packet size on this
> device and send them one at a time. Some devices with this bug also
> stall on back-to-back OUT packets.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-fix-usbtmc=
-short-packets-v1-0-903f4d029193@tipi-net.de?part=3D2

