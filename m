Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23143E5597;
	Wed, 13 May 2026 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778664971; cv=none; b=OifD36o1Xs/gjOup+g3kgfLZkSVEj5szXVD8C8HJ/vXo45gFe9cFV5VpIU3bwn5iS8PScYtXCkQqf2fttPevC++b46mZKJ6fhU/w5qGFmUR8DhYbcRRevSe6QDMXO9lUKG+Wi5FpAdKoLBBU85oAy7i1Dc5rLacS+I1QoFtlcA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778664971; c=relaxed/simple;
	bh=R6htYCFiU3TCkVRmDtL15EtVi3itaBuVdzl8GZDE/es=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=vEkepjejXZD9fuHilBImpqJwhYpL1FRlzaLgK8BnDkBaF9j1UZV9Sf1mGzVlwJRZcXww1kExBGgY0EFdk+ehvJtA1y2nAVmlc3m3zS8GLvJkBVXNIX88VBu3b/9qTanbExNh3WFGLFDC8HGu/HEFtQz+Hqs9cmL2cU8ZwGLPlss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMr7RnQr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMr7RnQr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FE5C4AF0C;
	Wed, 13 May 2026 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778664970;
	bh=R6htYCFiU3TCkVRmDtL15EtVi3itaBuVdzl8GZDE/es=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KMr7RnQrkou3Tfhosaj0bFI4ityEPFdizhLuJCeRDM2RJ4dUjy5W2omdYIl1vot9K
	 5Y6sRV+JcxdezxXL/umf+QQeyIhH4nperhDRRLOqkvE4TleFE21ZPiwVHKn0wTuIMT
	 0bZPPomJKDFXPLdbDQzYybCwclkRJyQaHnh9E2fvNfhGy8zXpmGupoBHo/RiZjtlpd
	 4MtyGGezHXLgEJ79hx1cI2Jl84ssCAq6emUjhWCwPIrSx1IrP50qn38KUsF/jIwcO1
	 rjlW/6YNcDZKLYkR2ZPVwM4WLSoKraJiP5cWjjeDypgX+aGSE7OSnLWoNut6DBFuyB
	 MrkvhzPCAKJBA==
Date: Wed, 13 May 2026 04:36:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Roger Quadros <rogerq@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>, 
 linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Pawel Laszczak <pawell@cadence.com>
In-Reply-To: <20260513-b4-no_drd_config-v5-1-1c633a4b9a29@cadence.com>
References: <20260513-b4-no_drd_config-v5-0-1c633a4b9a29@cadence.com>
 <20260513-b4-no_drd_config-v5-1-1c633a4b9a29@cadence.com>
Message-Id: <177866496780.143152.1880701975733654167.robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: cdns3: Add no_drd property


On Wed, 13 May 2026 10:41:21 +0200, Pawel Laszczak wrote:
> Introduce a new boolean property 'no_drd' for Cadence USBSS/USBSSP
> controllers to support hardware configurations where the Dual-Role
> Device (DRD) register block is missing or inaccessible.
> 
> When 'no_drd' is present:
> - The 'otg' register and interrupt resources are not required.
> - The 'reg' and 'interrupts' properties are restricted to 2 items
>   (host and device).
> - 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.
> 
> When 'no_drd' is absent, the binding maintains backward compatibility
> by requiring all 3 resource sets (otg, host, dev).
> 
> To achieve this, the schema is updated with an if-then-else logic
> and 'reg-names'/'interrupt-names' use enums to allow flexible
> ordering during validation.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
> v5:
> - Implemented strict conditional validation using if-then-else logic.
> - Enforced 2 register/interrupt items and required 'dr_mode'
>   (host or peripheral) when 'no_drd' is present.
> - Enforced the standard 3 register/interrupt items (otg, host, dev)
>   when 'no_drd' is absent to ensure backward compatibility.
> - Updated 'reg-names' and 'interrupt-names' to use enums in the main
>   properties section to support flexible resource ordering during
>   validation.
> ---
> ---
>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 67 +++++++++++++++++++---
>  1 file changed, 58 insertions(+), 9 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/fsl,imx8qm-cdns3.example.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000:interrupt-names: ['host', 'peripheral', 'otg', 'wakeup'] is too long
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/fsl,imx8qm-cdns3.example.dtb: usb@5b120000 (cdns,usb3): interrupt-names: ['host', 'peripheral', 'otg', 'wakeup'] is too long
	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260513-b4-no_drd_config-v5-1-1c633a4b9a29@cadence.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

