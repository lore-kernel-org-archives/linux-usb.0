Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865285;
	b=bSMDee+ez6uOXlYwAcwJpdMR0p8X+MUDYK28M1Qnj0FPgTqL+LPlPcjQFa0N4IHuMctx
	 ytT/z9HO/3e/kOJQO/40M7S1Iv+VBh6zGd1ptKMCYaLtWl5GzGV4gNMiUMXd+ztH0YV+o
	 US9GdxajV9lhyiMnyPutasTEDnZ9OaZ9obnjzpIzai9FjSJyEderFdyid0du8kUUH4A4x
	 gWaP2rMVquqi5mMg6Qxr2l3ciKw8RCVPJ33MeYbqLdvbWHtiB2E3s2YeVeVQk0lRUfd8w
	 nZFn49rDDeY1xO91WedwsiXa8pLIYBZJRfT7HtGvsEY9HkyezF6/7/YQyJ8PFMR4g+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8aMGcEd6WZ4JNqhQSn8GVjUHmnrA3a7v5Im4m3An9Nc=;
	b=09ydEXKRcLec8djoAWV2po+V4cGX7nCEQhz/URf7/RRprQyIf2+lJFEQi62156wPS7GT
	 sig7hjqSfsEHQ8aNgPK1CsvTHE6FYspHZpxnQepJNWbnHyLISZpUrx5YxS5nx8IcQnNRq
	 9XOquHsZXg5sBrl5nayk2D6NIr+E3A5lYE5b3CRRAhVG5RoQBRmSMMMrC2X4FNeWT6DH8
	 L+wYtp4eDU6OvVOUDFD+zWUAU9P3wemYQSWf11UlUROA/PP/Bj9Z+orWyqf6K6cej5Sff
	 f8VN1TvzgGhI63eQVSm2AYOBVY5IeqYXmz2KL8BkJj3zfdD5dLVOjQ8f8mkkunliUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQ8HA8PV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A712A606A32A;
	Mon, 16 Nov 2026 21:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQ8HA8PV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F2B1F000C5;
	Mon, 16 Nov 2026 21:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794865285;
	bh=8aMGcEd6WZ4JNqhQSn8GVjUHmnrA3a7v5Im4m3An9Nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQ8HA8PVpMMLOcHwr+t7vQNicOsJxdQ27TDJCAOYlgRCfevVyaw0MZPLKyhZ6af0a
	 7xV9Wk/9oMnoZEhH8j8Vc1sqlfh9wCtcmc6FP+giH2lHbadQL6aoXbIGK17y25T2bT
	 fu9AOEWSRWBGdZ+ih1g2ba5hLsJTONSSupgwklOpO7mwOSKdmJJrmU8uA0zLzWlTaV
	 0ruuXsTYF1ytvM5EBkTCTXkyPvynWxWX6JwUp6jgHJFwO7tl8LMNo/EMPoSrjBBC58
	 R5sJWUI0X/0cY+TA3i9Svfn0nC0Go1KmSgB2M8sQPAaFhaZHsLuxf472KgHFuY3Gb5
	 toWZgO7CkJFFg==
Message-ID: <sashiko-outbox-217742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/16] arm64: dts: qcom: Add initial Halliday dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-15-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-15-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:41:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the device tree for the Qualcomm Halliday SoC
> (SXR2250P / Snapdragon XR2+ Gen 2).
>=20
> It describes the CPUs with their idle states, cpufreq and OPP tables,
> the GIC and the PDC, the timers, SCM, SMEM, RPMh with its clocks, power
> domains and interconnects, TLMM, GCC, SPMI, the apps SMMU, USB, UFS
> with ICE, TSENS with the thermal zones and the PMU.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D15

