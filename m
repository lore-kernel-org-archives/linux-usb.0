Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802453;
	b=dTtuVzjVVSs0j7tbVfHdm8xVSsWHK4vlDGNOmLEA9gPMh0FuxGWgik1i9HSjm9+GHrXL
	 zNEp019Ch7/1uIBEMGnXmzQiFRuwBmUJ/krCX0Tmbliz46wWGk6WxlBrEKBCul3YzXQD7
	 1cOn0org90xB3x6Mi8Krb7aqYw/+8Deh+xXXQELLvQbyVr/QjbT89YBeoSnenaFM1QaBA
	 Q+9CnLkTbpC6xO25hjRECOSJQMBNm1eHv8J7c4AONZw/e8QLocBee2m/8HpIK0ak7JuDd
	 HcUWG7bleY6RyhAFRW3OYFA02248paDpUp5vhQguZxD8Fxu3dcfJio30YMv3XCVgv3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802453;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KpQj/CZ0ux3KbXdmFL6dcE0ns+iksC6Pi2KVWKVvppM=;
	b=vlaUf7LpM1tMyMnWCdKM/SUQja6BQqG/h8+EZ5YKjRzsfQjtdEdwDxe2Oc/RhJXvzcJj
	 jQNwg7ZEBuU5n34b5eJbLZ4wc7z54RpnDlYmptmkFTHUN7RjgI47rIUSru1jVJjpFu90f
	 6HCwzYsTrKWxl6hlOEadjY72Orc2J/ldL0Rp86iiFucf04EIPigiGrMFAeW0/EdQYikEd
	 frShjdbRS/11o4xUJ13p/zl4YNkdznb51WM0khiTBdZhPF8JcomveM1A9uTk1BAYZk8+6
	 rlqE3CCoYO+BxfJSKYMcczoOXcKCY61jS/QhgoLFWWTWtIuF8r19WspEBrWDuAKpTfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SadAjz14;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB4606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SadAjz14
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480931F01825;
	Sat, 24 Oct 2026 00:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802452;
	bh=KpQj/CZ0ux3KbXdmFL6dcE0ns+iksC6Pi2KVWKVvppM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SadAjz147PueFNn3IvQiy5kRD8K8KGwfmfCcz+y5CLrtWzVomc/dUgUg4Y+8D8D5+
	 IalqNe2cJd5ZVh5VDIPKPICBSPeRHXGYcabu8mbhI83Xmf89sUHgj2agW7k3kCZabX
	 qG7P/WZjif2I8DK4m5illVZZDxoQvH54q2StoceX41anU5OX+jA8cMusZHmz4uWmG5
	 v6YFcRNfGlmgD9L65Z0rwnBLjjfwlnSlL2FoBwTRQkG9Tj9mSnytd06WHmXIyQXJXh
	 kWbl3ipeVfxtc6w69hHIX4qiEF0y/7QzwGN6T0jLfpJyeFxvNjAwDNEjLKfK66EaIP
	 +ETAdnAADo2Hg==
Message-ID: <sashiko-outbox-183463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 00:40:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
>=20
> Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
> to be delivered to the DisplayPort driver.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Bjorn Andersson <andersson@kernel.org>
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hpd-irq-ev=
ents-v8-0-6ee949e7a384@oss.qualcomm.com?part=3D8

