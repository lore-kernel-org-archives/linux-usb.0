Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473350;
	b=FQMjk63/1lipV51FfbPzViFy9AYq/HbfOaov9kMImx6YjWejQubkG5EZZx//vZLPKHEd
	 ZTD+t3VYFQIM6xuUYZ0zDaewcZtmFXszMZKWEOg6vn++Gls0phbx+G96e4Km8VmZsh5RH
	 psRtCOUP73oIcpT899i5WDppPN3qLpL2Dg7L8POi2PW+Me6XZAH3fQc8b1pCahrlNEYpm
	 A8jdyP4Cf6/awuwdJQ5BA/eOCMGqS2z8H+TH97PZTWQyh7kaX48E6i3GuraHDUkO4h+8c
	 q5TPvaGbyxUI7TBidyZr43eEEejcACLhMuHzVKXvgtUgyZ0fMfE/fPmaMZPt9dKFwCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473350;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TjwuT3TdgNBmN9q7TxciGrk5LYdYYDH+gISjP1+bO0o=;
	b=aZo25tqmmfEez0rLOjpJbxsXT00BczOb3eyQp1PeN2sVFlCnBYK6d6jyMl+10mPlcj7Y
	 VXEVnMDI+QnN9xP6tr8TYkEieAXxJtWBjn4GAePlcykthfRL+OiZsq2KEH8BBbhGpeGbK
	 CTjOhj7z62X7tOp3v9endIjGjxwGobI7pStZlqgQXq3azk0PITex6L8Q5zch+aS/HVgjn
	 gk78eaKV21uUeOIx+oNqqnuLAJpD2DssE+YjbJOVw+Tr3/QBVMECzOop02xYQhQfRfZ8f
	 YL8Lbo3dL7kcrGivEu2L1kFsE4mCJ0IdqX6ZSqteb2z32NumqGB8n9ttReJpQ6dlpQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmNu7l1E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFC7606B59A
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmNu7l1E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7041F00A07;
	Thu, 12 Nov 2026 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473349;
	bh=TjwuT3TdgNBmN9q7TxciGrk5LYdYYDH+gISjP1+bO0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmNu7l1EiR6mSBNST3ijZufw7uDXeM54InqATZnrMYUxx2jZJtHpqGipmpxXrcfNr
	 0TQVHj2VcCYiJWdR/sEqvOK0jUo+EcWC3r382uH1S1jbIuKn6BHBQEDu7nmFKz5uFD
	 UaNBSQibUpeG4T7blEeZ0d1OnNTowZ1FcG6/0alJNDvmn0eKkLD4FS/n5Ij/MmNXlp
	 v1OWLRabW/nnwhfEKpQP+o/LGl2KeoMXg5SSTLprWne9DdrCS8x4Qo81ge4oNnsyxA
	 more+16hBNek9zGNuzxYfds1XxT6EW8ddJD8eFvoPR8iJhEPjQjdMYIDwukQde5Eyo
	 29FnQ4drydT8Q==
Message-ID: <sashiko-outbox-210786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] usb: dwc3: Let the glue keep the host bus
 suspended across suspend-to-idle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-dwc3-s2idle-optin-v1-1-842e3f8413d0@gmail.com>
References: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
 <20261112-dwc3-s2idle-optin-v1-1-842e3f8413d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:49:09 +0000
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
> In host mode, dwc3_suspend_common() tears the core down for system
> suspend (dwc3_core_exit(): PHYs off, core reset) unless the controller
> is a wakeup source. By then xhci-plat has already suspended the bus:
> the root ports and every device behind them are in U3/suspend and
> expect to keep their power session (Documentation/driver-api/usb/
> persist.rst). Resetting the core ends all of them. On resume xhci-plat
> finds a reset controller ("root hub lost power or was reset") and the
> USB core has to reset-resume every device, which only works for devices
> that come back within the 2 s that usb_port_resume() waits for a
> connection.
>=20
> Devices that are cut off in U3 do not necessarily come back that fast.
> On an Orange Pi 5 (RK3588S) a SanDisk Extreme drive on the Type-A USB3
> [ ... ]
> exactly when suspend tore it down, which xhci_power_lost now records.
> Nothing changes for platforms that do not set the flag, nor for
> suspend-to-RAM, hibernation and needs_full_reinit controllers.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-dwc3-s2idl=
e-optin-v1-0-842e3f8413d0@gmail.com?part=3D1

