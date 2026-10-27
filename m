Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114284;
	b=edTmwmg8kijjncIm+qrXH2faYE1lgl+84MNyCQlGwI3JqiIjfJRgxdplXD5vWJluwZCX
	 J/jSVCiAOATP+p8m6OuwRKe9f1Gjn8qUovFLqLxahhu79rxn0XwW+YiGx/kz6NNVKKfFK
	 gCRRd5vsOx9kNtiPvDKVTYpF+6R77EoqaqRwZiE5tu6OgaymUMSPR3o4uWrsCBmnlaQZP
	 ni29kFKli2Px5YW+5GmO4cfjvHndq53VIwFUMeMOSfYNpr1tepbbPOIR9tJjPnmVTI+r1
	 efeFShkWrV3Y6D1+E2HXOfPbrNk3b32kK9zS4zhY4NxPOsQAENFWfCOB8SLrnp1gYww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114284;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hbVfS5vKSnAXun3KHPLT6nwCMAmECmt0O9JXtwbcGws=;
	b=a1QIvSsZwThPTM4SyX8X56wyoe+U179EZhpq8Hy6Xbp2I46eRSiFiqslR4NAmfwnAPpN
	 0COI9iELTDccQGSk2Tpivz11xMay8GyeJ7TBjAS/BeD1ZeI6hxEJfdVeiH4yjD9uVvf12
	 e3znFKtGWfSxUfFmD/ONycvzxn+yZQo+306drgcKxCTR77AgWQvyHjd6J7TvFC0LfKgK4
	 UFYX6mxfgC1b7MZT+7u7pbi9JDgKWO01QSCsVI/nfST6dI/sjk9pgO1/urHZbv0Pgw6Fg
	 /aWaly1lF3sC15FSzEXwG6jRMrISyY8B79whp3xfbnUhnRvS+oFwBarfHzu4dN4L8Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1T9+2Z0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84155606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1T9+2Z0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115761F01825;
	Tue, 27 Oct 2026 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114284;
	bh=hbVfS5vKSnAXun3KHPLT6nwCMAmECmt0O9JXtwbcGws=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=b1T9+2Z0ctOkfboExuGkYZ1TA+ga6plgzETcouhI+wiE7f+ONUfM6Mx/2SKk/2OKL
	 /tdstH3x4IoJ2Bd2VxWpeUbmqabRKtR1VZe0cuGKmr3qWSCErvb6PbfYR8pfDr2blx
	 Lk2Aj67Df82tbDM33aP7pVFVsm61+/3+LWfr3BW65iX1oUwht5bnlNZHKKF8nMRM3O
	 inQeFIgtoEmyAxnZp5CywKYHxc58CUzdJPRqLDfZrAcrmt/deMLdvMgyW07WXoPbVW
	 Cllrg1iHK1JobLNSKuV1y8dALSxkOEov39R7Wnm1g5x2OZB7svE3vPMNZS9bPvaf/S
	 hvwKXmPDMS6Dw==
Message-ID: <sashiko-outbox-186822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/19] usb: typec: tcpm: don't wait for the VDM
 discovery work
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-11-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-11-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:18:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> mod_vdm_discovery_cancel_delayed_work() calls kthread_cancel_work_sync()
> with port->lock held, and tcpm_vdm_discovery_work() starts by taking
> that lock.  This is fine as long as the caller runs on the kthread
> worker of the port, like the work.  But tcpm_reset_port() is also
> reached from tcpm_tcpc_reset(), which tcpci_irq() calls from its
> interrupt thread.  If the work is running, it waits for the lock while
> the holder of the lock waits for the work.
>=20
> Use a flag instead, protected by port->lock, which is set when the work
> is scheduled and cleared when it is cancelled.  The work returns at once
> if the flag is not set.
>=20
> tcpm_unregister_port() calls tcpm_reset_port() after it has destroyed
> the worker.  Commit 98d00deb6ae4 ("usb: typec: tcpm: fix use-after-free
> of the kthread worker on port unregister") put a test of port->wq in
> front of the cancel for that case.  Nothing is cancelled any more, so
> the test goes.
>=20
> Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Dis=
cover Identity VDMs")
> Cc: stable <stable@kernel.org>
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D11

