Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D6D46C4A3
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142638; cv=none; b=OxlLWvcqV2Qf0wxvUIai7NiqSZ3HJ2qfjJVzNljz6YmTiJ0fCXqvXQRcL1GLiik/FCs1e4MUF20rB+asuLwYaA4nbhLJykiUGatOoxUd6ZTfGkJh+VeJ6wOaMfYw2xs8y8GWezC3hp+LC8FpDA/TO79x5HKjyNIOw7v2+um4kdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142638; c=relaxed/simple;
	bh=05nw5OVkxuSH8ldNasczYJWL6TatlZFmgXyyHy3v//M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sKNaETjK0hv0dkkHQC4n6wPqPuElVbHcErdoezUT7egquYj+EAhaoZLhAd1+uTcug6ZY+/Z/Z6SLzXBpVl+JP0GM1jb+g2t/T5JDyja9umCoz2aSpeBLJytEOqT2/krnXiunGFNNZMzw+pJpp0PrnmYq+aUf9FUcwcWVw2etfPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L30WFjjV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L30WFjjV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4737F1F000C4;
	Fri, 16 Oct 2026 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792142637;
	bh=PuwrEX9qS1iRsEaEAR7I9HY5104FKVZ+mFIuTC2yYSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L30WFjjVwbpYpbckeeFfSOA5ulgmrA6ptv7QR/EulxMR/hr7RCNpjGOIq9VKl/06T
	 yFg+QpgbtAeY8f5Kg36IPlYZpIiIA6I7aGNpeln37BQka/90Tlwp3SQou/ngpNrmiX
	 TIytD75uTHH/HsA29pFDEK3O1I0ADmWeHgBMTOWNKxVhTRHezXc9z3vVt4wOtPbXic
	 T48sRG+jeo146AjdNmc/Ub5LBz/42M4Y6LLpYMH+WWbmEVSceSrIYI2Uxa7OaFrd5G
	 nYCW8O0ProIRaEgclOuzq1ZIulqtE0Vnkq8BzDa54NL27XuhQfITcKMK4qPfAW0ye1
	 4PW3+4c2o7+hw==
Message-ID: <sashiko-outbox-174076@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Chen" <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
References: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:23:56 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
>=20
> Without this bit setting, USB2 HS device cannot be reset after it is
> runtime resumed. For example, after:
>=20
>   echo on > /sys/bus/usb/devices/1-1/power/control
>=20
> PORTSC.PR never clears (PORTSC =3D 0xe11) and the hub driver fails with
> "port_wait_reset: err =3D -16".
>=20
> Set snps,resume-hs-terminations on all Glymur USB controllers. This
> makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.
>=20
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016091336.2715=
717-1-peter.chen@oss.qualcomm.com?part=3D1

