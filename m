Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D27279DB1;
	Sun, 19 Jul 2026 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784446651; cv=none; b=cRQ6tKi0y4L6Vs9n54MC2V6Re6mQw66BC7zAgC1z+mm6RvTTGLQ1HJ+8EpjxlYzXyP6EcMVdZans+9u+/szVjnasAUb3rWwj7WG/N3EI/P7fZtShwftzPIX/GuuSVCRIh7OPYFL6d6Ihw6/jYY+N94izJsmf+w4P4rUEUt48lQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784446651; c=relaxed/simple;
	bh=jOuZEyzV4YI1CqxmgDjY4xl0G1EMoH768G4CcIS90/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MN9v3Hg+WzoacIXAb5KeNbnzQousHx1etkflz3rJ62Y0p9i8szg7LC+3PBRjav6QcpY24atSywC4j2Rk2sMTQpN5ktgRWEsL44Vg7Jn2TF4LBvWAx/Zb3s4IB3RV1Ns/hfWZHzN5XOLFP147XyfBYyUT5dmfI+COMUHl5ql0O9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXBvKDMw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXBvKDMw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174A31F000E9;
	Sun, 19 Jul 2026 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784446649;
	bh=tq8cAinREiF1QjcJWs4et08OShKHkGwjsjdvNcJEX7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VXBvKDMwvkhfAwO0MtUNa7GGk2PKaXKP2jniE4TuV6YgLkX2urCPGm1gQ7RJGlmbl
	 7y7OlnXaPqDxiomW4mVmCMkOoMLHoQV2TgmNkRJLeaJdNZMMYVav9bYkJb84fWf8Ph
	 hexbYSCvPeGN/j1A/D7sL6jlz+ZCdRzrW8Kmi+qMG1RP0UDoA9V0daRhEUzRDR6j99
	 p3q0aWGUbw5DdUTXe1ZMcNXD57ege7mwT75eHRnOVMRkwE8r7IqSa2uHq12NLsb64A
	 Yx10W5FFcJPPPHvhDJO0h/SQvvpf6sNDPIrDk8M03V19aWd8vKoeosje51YfI9jqwG
	 SMFdJCyebunFg==
Date: Sun, 19 Jul 2026 09:37:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bling Chiang <Bling.Chiang@ite.com.tw>, 
	Eric Su <Eric.Su@ite.com.tw>, Doreen Lin <doreen.lin@ite.com.tw>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD
 controllers
Message-ID: <20260719-unbeatable-quartz-echidna-c70e69@quoll>
References: <20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw>
 <20260717-ucsi-itepd-v4-1-f3ba5addd0df@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-ucsi-itepd-v4-1-f3ba5addd0df@ite.com.tw>

On Fri, Jul 17, 2026 at 05:59:49PM +0800, Amber Kao wrote:
> +description:
> +  The ITE IT8851 is an I2C-based USB Type-C Power Delivery (PD) controller
> +  supporting one Type-C port.
> +  The IT8853 is the two-port variant sharing the same programming interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ite,it8851
> +      - ite,it8853

According to your driver code, these are fully compatible, so why aren't
the compatibility expressed with the fallback?

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
> +  "^connector@[01]$":

Keep consistent quotes, either ' or "

> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

You also need:

anyOf:
  - required:
      - connector@0
  - required:
      - connector@1

Best regards,
Krzysztof

