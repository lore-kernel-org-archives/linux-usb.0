Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4B3A6F04;
	Fri,  7 Aug 2026 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087239; cv=none; b=eGVZFWWsirWpdeLI8xEcO+6OLZ5w6ohtx23yDQJbT7sXNbbez7oEKYLWvN9cqHose9ykyjTFIaHMwPqBNEUPEP/uJJS3n4jUiOidAtmOfkP0GEg4VvuUS6A/PoeG1mLPLbtHbW9SnbPkG0o2rijJJ8X8CDuyz+eaZ7E6zp/PBLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087239; c=relaxed/simple;
	bh=7LzqW0Zdm+uxjIK0Xv4xihdWZ4UvDFk82BIQ04mv9f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU8lpfNDdHG9UJ3CyXnjI8W9AzHpFVWeNk8EV9nj8iNZEf2tPlsZR7E0Jex9PY7YRtg/h/me6araxgTgpOxq2u8MagjKoQFhuTVsfAk6knelWfmB8yAtjvamshIXLXUbjpK5wRgzNxQ0Mm4Rl4dhwaAnckVzcPbA1nXUPYLIh0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nT09GmFC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nT09GmFC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B5C1F000E9;
	Fri,  7 Aug 2026 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786087231;
	bh=Czsvv0sP4K4ItG6z24Y8gZ6kH6ypFuMj0KIE+853VKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nT09GmFCPRib5VMwoSY0M1OjqKO8x8yPmnvEOoKADQkOVP5taIcFz+5UTk0Tl/dkZ
	 iED3gOvqYS5eWxVhiUuR7esnbVppAuvS/z0vJHPuJjsy1DNzN0zt6ETrdPhtvlnZHk
	 GBVPimoQecJiJCaYmv/9vsNykvYGh0++KKXEFYkw5u0HZIvT9Qgcr1g9vBJS0bcqx7
	 HZFs4dWKi+z5xcngzxk8VXz/JIMyngq4CD1ot48GeN+01GY5TOzwrGm4eRj4Yctc4Z
	 djDUfJO7LGp0xfTL34DrSGwiAGiXli5LWuz+LIitTBP/Oyjvtp7MuyCh5Pak/hatZf
	 1nbukMl1o3aoA==
Date: Fri, 7 Aug 2026 09:20:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <20260807-shrewd-white-mayfly-a8bfea@quoll>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>

On Sun, Aug 02, 2026 at 08:15:26PM -0700, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
> EUD on the primary UTMI path only, while SM8350 supports EUD on both
> primary and secondary UTMI paths.
> 
> Each UTMI path connects an independent USB controller/connector pair and
> forms its own role-switch domain. EUD routes traffic based on USB role.
> In device role the debug hub is inserted, while in host role it is
> bypassed.
> 
> The existing binding models EUD using a flattened ports representation.
> While sufficient for fixed device-role configurations, it cannot naturally
> associate a controller, connector, and role switch with a specific
> EUD-routable path. This is problematic for role-switch capable ports and
> becomes more pronounced on SoCs with multiple paths. In such cases, each
> path forms an independent role-switch domain and requires per-path role
> awareness.
> 
> Model each UTMI path as a separate child node with its own OF graph. Add
> an SM8350 compatible for dual-path EUD topologies while retaining the
> legacy ports representation for backward compatibility.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,eud.yaml           | 128 +++++++++++++++++-
>  1 file changed, 127 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

