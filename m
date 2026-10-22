Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677485;
	b=y6Sa/4KO6DzCLmylV1XsoHjkebx/Ijt7zWjp/m69YUIk1sqMtj/+vq+NZC8zn3NhRTh7
	 RmU1kqdiYuttdxNUP0XyPYgy6dsUfYx+LBwk0QwCqjUgJxcsSwJHYV+R6gFOov0ZsTeO8
	 eZOVUCbmWvBGexpqz4LoK/CYxWivzTnPxO4FamTAUc17AmeZYzBnP9dXplEJ8p77BIoMZ
	 0S3SMnMBg8XdREs2IZNEVeC8bPYcnkRZYmi8G7a7b5Jn7NenWwRkxO9IzePGlkmQz6pTa
	 8dnxSKFMZlmZz0I57+pUmCU/OupzVQN1yFw+OkGkPA+wla2ltKxx6FEfvnhyskHOyrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ddiv1NEr3L8zUaB6yABTYmPtE61es5/dwsh4yzrb3LU=;
	b=WQIrB1GDTu4lwsiK/rBFjfKy7azBjaccFrOdSn2yMA71ysPHfifOqWmk3YrNHSm1Le91
	 WMe/tdWRr2ydpvNGYh0asrRudLOp5j+EXbeXEG160rAaYHo4GV3b84iIn+O6GVUXCBhUn
	 NQprluQKj7nvMRlLVGhuwpiSeRma+qOCa12TBoNvasmbygIR9MzZr80vPpSvR6ad0eiEQ
	 id0B/wtnsPe8w6sZoRiiTzWjxzQ0KH+WxQCATn3Vc1Wgs3RubN80zBrfkdU+0BwuO9Cor
	 hv5vlmWtbNVbHVIsRZlAM2NVlSfSbBQH8gL4gIJYcKIbMExHVrWHscaSO8jrwIqHjDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvSn4nxI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87709606A31A
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvSn4nxI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34ECE1F000C2;
	Thu, 22 Oct 2026 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677485;
	bh=Ddiv1NEr3L8zUaB6yABTYmPtE61es5/dwsh4yzrb3LU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BvSn4nxI/bFNyqQP/P9BxSa4W1uWnwbQff8V/aslBVeGK82OTegkZjIgi874U7tHU
	 AEYS+xkFvtiVglPwDvSe3sGSyGn0i9vczZEeXrxkGbAAVmHiczZXCBL4oDMTJazVs5
	 J0MrulMNrb4Jld/Mj5sfmDUJJCibYtrdug4X7pBlj7W+lmX1gnphM20B3aHMRgMX7D
	 CJKRCZ8e17hyQUtYgwocU9oTK7zPELeH5gmPG+4pYgylakTegp9CaRkWIDpSmm6zX+
	 ks++4K0GcsCKRXTqoj2sQ11TPIwDsQPlaWoZBSxkAm1/ApchlGlQg9Igkr/9DGwo2p
	 l+0DbPmsnGcxQ==
Message-ID: <sashiko-outbox-181597@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: gadget: f_tcm: don't hold dep_lock across
 unregister_gadget_item()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slawomir Stepien" <sst@poczta.fm>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022134926.1125473-3-sst@poczta.fm>
References: <20261022134926.1125473-1-sst@poczta.fm>
 <20261022134926.1125473-3-sst@poczta.fm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:58:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> tcm_unregister_callback() runs when a TPG is disabled and unbinds the
> configfs gadget via unregister_gadget_item() while holding
> opts->dep_lock. unregister_gadget_item() takes gi->lock.
>=20
> The opposite order is taken when a UDC is assigned to the gadget:
> gadget_dev_desc_UDC_store() holds gi->lock across
> usb_gadget_register_driver(), which binds the configuration and ends
> up in tcm_bind(), which takes opts->dep_lock:
>=20
>   CPU0: echo 0 > .../tpgt_N/enable    CPU1: echo <udc> > .../UDC
>   tcm_unregister_callback()           gadget_dev_desc_UDC_store()
>     mutex_lock(&opts->dep_lock)         mutex_lock(&gi->lock)
>                                         ...
>                                           tcm_bind()
>                                             mutex_lock(&opts->dep_lock)
> [ ... ]
> configfs dependency on it.
>=20
> Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022134926.1125=
473-1-sst@poczta.fm?part=3D3

