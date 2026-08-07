Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FB8468C0D;
	Fri,  7 Aug 2026 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110769; cv=none; b=GsmiktI2HgB2w3rMCSz/0ZbbKuJPy0B0kFlO4dzT3bGuXMJOPkAeHqEwjYtkjcJhEY6I/bLQxh1QX3MDy29J+eOWf8Io0lOy1bOkTUsC+yOY1Nj55PnKbAcq19Y6f2eyCqBBfkC9QSeYwViPflDgtECzoDkaq9dzfsNsB1yFIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110769; c=relaxed/simple;
	bh=H+Nyc4/vgdWy94CaLo6H0u8OAMw71TbP8kluCcqjd44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIhl3LEjuEWyErgsiKTYyjqqe14Wd8He1v+eLMZ1j+2ApTMAkruFIw/ud3DwzNw/Tz1dgNY4dxXg+Zl1ViHBkzQnFJ9s4WHi1bCMOdBOIPduhOVbc4W1XrcLYVtpE+nDXJXEZJA7AUD2mhFILZT+3BSF25qpsEVwnNboeCr4JGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2c6pEWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2c6pEWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F44D1F000E9;
	Fri,  7 Aug 2026 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110760;
	bh=z6EKGMncM2Wze0PaGWUbY8vyrNDHhiTO8yRZPcZARKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h2c6pEWNuEGV41Pf1BUoazp3KY3E2+foQv0Z9a7SeX0Gz8P4coboyNbG58kghcFQB
	 60voaminXFK/9AgH52/lMhG+ypZk1nfzVoklFvO2vfOkOX44rcAqaAmF0/kjKOo0h4
	 AtZmrmZ4iEJKHftF4XnxIAymGMO4iQC0fKmJABli6gOp0w93HMYf+FQ0bEPa4oIIXA
	 xcZ4t5wM921WSYC93cNcux1xjv7dbNDtMKl3IGdFgs9QfCSqw0UYxnMdnmMwmQ6t9c
	 VuPFdj43k0mRSQLPpuMccazT5Eh5ncF2qkQv0/EoxRZGYNx3Gpf6zLzc0uFe5mUniM
	 6+Oj+/WUDBeHg==
Date: Fri, 7 Aug 2026 08:52:39 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Elson Serrao <elson.serrao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <20260807135239.GA48030-robh@kernel.org>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
 <20260807-shrewd-white-mayfly-a8bfea@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-shrewd-white-mayfly-a8bfea@quoll>

On Fri, Aug 07, 2026 at 09:20:26AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 02, 2026 at 08:15:26PM -0700, Elson Serrao wrote:
> > The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> > High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
> > EUD on the primary UTMI path only, while SM8350 supports EUD on both
> > primary and secondary UTMI paths.
> > 
> > Each UTMI path connects an independent USB controller/connector pair and
> > forms its own role-switch domain. EUD routes traffic based on USB role.
> > In device role the debug hub is inserted, while in host role it is
> > bypassed.
> > 
> > The existing binding models EUD using a flattened ports representation.
> > While sufficient for fixed device-role configurations, it cannot naturally
> > associate a controller, connector, and role switch with a specific
> > EUD-routable path. This is problematic for role-switch capable ports and
> > becomes more pronounced on SoCs with multiple paths. In such cases, each
> > path forms an independent role-switch domain and requires per-path role
> > awareness.
> > 
> > Model each UTMI path as a separate child node with its own OF graph. Add
> > an SM8350 compatible for dual-path EUD topologies while retaining the
> > legacy ports representation for backward compatibility.
> > 
> > Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> > ---
> >  .../bindings/soc/qcom/qcom,eud.yaml           | 128 +++++++++++++++++-
> >  1 file changed, 127 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

sashiko correctly points out the oneOf logic is flawed.

