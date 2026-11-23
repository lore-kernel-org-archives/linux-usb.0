Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429345;
	b=OzriOZU/vhH7aAYt+PL747hMz/gAzUDS52Ow176oxWgFKwEXLbjfGqhlD7QoVpvzgLL7
	 TTCwJ2rrHmLVyl/p9Ez7MwEsG4iDs8VNdTO9M1FAbCi6Y0BA+HXu6JB+Z0XBfp8uRS49B
	 N7sTmq9W6U55aZhzecynuRIQgQYM1GkNoACSlOEENk2uKq3pWvGnJUhFEhLdy+oVk5/5W
	 710+1DiO6VwQl1/RmplvuhIttbYBa6t4UziNIkRlzNaSx7Vq5C1Wt7N8tDZGbPN0lv9OQ
	 MA/5qeQ9661uNRhxIA8PJ3CtmL8UXuYbD2QEjhiNtW94Ey5O2xncthpOeW1zEY94h9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429345;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DXJfZIdCRJ6dZwxaezq7C81LdYIN1KoGr9X3zqsEH4k=;
	b=Fgeny1StLMnpgJG2dGEYVbDoO+APqB/0icnKl32bAINVFTgrgA56JrnsdUuFhFuC8hzf
	 HGtdq/lcruYsxOSTx23YMQIb2ECFM8MR2g6V5Xvfmnn3tOqIheTSglC1VqKqDHxg37Vyv
	 d7VjNA3YXn9FI0TOBYhDUiZO39zxlPD+bVkYLYdjFi7HJ8oAptxxTwp4PlwRD/F/HMLMj
	 tQgHC88qdVfTa7j1/5d6AD0hPL34JjHSqLUYqq9qMy4/BbZv07GsId1mqFkKVaY2NuC5V
	 dgGH8DW0cIWyalVrEevu0PXhZHlDgDRRCK+W0B7+SHdnUrJ7jFiDsvUfchHq/wAUzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWqN9whC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E120606A31F;
	Mon, 23 Nov 2026 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWqN9whC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186831F000C4;
	Mon, 23 Nov 2026 10:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429344;
	bh=DXJfZIdCRJ6dZwxaezq7C81LdYIN1KoGr9X3zqsEH4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WWqN9whCXmKzm2/WhlLXJC1FkMLl+xZZLL8EagBCpXHltjpSnLD0e+GAYEyNYhBUd
	 QU7c+tIIKDbKt8z2oli3cUAZH4gYT+vMAC76rdFtDIxybm8JXdI5+XNoBLI/YTst0B
	 ZN5y/dycfIiCGCaLj4uFMMEXzwbxZkHkuiajSTnSuxec2UL5rBVrWJXNPCszE669I6
	 qzAUp3H4DX9hc42LusgLj2W/LhWgTpUhdQCzZL8+16CIVHaG4DYmnDs2GE+KAMaId8
	 vd+Jnq3fpcrUL49dG+RPTIB37fRtCck/Sa0xpWO9jMrQ8DrR9w9THHYcS2eJ91fKCI
	 MCpr6p1IQQzHQ==
Date: Mon, 23 Nov 2026 11:22:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
Message-ID: <20261123-crayfish-of-splendid-courage-c63931@quoll>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com>

On Sat, Nov 14, 2026 at 04:39:04PM +0100, Igor Opaniuk wrote:
> The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
> CSRs and the mode manager register that the secure world writes on
> behalf of the driver. On QCM2290 the mode manager additionally ignores
> the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
> the boot firmware does the same before enabling the EUD, and the
> register is written through the same secure IO service.
> 
> Add the compatible and describe that register as a third reg entry,
> required on QCM2290 and not allowed on the other EUDs.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> ---

Feedback from Sashiko looks reasonable and I do not see it being
responded to. Dropping from DT Patchwork.

Best regards,
Krzysztof

