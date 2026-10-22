Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792632634;
	b=Ywy7IuamrPcK9j054oby5RbmnAVe2sPJhoBn2FAJ9Y0WbTl0jdyBujrzNIRf6vzYLbog
	 ZoFlOhakIjx79CphZAaeiv6GF8DQwDRpK4iY7K7dgsP9269DPKeKBc8ltj+dzwSzbcxY/
	 7GrbllWho40hd4HY6epShTR5/Q58PivoLLIKel/rnEX43xCyT+K7hR5sLMsmt4p9PR9Sc
	 6/89En9zT/12kO4Kp88Ob5OeGV6rj0jozbOs7c073OgXpJgh9oRcINQmp6cSNIAzPh0zg
	 Qp/vI4psiKbxwrrjC99qgu8yNqO4XWnhgxr30d95pDO1AwHZUMbpvEP8dBcEpSaVa9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792632634;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p36+5BWOtM5iNrJak7W9dYJ9SLHJ42nvU1x2lyBOFKU=;
	b=Zu2gABkEiZ9OVUElcj3MFVZ9aE+rbt1wc9s5LQrpouNNsAZhw1Kah/AHGyqOxoa9Fnpe
	 WBS+okRJ/7ecdRfQXo5J+SdIveQ3noo/e+Sc87m4vlkM7qsRdXuy5o6+3PX7lOQWUZ9mU
	 kmu0iiFYG5IAs4WGUOS7dXQ2Qe+8pgEbymhJ0nrdCrVTaov77Z0qA8/R+R504EdmUSSMX
	 U19uEwFDDOxwZ5d3xSso7qeHDYMikcnrF5J06wZFeU4moARtOXPKFq4GGdB0o6ckjA4Rf
	 XV+h0SiIeSb9yErMhh0cbCnETv9+5uNbx1xtQwvl5T2sfTqAcsZavD0lYx6KkkePDzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cW6v8SNB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2974D606A31D
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 01:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cW6v8SNB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0891F000C2;
	Thu, 22 Oct 2026 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792632634;
	bh=p36+5BWOtM5iNrJak7W9dYJ9SLHJ42nvU1x2lyBOFKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cW6v8SNB6SMim7DeaRjoCfiVAd/c4pgw+5nRg3z/ilf+BdefLyP8mUStSdMQohjiR
	 l7/rBebzMDLmQtZ2wyM0vO86T7s9A0lfyD1np5Sa45PEaFj/uUTv1nZmPZ0pPRBfUZ
	 qZxAM9tpiACwB2gZdjNsZgv7HM+rVxoIq2xmDCYgEnnI5dW6KYaNxnoZdFUkLMsp1Q
	 rcDl9TQ9Vr2cchZdISosZGSfATwmh8NoyOjoi8dnD2+bJ1rUOsVaCVq+5r0HLqdo5j
	 5dq080FTP7jqjBg/XOVC7yaZg8wdqSPVuKGGPtVWtjkg+POdoyAJifhs4Zwc7zZCAv
	 KZ7+TGmD6bFBg==
Message-ID: <sashiko-outbox-180845@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: ehci: Quiesce controller before halting it on
 shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joe Wang" <joe_wang@aspeedtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022-upstream_ehci_aspeed_shutdown-v2-1-62712169bc07@aspeedtech.com>
References: <20261022-upstream_ehci_aspeed_shutdown-v2-1-62712169bc07@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 01:30:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ehci_shutdown() runs from the .shutdown callback during reboot,
> poweroff and kexec, for example when LinuxBoot firmware boots the
> final OS. The HCD is not removed in that path, so ehci_stop() is not
> called and the controller may still be running. ehci_shutdown() then
> halts it without first turning off the schedules, leaving a DMA master
> running while the system shuts down.
>=20
> On ASPEED EHCI controllers, clearing USBCMD.RS while both the periodic
> and asynchronous schedules are enabled may also leave the controller
> unable to halt. If an asynchronous transaction runs past the end of
> the micro-frame after RS is cleared, the controller walks the periodic
> schedule with a cleared internal buffer, reads from address 0x0 and
> never sets USBSTS.HCHalted.
>=20
> If the controller was running, call ehci_quiesce() before halting it,
> as ehci_stop() and ehci_bus_suspend() already do. Do this after
> rh_state is set to EHCI_RH_STOPPING, so that URB submissions and
> hrtimer events cannot re-enable the schedules, and let ehci_quiesce()
> accept that state: like EHCI_RH_RUNNING, it means the controller may
> still be doing DMA. The controller-death path in ehci_irq() also sets
> EHCI_RH_STOPPING, but it has already cleared CMD_RUN, CMD_ASE and
> CMD_PSE, so a quiesce there cannot re-enable anything.
>=20
> Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-upstream_e=
hci_aspeed_shutdown-v2-1-62712169bc07@aspeedtech.com?part=3D1

