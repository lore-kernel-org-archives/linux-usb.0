Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676175;
	b=BEhH+p6sWdC4qRCkMQFNUvxbJEc748Air59n2rhQNCwrq9sVy8xv97PXBPxTE65dqc2B
	 TIneWI7DOzOvXMAGA35xj04K6V/G6MGDSQPBTPm6LxfIF+IQ7HzvNxOYMufGNUqEr6TB5
	 6fVpLVDyf34iXHQ+egfBdfdxMiHxk2jSPMqkbDc7ikC9dUV35t7wPUZmuGmCKdosZbtRZ
	 Vnt34+PykUMbp6CXdZLfXC6+2IIL4+v2soVv9Qsi134QpVC64DkINdJUAmzeVebW8rZwE
	 yvusY3op7NAGD9ql1vaKwKOx4bL9YOduKvRXApgc0al0X838s7cALRg97rs5jf9wSyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676175;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3w09WnSpHMCL+nOxRSmrXAUQvEi9x0w0Pki8cgizQu4=;
	b=wPd30PU5T9U7Zjz1TFydpDyZr0K4HSVjz7iewWNxFz8qlHHf9VjY1GmYI4BMXxhbxUJ4
	 ebhcoowRNP7mxv8PaTIu75JdikVSL2eIqAKZafoHjjLv4+Yo7fEa5mqulL5poNA7A8rI7
	 6RQb6zY+zn4AcvTgJBNsdyyIw9INfVaUcdqVXvZlSzeS2DJzS6dAc30F+rivQe3EBSEXF
	 sJNnkUTjIQ4ALPSGIt/NxZ8NjgnJRMqFmIJJwc4Ix9abzeAwb6F4xsvkuuUGbpluekkCE
	 i0LOEAj9mvvxF0x4kqObee4/NyqKKf4SfZ3ohe0x8RSuuEYoZiv94kD48reCQxeN+gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZXwmC5I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1723B606A31D
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZXwmC5I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA2A1F000C7;
	Thu, 22 Oct 2026 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676174;
	bh=3w09WnSpHMCL+nOxRSmrXAUQvEi9x0w0Pki8cgizQu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZXwmC5I3tp+lnV3Lv0PLZTmb4GKgzg4BRCpngt3xrIEyFgWXuXG0OnzNtBlRbkpQ
	 2ncE/P5SfSmBG0E3YEMlEmhmgU243CotAfhgR40/L+IqzPX/jmSlN7ZOKjDMHP66vG
	 K2AUB/0C2WyOfieKMNAkWrYyATFCDrSJMdsOu4ElDNAZosBMViaxT/E967HgeSkShh
	 9gShAcWLldgcFC7kooeIrY8sqjr8oKwsLY+xvTlfH8xbGUIQ1nVtk1EP8hH5DQBBoN
	 iTZ2lIvB8YqrSHUCcfO0iEas84DtdCjEhoyUrFqbSQQdlAikPZ2JKDo8ENJjQavQi5
	 sAmwsDKvX1tkQ==
Message-ID: <sashiko-outbox-181551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/9] drm/connector: report out-of-band IRQ_HPD events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022-hpd-irq-events-v6-1-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-1-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:36:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
>=20
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are reported through the bits in the AltMode VDOs.
>=20
> Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
> and extend its interface to report IRQ events to the DisplayPort Sink
> drivers.
>=20
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D1

