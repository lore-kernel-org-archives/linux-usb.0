Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943122;
	b=Xc3GjP4dWc35Abtrzc84OVRT3/A7gNq2L4WaRcdPLmwQty6FgMBgtihr/Hgd61vbOHUU
	 /CFOD7rEf1YgH/KEuW0SV14s2JUbghhl0cA+chfEkhsZ3dNECTQsJj7mmcF7Ysk3WWSTW
	 BCqS8fYsGfU2ImnAqSZ5NbzRAbk3ohMad0infblEz/2GNwbqd2u6nklQeBW2xOsj4S+st
	 xoPgB06bA1xixiC6g1A04cr8mDIKjkLmSMQT/410/uSxpnKSgjsFp/UVo+8rpysE6L7Q4
	 PI/mdZQg7mniHBmOlP7AlHHKWo2tbScYhdHHifYYOg8/3Q92fpR20lwifGww9zikoRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0mDSLbFXUrOYtOc/OjsV+Q3jkRy43MggjzfQJSY6HKk=;
	b=mZS5QDkVDVgCYWKEJkOJ6Kvs+gtae5RByQBnB6+jug7KS1hqoT+aDQEM3RK9KT6EUzcK
	 FP2GP7F1usKQjv9BDZ+6/PD8RjXGcDPrmPytM5LfpUMnTIlgKHewDaG/D+shwSaWWHa8x
	 9WLFQ+CawraswOWogv6FhUZIRr7qbj+GE6NLRu5YT4LBF+HRnDL/4nvQ5jNkURDJDQ+0j
	 WxPtMCy071f1X3mwAMUXsIoYxl3FFx7J5aX7a3DcZ6yGIM2SkhyIpBkNoweM9j50YbI2e
	 5mVcH1TY6TVMju2Cxf4W3dCWuB2/PJ/jJWjtd9Td/YL0MSyf4CGZdNeSsYXqBdovRrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9Cf975o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29157606A32D
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 05:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9Cf975o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8C51F008A1;
	Fri,  6 Nov 2026 05:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793943121;
	bh=0mDSLbFXUrOYtOc/OjsV+Q3jkRy43MggjzfQJSY6HKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9Cf975oL30JIRjjWcvI2F4qcKAi0VZw2luPgF+R0e1IcJhf/krcwy87K1MdbgeQ3
	 vPN+0p55QPs1Sw6C50I+OSNPSDd21PJ83LHEGSg15+Z20JgYenAq9jkY9K9NZNSKxT
	 2CnndylD1LH534hHx4Xuu68NwCT+5Q0MmoMIU0CA6gjBuuvt5RXVSzzOtVi2Ph12tM
	 BvHkS/hqigfD1DweGSEVw3chCM5nmQTV04FPx6M8O4hcRVMDJ3P56vsxp+OlZt5svf
	 Z1nwjq8bIRXa+YFr9Uiv7uk7tE9+/sFwXMJigAqr4/6qlr1HviwO3ZbIZXDcBUfGNk
	 J3PfW1jZa1ThA==
Message-ID: <sashiko-outbox-200824@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: xilinx: Remove description for USB
 host controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
 <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:32:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Xilinx XPS USB host controller IP relies on Xilinx Platform Studio
> and the ISE Design Suite, both of which were discontinued years ago.
>=20
> Driver support for the controller is removed by the preceding patch. Keep
> the bindings in sync by removing the corresponding Xilinx USB host
> controller description.
>=20
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106051820.3414=
532-1-radhey.shyam.pandey@amd.com?part=3D2

