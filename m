Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919608;
	b=4TomcUFORl1PZbv4IDrUKHDlq1fJ+VRMzHrleXor+xPIpjOF8IsuOjT2b8H3wa7gRKFC
	 Hj50gT3zL4oShJS8q4OQI24ImYjQntRwhKWO65egHYP2zJzcS24CPSQ8mpDaJHBz92RY1
	 jRGUj+SBmqOLz27YnUW/XmxHB2mW6QcocTq89c6rmTv8uacmv/nVdsZUWyFEl9vombnxO
	 i/grMGP4Ax6B8jnw/L8ZHi/RFgUPc+R1NBIcaz/CXU3ZOkvY1CKvyvC0lyAss6addENmS
	 CvsIQTGWo/ev9cMNSCCtpx2gvl596i2PbFCtkh+k454MzRGA5NjVFVQFLN7JBTGjbow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919608;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2VUkZ9oIML5UnJHM/xc0iaBwpT9ZvtYy5xFglIA+aC4=;
	b=TAwdvSCxy2zz8m1DDsWXhW6NilQPVMMMLs3okq2DbbZpq6pARSR23Erbm9KilZcqmnTV
	 Xa2OB/naVTwcEfCPeWjOnlroNxLyiexCmQSGBXOKP0EDyo2rvEDmNhx7uHdYjpGN45+D8
	 vzWcXSZozpYC+hfWx2l4NcaaKBXMNMsygz/5hTucNDGriAo7tn16F4+r2FWH9v/flBOVl
	 B7ccMa+vyu6JHRv2HQ34a3/SX3E1HVa0X5wDyg+XjvPd6lMwlfZt5oiGsXFDh6Zwdm5cA
	 AxBV8LpWoJdXk4Xg7sykO2Pnom/7QG7kAHBdP6opoJyK4iFWZdl/SnBnTnVmdRRkZHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V40wBQmO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC3B606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V40wBQmO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239651F000C4;
	Tue, 17 Nov 2026 12:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919608;
	bh=2VUkZ9oIML5UnJHM/xc0iaBwpT9ZvtYy5xFglIA+aC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V40wBQmObLvtGrf+vxcIfgre6jJI0xeAyfhuVCQb5ZXtYD31STkARV7kIeQkkFESY
	 iAJZlKkp8wntaBR+XSocX/e6GB/OF36F5SXf2Kjs5keOeTfT/Zv9AK7B4eIDQsKWIw
	 0beUbIzV+ky2cnCJqunwB4nxuWDss82T3Y4qHdCTxzY7EBYFDWBeE1B1CGNetqSSfQ
	 XBHKA0ubzO7t2mFIM6gxQmZPS6xJAK8yYvUJrDYDRRSfO9JHp5T5EaZCGnog5TnFpI
	 lWDau+uUn+7IrTueo/SXnALeHRcomDM3ouIOVoFvywkof9iy8WPZ1vR3kWUQw4ItZZ
	 wrkfPC7FscPRA==
Message-ID: <sashiko-outbox-218787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/9] riscv: dts: spacemit: enable USB2.0 controllers
 on BananaPi F3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-7-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-7-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:46:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On BananaPi F3, usb2_0 is connected to a Type-C connector at device
> mode by default. This port have no VBUS supply capability, thus host
> mode only works with self-powered device or hub. User could switch the
> role in sysfs.
>=20
> And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
> support cellular modules.
>=20
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D7

