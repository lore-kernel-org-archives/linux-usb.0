Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864816;
	b=Sx59kj6IG8pArs9K0bcDLk5BiVz8OY2uSzJf5UXJi44l7Hr3Q0+3rwxKBZfrMQruOS51
	 JwtBir6zimxW3ZwRKvu54wfWZXQmZO9eF09DX2ZTeg5rOPm8EjIvkhjhnRJg/JUvKxAbx
	 MvFHkic3cVAZPieCWtyUVY3Hh/2yjdn5GdnDeq3YsGxtf1eWp14d2nhx4Q87vJGfFDHxz
	 ClsLRo48WgaW1dnkJ2cHd6ZM8VXMHTTe7OfqNAKmjVLrSlY/G9ccuu+Yr8GoRXFE7/y2w
	 NhGRln9B7CBd7WuzjpOVafYk9GVbU06w9xYelc2Qva8DPQmjdjHd0vFlVsWwG/VqEAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ocx61EtOl9JrKs8sfZY+DgBgpaIsy0LJN2uz8+d6+NE=;
	b=f7QsloEuH/t4VDg6jn7OxK864RGMSy0Cpijix8bOGAwK8DaCnzeur72GddZ/lS/m7/3R
	 af5NrQkrE3mk6khVwshMLSWjjj7VecwWsmm0zkS/BAhBwgC5SSXi8/5sthpfzyS+CEguh
	 1Tpc0FU3ky3rojv4kLc+OoD4oMZNBL2yKyAeReeEmTzeAerFv5A30h4O7LSDDld9ZtaXI
	 xmBMn16OjhJ0OQjZGZW/G4CUbvH5Rzo2EMtPnnEeknDrZ3wiMIWyM668oXj3BdIiOXyYV
	 yzp2RtvdEVFrxPbRKFHLyWCXBwkr9Gjo6NAFP1NflwWC8Wv7UCE/fdjDJxih2v9Ewng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xw4QJTLh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5825F606A31C;
	Mon, 16 Nov 2026 21:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xw4QJTLh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE721F000C4;
	Mon, 16 Nov 2026 21:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864816;
	bh=ocx61EtOl9JrKs8sfZY+DgBgpaIsy0LJN2uz8+d6+NE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xw4QJTLhjx4cO0fsT3ZwXzCr5r8lkziXi2+8Xc2omhtqZ6oUynf2xbU6rK3XTdQXI
	 wtd/+E/GuGiUT6T98acunqWFC2fUkvR4RCSzI5tBpAjQSsEnVaOr62CdT5CMq1Rrox
	 NUiN9uIuDQKgBES4OT3pLJI8cQuhxPHuQ/S87YcevU120EYLRceYA/5uofvSGzUU5I
	 XkZLHZXw4v7QSbAxtCRyeFmlvYAWNQIlkPTyP9aJpINqdfysg8xjFLW2M6v/Vb49GT
	 nmKuqITSU3FNqksMVU+FLAR7vSi6tvwM/bwM7SX+daQRaZGXVVFlSwhDWRLbl337/o
	 j9ecjPjmRoZHg==
Message-ID: <sashiko-outbox-217734@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/16] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-5-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-5-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:33:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the DWC3 USB controller on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D5

