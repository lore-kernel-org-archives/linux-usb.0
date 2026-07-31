Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60336A004;
	Fri, 31 Jul 2026 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528515; cv=none; b=swjryhjdUJCvr5G6F2KADx3N5UMAFDeTrR6QCScrgzoUjVGwHX2yOuGhZSiG+a1EmouIZPLGWP4+MNw5cC+10kwJICm6pNBvEuNJYs7A+D1P2Z5t54mlaBkCoewfC6FL1kSd26spdbfgD8W2sGVxKfh4lepJUymWx5z75Nlddic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528515; c=relaxed/simple;
	bh=xR1PmGESYqG3OykPCrviKL/P27QML3j5v5wsCAN6gL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyxkzyVYfTK/anfZoiQQOw9VU3iBlJXJKCbJ9DzNfooU8BLjgGy/I6zdSRSCdr/7NMRIXDThsZ+AZ9w4/VPUS4Z3ym2b8PiU8/SH+LUlXgraGnXzd5mG/jK8uDyjnt0Go8B2SVWYPZdsiOU9uFvqif2Hewz0hvzpJyHTHAeFEUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdCyOfR9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdCyOfR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D8F1F00AC4;
	Fri, 31 Jul 2026 20:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528512;
	bh=EjFU9yhShpFuI9chxNm4uegKo0v5aVdS9S/vP4jKrKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fdCyOfR9A1wuQC0ybcrQaCmR4AWHLoXUKiD/vzOOLKa4oMr9bPC9saOmhnjbWI49J
	 NZiHyZwTIx9rpjaBw9Cxm1gvGSfZP0Rl1etc+XkldZgVnESfxzod24ifFYmesJkd8T
	 dgxeAMJVyM1LenlQB/RfnJz3E0GF8pUkYUFh9QTXzdhwSmOjSUo53SYjKhJYXI4rwd
	 dA/g9n+T+84Zgg9aEG319L5DwBLzl9u5R29gB5/m8O0JejwEtv/vrL5PJk268mHWgC
	 cf1l0ENMCUFdYW5hEOT50QZWVjmna5nqDjQnzyINVc9Ri0pyWVQEJB2hSVDgyWLWWx
	 oslg4lbHHpzEw==
Date: Fri, 31 Jul 2026 15:08:32 -0500
From: Rob Herring <robh@kernel.org>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bling Chiang <Bling.Chiang@ite.com.tw>,
	Eric Su <Eric.Su@ite.com.tw>, Doreen Lin <doreen.lin@ite.com.tw>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD
 controllers
Message-ID: <20260731200832.GA1476958-robh@kernel.org>
References: <20260731-ucsi-itepd-v6-0-d25ae12b181f@ite.com.tw>
 <20260731-ucsi-itepd-v6-1-d25ae12b181f@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-ucsi-itepd-v6-1-d25ae12b181f@ite.com.tw>

On Fri, Jul 31, 2026 at 06:02:03PM +0800, Amber Kao wrote:
> Add device tree binding for the ITE IT8851 and IT8853 I2C-based USB
> Type-C Power Delivery controllers.
> The IT8851 supports one Type-C port; the IT8853 is the two-port variant
> sharing the same interface.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
> Cc: Jeson Yang <jeson.yang@ite.com.tw>
> Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
> Cc: Eric Su <Eric.Su@ite.com.tw>
> Cc: Doreen Lin <doreen.lin@ite.com.tw>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
> ---
>  .../devicetree/bindings/usb/ite,it8851.yaml        | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   8 ++
>  2 files changed, 159 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ite,it8851.yaml b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
> new file mode 100644
> index 000000000000..246d34734b4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ite,it8851.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT8851/IT8853 USB Type-C Power Delivery Controller
> +
> +maintainers:
> +  - Jeson Yang <jeson.yang@ite.com.tw>
> +
> +description:
> +  The ITE IT8851 is an I2C-based USB Type-C Power Delivery (PD) controller
> +  supporting one Type-C port.
> +  The IT8853 is the two-port variant sharing the same programming interface.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ite,it8851
> +      - items:
> +          - const: ite,it8853
> +          - const: ite,it8851
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^connector@[01]$':
> +    $ref: /schemas/connector/usb-connector.yaml#

This schema doesn't define 'reg', but a unit-address requires that there 
is a 'reg' property.

> +    unevaluatedProperties: false

