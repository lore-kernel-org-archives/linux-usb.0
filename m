Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252265;
	b=O2RzzQYMwvavKvepb4YnBY9oKgF5Rbs0nuSQJg19C5dxPR2rwPLDZshadoSoJ5CXngvI
	 wW9nQi7CtNxyuVZDDUXMHb1mCLkjJx6i6acctwnG5UosjVBzbeSpPN7/DZuaulhPpuamv
	 hUu1pxippfoFE8fZo/ZAfFrj1PDXk0QywwISzWKmsXocvrbSAi7/lY1seV7Z6L7sxIM5m
	 Yb9btVfcUt1Vghvc8rGb1JGnOgRaWsHztvLAd7lnZTIDqBr42jKr1PNOmudGphyce89K8
	 OpH+AjV6rCUTN/xlYmMazBLwvs55FWpsLg1zUP+RYkLC1yjwjkA6Nqi8tSWdEb0nNAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252265;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GPuPhQPXGjgK63QMd53wWjqm0zkGOhohPPcaOiUA3b4=;
	b=UTcy6WL2ZXMIgrnEGikygClDMDMoNt3C+RXp8ot5Xby/V5Uo/syOuxGbmuadHJXT2M7h
	 ODYxmxSWMIfujLzwWXCg4WU9TourIf7oWy5sfIjvLZehMTbUdmKZ6YtzzvP88VHcOJhdc
	 pXeWbkYSs+2qNTR4k9lbfi7MfNBb12JqeHrx+pJfViWwcdNlmQrxQjJPF+qJhdHE8tVus
	 N7OhGBXRPhbyXVJbUoCZgUOnabXpvh3mbgnfnyRF9OPjE8s6GMG+s5jn5JF/omb0qT52r
	 ySLFPcjfz437+BZk23rUeGhpNmpxIHwVquIdUf1BOZgKGJc+q+Z36pLu5rn6cKjousw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pa+0yiGk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B5606A32C;
	Sat, 21 Nov 2026 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pa+0yiGk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDB61F000C4;
	Sat, 21 Nov 2026 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252265;
	bh=GPuPhQPXGjgK63QMd53wWjqm0zkGOhohPPcaOiUA3b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pa+0yiGku2mi2/1RcZ70Ftb27/otW7x99MLxZQc5gSNqudcqz/jfpf7nwRE7AgQ91
	 UVEvutFahOWa7VRAmQZkDZJg8/jJyD0GY7wYtw3KBaUCz6g0dMVX8xy+LRZesaiNNn
	 Ty6WSeoaIYq/TcOBXn73L6neKTZXCLqT02Yj65dyzRK1x6+w4VSR9iA0EI9wjRLeFU
	 0800eq+FTyRPAVrwx/yvQSBc9TrZZxk+YcZ5CleRfRLtpyveqM95ur2ioo4qmC5rXp
	 /Jir66G3jlDcIdtbJyRofIymNt/a/jHtlKD2tZodW8rNbpR561Z6bDM3h2SnDJM+DZ
	 dx9mqN/lqeLqQ==
Date: Sat, 21 Nov 2026 10:11:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors on one HS data bus
Message-ID: <20261121-icy-bright-partridge-afe8de@quoll>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121022104.1507987-2-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261121022104.1507987-2-xiaqinghuan@mail.ustc.edu.cn>

On Sat, Nov 21, 2026 at 10:21:02AM +0800, Qianhui Xu wrote:
> Some designs route two USB Type-C receptacles through one High Speed D+/D-
> pair with a GPIO multiplexer, so only one connector drives the controller
> at a time.  Each connector needs to be described: which role-switch input
> belongs to it and which mux state selects it, because the role switch is
> registered per connector and the driver must know the state to program
> when that connector asks for a role.
> 
> Describe the two connectors as the two endpoints of the High Speed port,
> which is what a mux'ed data stream is in the OF graph: port@0 of "ports"
> carries endpoint@0 and endpoint@1 under "mux-controls", each with
> "usb-role-switch" and the "mux-state" that reaches it.  The mux
> controller is referenced with "mux-controls", so an existing "gpio-mux"
> controller can be used as is.
> 
> The High Speed port definition itself stays optional: a single-connector
> controller keeps describing one plain "endpoint", and requiring the two
> endpoints together with the rule that their mux states differ only
> applies when "mux-controls" is present.  The two states must be opposite,
> and the driver rejects a device tree where two connectors claim the same
> one.
> 
> *** AI-assistance disclosure ***
> This patch was prepared with the help of an LLM coding assistant.  The
> author reviewed every line and ran the gates quoted in the series notes.

This does not go to commit msg, but changelog.

You keep sending multiple revisions, this one even threaded to other
posting and still not really responding to feedbacks.

Feedback was waiting for three days and then you send the same. That's
just wasting our time.

Best regards,
Krzysztof

