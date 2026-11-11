Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388692;
	b=DBDNpPlXPXX5oAP7xsSJMykGlBIHSlKgJBTLC7L+qs0Lm4tWIY/hvIg9a2TdPHfCkcBT
	 V16PUSB8p8ZafQv84uqsX8MIY+PZXBp/mx0Z/QKafMeQCSwT+v4S7KlX0Iu0HhWvhtmLh
	 MZDZ33OvtGup1cLpdFHBxIA3p8VHRXW7SpqBqNUp6BOfVEXXTCV0IhkaEpVdqrRU4UmlR
	 8HprQbr+UIuCGT7EthwKx5ym2VWlmTENo7RgYna9R/y72z3eU4PKkoDvsygOhjjGxrIM9
	 71YtZa9PeYtaAbuLY5cNdat89pwG5csQam5EtT5WM6fR0g+yEsczq/+E+h3yd4J2W+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388692;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2A5VloERchtvuhjSsO0e2rwutxH7y1QS+ZMi3Rqo7as=;
	b=gzaAHzHL7HqKIV/m59u+92QwQN1jC/dlll3U80BPP+TIOklDEVSUx0PfPpaLEhqVybEN
	 bEwJJeIAZddRr/EMOap+NRPZMuhxyU1CtVpCKditAcZ8kT+Uvl1d2dTsFusGJD/xPHSK/
	 pOWGTGlYoxGvQMqpFNUXd6mq7IcWXpHY1pxoL8WMu9t0+FNOZgO08WS8z5CnqJ7KfOCP7
	 1BHOeZd3zTpGJQ6Jj+6eMzeiShswaTPETP6teN4IsxTOjvmdYWI7Dp77vnUofHaC4BFqY
	 4QYbK2bGWxeFMhDEblVNVv+KF8RmD7jGL9h5YNegBUuAGD0i/8QZRDedVny8Bs0NAVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d885vXhh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD4F606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d885vXhh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE331F00A06;
	Wed, 11 Nov 2026 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794388692;
	bh=2A5VloERchtvuhjSsO0e2rwutxH7y1QS+ZMi3Rqo7as=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d885vXhhqucgDMIq0iFLOPk3uBQeCC+c7TU5fe25Ps55c5dfMPCkWabiO1yNYhS87
	 X+UVbGGP+Tksx38jc1mFLhZNNGUGVw69ctn9kumFx255DKyoebZJf+jzmkWQoetRte
	 GY907uULBEzIeEZZhPOX2umqyhKcWRxyBeIGuMbLzcNA6o1oLZrVOa7LotFjR/gtpZ
	 gW79ek4AXowYNYsyhSzZ95id8PFzKnWHi/wJb+1VKe2pV6sOUo7D7PQPG0CZAkJbpb
	 EnEG6qZJnFsljxOdDVfd+Z24FMEgJxgWnNt1RbK9f9LD8GBkut5hvc834DykbFY6BC
	 Pts1wROuLW93g==
Message-ID: <sashiko-outbox-208679@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: dwc3: Notify the glue of role changes from the
 mode switch work
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladyslav Tymoshchuk" <tvlad744@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111090122.134-1-tvlad744@gmail.com>
References: <20261111090122.134-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 09:18:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> dwc3_usb_role_switch_set() and dwc3_drd_notifier() call the glue's
> pre_set_role() synchronously, from the context of whoever changes the
> role, while the mode switch itself runs from drd_work on a freezable
> workqueue. Not every caller is frozen during system sleep: the UCSI
> connector work, for one, runs on the non-freezable system workqueue.
>=20
> On SM8750, when the USB cable is unplugged while the system is in
> s2idle, the UCSI connector work for the change runs before the devices
> have resumed. It switches the role to USB_ROLE_NONE, and
> dwc3_qcom_set_role_notifier() accesses QSCRATCH while the glue clocks
> are still off. The access does not complete and the SoC resets.
> pm_runtime_resume_and_get() does not prevent this: runtime PM is
> disabled at that point and the device is still marked active, so it
> returns success without resuming anything.
>=20
> Record the role and call pre_set_role() from __dwc3_set_mode() instead,
> so that the glue is not called while the system is suspended. The mode
> alone can't carry this: USB_ROLE_NONE maps to the default mode, so a
> switch between it and that role leaves the mode unchanged, and the glue
> still has to be told. Make the call before the checks that skip the
> mode switch, and only when a role was recorded, as the mode can also
> change without one from debugfs and from dwc3_setup_role_switch().
>=20
> Role changes that come in while the work is frozen collapse into the
> last one, which is the state the hardware has to end up in.
>=20
> Fixes: 21188e8d6d75 ("usb: dwc3: qcom: Implement glue callbacks to facili=
tate runtime suspend")
> Cc: stable@vger.kernel.org
> Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111090122.134-=
1-tvlad744@gmail.com?part=3D1

