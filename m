Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169021;
	b=qOqClyIpZylCeAjXwZr9NgQu2KLM1iUuFhVH5b9vppDXYhJFPa/GlJeK64vrC54lItG6
	 HKkrLcQ4WEIEs0esiQ3qFWJjMSVpoB/MUnzZyxetRfZ9LvR7bsHV+Ztfsf0ZG5RUVL86t
	 aFy0Crj2VxpfHshf0nbuM6GbtfS/Z3IsXGgSOPJ8kZW7aL8Jf/Tq5C7VPBv8VyLU9NzOT
	 1Krfy7fmgk8HEBl8xCtwYXKzyXy0e6f7OLmx5snMH6EtzchQbAJ9++tvnW8rXxWeeSW0G
	 2j3gstpJF48e+ngYVEERankPfyEcreIADAwCdcK2XoHCsvyavlHugebvQOp2/Qx0l/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169021;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=42r307tkm1LYbWPTePTF31lYiqzl0b2Yd6wGiNW/GVc=;
	b=Jp3gtHP2QM/WTTNFVpuHW2d2zjvfzuEwDoAShscudi4RWIQw3haqneZOAbKP7etc1b1n
	 cO67E+0KORcc+7bSMPUFmYRUqv5BV9uaxeZjq9lsUzm0E3s/HYYvx6EP1JOiBC89aP74A
	 KJDGwvBth7F7ejNkyCyOY3hVFmdxHKic84H7BRoClQWTXhV38Z1XVilYz7K7aA5AV2WkW
	 xqLtQFlrsGpYdmtxuFKWYJQRfjKZiqNkhV7yD5UqFM24hAYxC2y/MNCYJruUE9w8mF8eS
	 Qte7A/H9UFqfhmUkcBST3TbQo29ydlMeB/+7kZLqfz0y+IgJMdAFnFKM1BzFDeMTEcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBBXuIvv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41E3606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBBXuIvv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A361F000C4;
	Fri, 20 Nov 2026 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169020;
	bh=42r307tkm1LYbWPTePTF31lYiqzl0b2Yd6wGiNW/GVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gBBXuIvvj7YlUqcSJsAu9LnmuaNu2PkAudCYNZv6oxlG3zPcHE1LdT/9QdSCwNIZL
	 4savnfZa4XRFerfgFa6wfYG2yJlsrWOcVWBqgeavyR99OuipQmNzrOoNmSWqQ0TSRB
	 0RF2b5gPdcA9ia8uMxrRqruTPsMQ8mWaWTLkrUFGW0TrVScNEzWqrHBjGzZSihtPKy
	 YUmxlY3yum7HWkUz/CYTYA6uIcKdnlQ9WA6YQo/4M09gGIrqbnjrI6DZN3PTJpygDh
	 0uqLgltKDN+HaPbNNUmsWUDuk+AFSoDGINTGaBybexKt9z+RjIIjjTsipmwxLCaBWB
	 WuJ14uQsFeKyw==
Message-ID: <sashiko-outbox-224903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: typec: qcom-pmic-typec: pdphy: disable the PD
 PHY on stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-1-9a152f906fba@linaro.org>
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
 <20261120-topic-tcpm-qcom-fixes-v1-1-9a152f906fba@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 10:03:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: typec: qcom-pmic-typec: missing Fixes trailer for pdphy
  stop fix
--

commit b45aad2ca233d0a40118f71870955c8a4770e204
Author: Neil Armstrong <neil.armstrong@linaro.org>

> usb: typec: qcom-pmic-typec: pdphy: disable the PD PHY on stop
>
> qcom_pmic_typec_pdphy_stop() only terminates the ongoing transmission and
> clears the RX frame filter, the PD PHY itself stays enabled.
>
> Use qcom_pmic_typec_pdphy_disable() so the PD PHY is also turned off
> before its supply is released, leaving it in the same state as before
> qcom_pmic_typec_pdphy_start().
>
> Assisted-by: LLM
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

[Severity: Low]
This fixes qcom_pmic_typec_pdphy_stop() leaving the PD PHY enabled when sto=
pping.  Should this include:

  Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-topic-tcpm=
-qcom-fixes-v1-0-9a152f906fba@linaro.org?part=3D1
