Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761EC3C1D43
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 20:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267305; cv=none; b=cSgmXgoH+UfUFMOPWl+xOSDXQTQ1vceF1tUqg/f0Fb2MZOI02dICnpJBJLsAxT/FS53PcDaxzrw4sBCYJ4QAOJBFIjkfnfMYuwpT8SCnxN/WiTJXKnfAdTAehtyR3JwCwRM7M6IBh50amT3/crufhwb5+hjY/jWb7tpq5oJRG8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267305; c=relaxed/simple;
	bh=nsliGJQ0yQCv82hdusa+KKiRLP8czKI1kaSG71673Xw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BDzcQylonGruCiWgy2fpHRHIKCuaXRuDfKZCkAsIPljqOGbyY2gpDZMqb+Q+sE0AqWkE3IXfL+gyDNaGMgUjqlEOJ8vrYyY1vSdIbpxCKN25sZnPXAKH+MQoTlsDadjXSv0HG3qafqDfyQtE/FZ2OzIrI1Iz4dki9uWNpG1kmm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNY2uK8l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNY2uK8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB391F000C5;
	Sat, 17 Oct 2026 20:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267304;
	bh=eKDZfOes2/pYeYKHHbKkvHlqiY76YoObdmudwP75s+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fNY2uK8llNcgQt6mNaXMiMtILyMxH7npHuWcsICmz881R5MC+kFfOhdMJEnzvjWd4
	 zIn0Y3zRQ78xlzKgtfp6CAliy8skKmnRHBuM3I+hfmmrKgxyYOsVFGNDElq1V1IJkC
	 pVRNpgdKrf6Rney+mnpZgkq61nEMIaoyVszK6YvivdCcWcuSXZZcpNQi59YBrAovic
	 oACG+Ap1EiUu8An65AUb9SRtLEBKrkic/gVQR2Zzo7N7nZIxgIOsHRc7Fy8SAsq9Sm
	 gRzJH+psNl8AATF/gVyPqp0O8+jhuqB60nCObo6JYHZ1XS0RamgxNlbCPP/teFAeTj
	 Lu9TgBvCvglWA==
Message-ID: <sashiko-outbox-175813@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sre@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-1-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-1-7ab3d93553dd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 20:01:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> The typical USB-C DisplayPort AltMode capabilities for a down facing
> port (i.e. sending out video data) looks like this:
>=20
> altmodes {
> 	displayport {
> 		svid =3D /bits/ 16 <0xff01>;
> 		vdo =3D <0x00001c46>;
> 	};
> };
>=20
> Improve the readability by adding defines for the numbers, so that
> the above instead looks like this:
>=20
> altmodes {
> 	displayport {
> 		svid =3D /bits/ 16 <USB_SVID_DP_ALTMODE>;
> 		vdo =3D <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> 			      DP_CAP_UHBR_13_5_UNSUPPORTED,
> 			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> 			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> 			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> 	};
> };
>=20
> The generated DT binary will stay unchanged.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-dp-altmode=
-dt-defines-v2-0-7ab3d93553dd@collabora.com?part=3D1

