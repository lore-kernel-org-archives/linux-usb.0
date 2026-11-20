Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186253;
	b=i8WimvEMZYJ74Sd1rT4Z9qXSUPjNzGOUmXu9PDdDatGxPkqVEz6jg5bC8A5nIN3pb7Om
	 HqzntzHUq8zNoTT7dB2KgONaVkEUFMHx60078mZdus8fnZfGGCnzaXkl6UO1S1rEdLa4D
	 mbL4pOdpl/1Yzh8/uGWPPJs24n9sq0peFhLhInRC6ZzsTQ7D2QITbsiiFRltxQQecrzIM
	 yZp3HqVzjJMCy2hGmW8oV2WEuKE+4+B+aSRYPIh96bDVvvO/qB2kBtM1LVE+1Q7VoCAId
	 gSjuNPDaU9aCBTJaO/ezjbw2H/qCx+pxEmrpoxrCeHexgP1UmG+aT96Mai9xd0f1J2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186253;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2Erw3U4RA06uyoNmwIbpaGrgtzBIwetudzBPn9ezBig=;
	b=GZS7erublGZBr4b+gqxUP8T6TFnj+pQcS07lNF/UPFwMGeWi//+ZI6+5+4EZ0+kcuee/
	 FM2W0R7wkYli8ayArPVpsVEQeV45pEpr4ATKZYJ+9DY6z/dgQxuW2I/39LOX714ZS2ELN
	 VVTYwVGnT4oEKUrryC2f5KZglgiZxxdvj39gxqY+pFL5NfBYx3+gNLgAtulN/vI4tcQOI
	 oRWfFd9lit9BueIW159Lwv9YHTS7DKSF5XfNqW7Nvmo9yxMyNxlIyI4q3R3hEwgNmVMbn
	 +uZwY5C3gIlP8p/RqW0QIXpJMwzgyOAyi5DVEzH7WgRzekPiahg7At+ZqI9gmRvAeeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RcAGCBuN;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1266606A331;
	Fri, 20 Nov 2026 14:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1266606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RcAGCBuN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795186253; x=1826722253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JQvaCfeOk1s1RVNnhLHnBJlsZ1ic/pUXKyIFsagdv1M=;
  b=RcAGCBuNFH9qq57lzpB5ulLYkqg4ZGLrJXglOZ1G2t4XAgUPIL1qpIIZ
   FUbfd/CL4J8m2LYy7kmz0hD5p9luq6Hxn498T/28WQmZu3Id9d6RSQozR
   5PBm0RsAJuGEZszJSGhIskf0z625CVkM+X6kMNVD/EhDAxnSZ5S1JE6wN
   x1AfCAxQ76Vt7mPcD13RLBV/Tvoi4FZUmieFg9XP/f6N3Hq3a9kHXtOWF
   7wvF8JJoG3UViQdrJmPN09i7gPbs1SA9MHBcygAeipUuSr1CeljreiP8s
   EQWCVLo4CzZjcEAE1Ns1jD/65n9Q/j6i49CjcUakA2OzgLbkXV/ffZi8Z
   g==;
X-CSE-ConnectionGUID: f+dOXEoQSG+TjAjLxdc4Eg==
X-CSE-MsgGUID: HtvVwrfuQASlPwjt5Z3lpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3953295"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3953295"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:50:51 -0800
X-CSE-ConnectionGUID: qmqjffb9RnCljrrPQJNwPw==
X-CSE-MsgGUID: b2RA5lEFQEe7W1g9sxlwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11134673"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 20 Nov 2026 06:50:48 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E6B7699; Fri, 20 Nov 2026 15:50:46 +0100 (CET)
Date: Fri, 20 Nov 2026 15:50:46 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
Message-ID: <awBeRhkkKwWGYxm1@black.igk.intel.com>
References: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
 <20261117-ucsi-ccg-cc-orientation-v2-1-2e3576a11eb7@qti.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v2-1-2e3576a11eb7@qti.qualcomm.com>

On Tue, Nov 17, 2026 at 07:39:47PM +0530, Akash Kumar wrote:
> Add the optional orientation-gpios property, used to sense the CC
> orientation of each Type-C connector on boards where the CCGx chip
> has no HPI register exposing CC polarity. Entries are ordered by
> connector number; an entry may be left as <0> for connectors with no
> sense line.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

This one did not apply on top of Greg's latest usb-next. I tried also
linux-next.

Thanks,

> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index d923ef82ecfa..5716c045d87e 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -59,6 +59,14 @@ properties:
>      description: enable IRQ remote wakeup, see power/wakeup-source.txt
>      type: boolean
>  
> +  orientation-gpios:
> +    description:
> +      GPIOs used to sense the CC orientation of each Type-C connector.
> +      Entries are ordered by connector number, i.e. the first entry
> +      corresponds to connector@0 and the second to connector@1.
> +    minItems: 1
> +    maxItems: 2
> +
>  patternProperties:
>    '^connector@[01]$':
>      $ref: /schemas/connector/usb-connector.yaml#
> @@ -129,6 +137,7 @@ examples:
>        };
>      };
>    - |
> +    #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
>      i2c {
>          #address-cells = <1>;
> @@ -141,6 +150,7 @@ examples:
>              pinctrl-0 = <&usb0_intr_state>;
>              pinctrl-names = "default";
>              wakeup-source;
> +            orientation-gpios = <0>, <&tlmm XX GPIO_ACTIVE_HIGH>;
>  
>              #address-cells = <1>;
>              #size-cells = <0>;
> 
> -- 
> 2.43.0

-- 
heikki
