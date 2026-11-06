Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943049;
	b=39foP8/YUc9/dtnSTuwn/3l3Nw2DDpyxAhqQGfyxANNa5VnS9eMPYxyPrPXP2fbsYF+q
	 CvrCsFlEOvljQDXgogyMgDymiZpJb8oUqTJJ/BlAIqTUq36Leanoy5Tc5uLhu8e76OcFd
	 E60Dubn4njCb6wHEP/SWvqDy+KsuOfrkxfwDs2yFTFpgon3FWb4acTHwvxGeIgwjOhf/8
	 7dfX3STLcsTmXEuswp4Ve+q5KVLtbe4RXLpw3uPt/8slb9Q+xRuNfq5OiCgvV7VBtz3nb
	 67HSiA9czqFJQINTRYIarc/1cHFngUv/L6A6gHuorTBZfp4T/Vy4rmXcIGfwkItB2Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943049;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ksOpLdggoUz1i8wDLV49/HUpf40aiQm+YhQNAOMQuOY=;
	b=vu0QN5Lz1nnmXpVYxqZKGeaxVGjyAhyUxrV3vGcWaJPLdLI6XYhUzgRsYvZlXKHQNvyA
	 i0bz0zeAp+Jho5g43BeonTsDWhUETeodvYvGAh1qAdxiKr5NGIQoAzmoK7DDAUcdxRF9N
	 Mv3SIh/F6k9AUq5GXq8hgIS9XRcyJejgTv/QJdXLQSGhdGZP03KnNyPLvYUd8A/5GMrSs
	 hKMOoy7tNex+JrYGp/VIqFfU9F9M+UwLPRs3PhLFZ/aYsFjUaYngOm3j7DT66XQVNzMVX
	 acvZmbD6MCdqZtX0iXj3b+u55wHI5BDkIID3mXE++jN1GcIXZ0TPQ9ncSaShdsSOLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ffn1fDJP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9236D606A31B
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 05:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ffn1fDJP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B8A1F0089F;
	Fri,  6 Nov 2026 05:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793943049;
	bh=ksOpLdggoUz1i8wDLV49/HUpf40aiQm+YhQNAOMQuOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ffn1fDJPb6J74iBn5Htb8pQWXlNzsDg6zLY/56PgYLpiqX3UrqbIKbPDmllmMiM4i
	 WxLMc7qux47NMTLoia1P9Htd/EyY1sAt+ygYrT+roWfpPnucxqWbMODtYYteXnPukZ
	 CrB+/UNI9IPuiOpCoIGmYLpVWC2Ctgdn7e1NpxRMGYmW39nmDscYgULmYOIPuUnrCy
	 7LJpA2XGZ2MiZbLSjnsu2dgM36REGfXdwJDiT2zt2MEkyvrGR39HP2L5YsxzfrpuON
	 mXJ3jO9CCGeeFtq17bUuEqQJ4RrJB0xbG4FM1fBJDzkCdlJY4pQZHIHbDYrKDOKFVp
	 6CqioaLbZsa+A==
Message-ID: <sashiko-outbox-200820@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: host: ehci-xilinx-of: remove the driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106051820.3414532-2-radhey.shyam.pandey@amd.com>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
 <20261106051820.3414532-2-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:30:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
>=20
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
>=20
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string and no defconfig enables CONFIG_XPS_USB_HCD_XILINX.
> The compatible was never documented in a schema binding.
>=20
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
>=20
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
>=20
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106051820.3414=
532-1-radhey.shyam.pandey@amd.com?part=3D1

