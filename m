Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC73314BF;
	Wed, 18 Mar 2026 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817275; cv=none; b=DevfVAU8srFGNDe2UBQdhThPaIjVBA5pdUzdqrRmV6/Npjkf9GWH//LFkFk37LO2ywh2H4ri03aCZBK+Kjr9+0XIMQhydsFRCVKR1dL11JfAyzjd280Bfd6GiH0F0UVjR8NL45+jyLtoFWgir0lSq6fJfQ+IB7t7JKfJs71X2do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817275; c=relaxed/simple;
	bh=HTxLQs3QFVzm6RIWwR2ITebygYXn4sB3p88/LdMHG0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyKcS/tEVSD+hdAzfQ24SH0gNLgIjlYI9lO1rDm9FDn+aPOcg6/gzokEydzIXMcQ5Pol+eGfQE18dUDxFdoUoKM+qsb0ltAw2ZidN9zZd4scDFrTw/p8a3HUuMutQBqf6ZWxQyBKrV0vvPZ3hNS79vw30CZps59XjGaEdqUpt5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7CbR3HA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7CbR3HA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25592C19421;
	Wed, 18 Mar 2026 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773817274;
	bh=HTxLQs3QFVzm6RIWwR2ITebygYXn4sB3p88/LdMHG0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7CbR3HAGCKAcUdpb3A8Wb+DLoq5OHDFaD4WRJ9gW8G1jHCUnapFRA4TaC/jgbD0V
	 1OAOdaKDW8rcEZHt5pyZ8ZjwoveNuvUGLafX+YkS2iKTYpxRwBHXNnSadGQBjoSv0Y
	 h6fVVuya69Nnlq0oXEMJfcjV1R/KODL+B/gtkzY7DJCJEFrpaouBRkneUQjWyn/mEC
	 wogaLeMBRJzYmNe9uoGJhjvNmRFHBs85ZBo9uIg/+bP4Ev5bEy9ru0a2SVJhloBvBY
	 gzW7M12MLlrLgprMrkppd74sWxhF5mf4DRf1fboa4i5cb4d/lVu+MsdNT5mYcM080q
	 aNSgSQ8pqPVew==
Date: Wed, 18 Mar 2026 08:01:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Matthias Kaehlcke <mka@chromium.org>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Pin-yen Lin <treapking@chromium.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
Message-ID: <20260318-devious-spider-of-endurance-ede46f@quoll>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com>

On Wed, Mar 18, 2026 at 09:36:41AM +0530, Swati Agarwal wrote:

A nit, subject: drop second/last, redundant "binding fir". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

>    reg: true
> @@ -26,6 +27,10 @@ properties:
>      description:
>        The regulator that provides 3.3V or 5.0V core power to the hub.
>  
> +  vdd12-supply:
> +    description:
> +      The regulator that provides 1.2V power to the hub.
> +
>    peer-hub: true
>  
>    ports:
> @@ -69,6 +74,17 @@ allOf:
>          peer-hub: true
>          vdd-supply: true

Here and in other cases you forgot to forbid new property (: false).

Best regards,
Krzysztof

