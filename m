Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678D3DDDDE;
	Tue, 31 Mar 2026 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945536; cv=none; b=JRZ3yVPXOmPAsSyZiSgk+BU6/aiQ504Lx+tKgt4xp1QltKDsGDbbxMhb/wKkqJ45ubM1azVhlLe9Hc5WlYaTBu2TjWPUBdPsuh+q2jnUYw0YQofLDUL2+aw1n5ihOKFHQULUEJX64acNMIrqjJA0hK/Q6+qCwrgPdr+of9AeeB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945536; c=relaxed/simple;
	bh=2gJfRtSBfXj4JRuylSNVBq9hSnCvKnDG0P+NVrtq244=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCxVgCdQpBxU+uBEaeZ5ohNfWjXNuIbnO6qfeId2ifWNqSCbo5hz1SFt5BHBnkMlVmn9BSM2j6q0ZfE1a+3xxQSWNYrdj8YpdN+tZIltONr6Q3vnDeXy+N5sDniVN3KRfKFSo2l1A3OvgOm1b2x82q0GJGHP3eN9/VoVJgbl13k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihjnBgBX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihjnBgBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0B6C19423;
	Tue, 31 Mar 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774945535;
	bh=2gJfRtSBfXj4JRuylSNVBq9hSnCvKnDG0P+NVrtq244=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihjnBgBXql7h/5fe93awTa+yWd+6DPMXqWIdZEg1MG2gGESxwaQEUjhFAhe/AWs9X
	 AhKazAWnXUDgqa0S8cFAUc6Ma1jg830IWVPKdBHzXptRIVv+aHASXG9YdMQZDD3NF6
	 +pee5dJLS35pZIM9RIBPEtOJPTg29e/Rx4wU3eHW30K1WkDNwxR7LGnILDMYvTHzcQ
	 qzNjK6z6wko8l+WnOR9QCauH+0DhhIwnZdz6OMsBR8y7tAnIFXMPy2S1Bgi/kWQDp8
	 QEcZbSFW9viMSxzL/cnHtdq+cVNJrqxFdmi9srjxf85RaDugNIxmtJKIV57eyM9dRt
	 CUIIiJm8hGQBA==
Date: Tue, 31 Mar 2026 10:25:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com, 
	p.zabel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB
 support on Versal Gen2 platform
Message-ID: <20260331-jellyfish-of-pragmatic-prowess-a230fc@quoll>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260330190304.1841593-2-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330190304.1841593-2-radhey.shyam.pandey@amd.com>

On Tue, Mar 31, 2026 at 12:33:01AM +0530, Radhey Shyam Pandey wrote:
> Versal Gen2 platform multimedia integrated (MMI) module has a USB3.2 Gen
> 2x1 Dual Role Device IP. Introduce a new compatibility string to support
> it. The USB wrapper registers reside in the MMI UDH system-level control
> registers (SLCR) block, so instead of a dedicated reg property, add
> xlnx,usb-syscon phandle with four cells specifying register offsets for
> USB2 PHY, USB3 PHY, USB DRD, and USB power configuration within the SLCR.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - Add blank line after compatible as suggested by Krzysztof.
> - Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
>   IP from Synopsys is part of the dedicated Multimedia Interface. The
>   Versal Gen2 platform also includes a separate USB 2.0 controller,
>   and the mmi suffix uniquely distinguishes between the two USB
>   controllers. MMI is an independent subsystem particularly targeted for
>   deployment in Multi-Media related applications. The MMI block include
>   following submodules: UDH: USB3.2 Gen 2x1 Dual Role Device, DisplayPort
>   Transmit Controller, Security Module (ESM) for DisplayPort and HDMI
>   Controllers, DP AUX-I2C PHY.
> - For MMI USB define parent address space i.e UDH block.
> - Fix inconsistent MHz spacing to use SI convention with spaces.
> - Move description before $ref and items in xlnx,usb-syscon property.
> - Restore original zynqmp-dwc3 example, add new versal2-mmi-dwc3 example.
> - Use 'usb' node name (without unit address) for versal2 example since
>   it has no reg property.
> - Use 1/1 address/size configuration in versal2 example, use lowercase
>   hex in syscon offsets.
> ---
>  .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 70 ++++++++++++++++++-
>  1 file changed, 67 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index d6823ef5f9a7..5e31b961aff7 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -15,6 +15,8 @@ properties:
>        - enum:
>            - xlnx,zynqmp-dwc3
>            - xlnx,versal-dwc3
> +          - xlnx,versal2-mmi-dwc3

I am not going to ask the same questions.

Best regards,
Krzysztof

