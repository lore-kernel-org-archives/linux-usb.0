Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA947887E;
	Tue, 30 Jun 2026 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836869; cv=none; b=u2hVUqdYFNssgtOl/twdtYtY70vQyAojsdQ/S+4s1jSrS4e7dCpoPzOyxPYfb9gN63eoVK3L99zDNUptLrSWq3cjCjFUSQK/A0VW6LlhIWrztAAGIE+2hCNgqpcIZSh/S2u0/8J1JtcnFkkuauWOw3vCIx/HkNe8Q4FYUvQMgw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836869; c=relaxed/simple;
	bh=zvZUtog9MMlThpwcQzFrUKwMUJPb/HNYTUTcd1ZAMHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fX6MXmmzKbH1S3llYpyLFOqCYtkZp8FH8rKbAEEZiDXZs0SevZT9MtBq6ioAHkoFCtGBdUi93hEGU21LXkA8wZvBGRgFVyran3nPce6Lb8FsZ2mdt9JQemTUcAN8MTSdL5ktd9a0g3J5R0djwpu4s6EDHY1nDb8DSCWWwKRYBJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C64OT/lU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C64OT/lU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97F81F000E9;
	Tue, 30 Jun 2026 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836866;
	bh=GVc8l7gZ3ainrM4jJc/PAqtEQnEBwNOuLRJp4wbsads=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C64OT/lUB7ULXb34Ldd0GnSgbgVmD4pjKAmYRe+RWhQz5fxllZ5y877Kp27CZfn43
	 zEdyH0IXa28fAu0Po51v9vZPsv6gOFtPvo5u5CPkGwETQf43NGSMTdR+sbKVj59o/p
	 rkk2mkgUF2iD9Ks7mF2HQ6EsMYHXVs7h/pZL3yYYIOLKdhCcHDDmz9twHunWgfGDwB
	 6p95NqeSK/NJNVTkQcYDTHpHrXKGYWz01DHdllwoFAmKGtVHU5mKO79ZHto0eh4s/N
	 4EHgrV9JPlwye6Vbt0vPQM4Ahy79KQcQBcI3WzBhI4rFCgaSH0cXyHHPgC7R762/Xh
	 wltWuuQNgRpZQ==
Date: Tue, 30 Jun 2026 11:27:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: generic-ohci: Document clock-names
 in top-level
Message-ID: <178283686560.3903568.10670831622502215679.robh@kernel.org>
References: <20260625091744.109467-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260625091744.109467-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625091744.109467-4-krzysztof.kozlowski@oss.qualcomm.com>


On Thu, 25 Jun 2026 11:17:46 +0200, Krzysztof Kozlowski wrote:
> Convention is to always have properties defined in top-level part of the
> binding and then customized (narrowed per variant) in "if:then:" blocks.
> The clock-names were mentioned only in such "if:then:" block for
> atmel,at91rm9200-ohci, thus add the top-level part and disallow usage of
> clock-names for other devices.  This has no practical impact as
> clock-names are not used by other variants, except in
> hisilicon/hi3798cv200.dtsi, but that SoC has it undocumented.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

