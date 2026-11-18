Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015661;
	b=IPuLXounrDDgA9mb5ZQYXMU67ni/aDN+U3hY9qJrMXcMu8sn78l+VNt2Zlh7eAXDPLj4
	 8AgJDoeaTSWRmXsfGsLnkeDLrrtfRnX5yqixLjuDkJ/BRPSwWlTILLkZduNIqILcau4Bt
	 2LkcYz7fiWZxPAWIbmqmW02M02Qyz1eborWLlg48bC1Jms14Zj5/UI7O/d5JoAVrFvk5G
	 pfjMe0gOMbjFcPMgXQzKSfKdGKqw4HF3ySXR8X3V53xC0UnMyU0GFSVW2GqhE/fYWIK+j
	 n9NC+hXDxo93Gwy9LbcjRLBNdypjrbBR5z2Rgfrb4+5QvSTGKXPfogEsof9xDEEc99Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015661;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=R5HIU47KcQJqEvAKU3L+yO6oZL2xODPwE5MNIcttP24=;
	b=dZUFsYgHb8Uy0qP+bk/zRKWcJuI2Vtr95vqyiLgTLS9pvk5oQfZ8iz2okTFz74Kbsz73
	 2kJz+AN62mG+dZzPsNvHOd1ebzqRoGxuW2dfxAcG1+JgJeC2IIfLIM5Kw7TrLBFAgt/DV
	 MAmghgdjQVJUNA63bVNURBxOWj3ykV7jp3T+CJ320hwfOWszKs1BJvTmmRU30seyZQNG0
	 qVXEqGj6NB+XSOuOSEGt/7XgjOoZpW1jSOFQaUF2/y49XfCzauUIJxy9btr1BL85yHslb
	 R5aOQTf5WIfXhVlfIwFwLxRaNmXM53owdsVFilxCTvqM6duovGcH8zAXs5TwhEOYAKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oott4I+g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C935606A33F;
	Wed, 18 Nov 2026 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oott4I+g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AACF1F000C4;
	Wed, 18 Nov 2026 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015661;
	bh=R5HIU47KcQJqEvAKU3L+yO6oZL2xODPwE5MNIcttP24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oott4I+gwvFAaK0Z4o0wIwqjdHYmXg2Z+mE0gOG7uV2XwkJFioK+iuN2OLN60/p5i
	 A7zLCyTmE3BexAbHBMiRKQVDwnXxgM4Kkb6e1GUUUDIWxrToF/u0eOzl6Mw7f65ECU
	 ST1ixjOmgeFvzWCaEaqD1f4UcqJIbgkiPq9vYYl/O4m0l0AuWiPI5yRuHqadh6AIKh
	 EO5qtoRpJHeGJaZjduOBLNDgUc8bA1wxIcy4IU9KQ7lEe6M//60xExcJtLTCIBAF7z
	 TehYWUiprSFGnpAXntSJUVUubcTXlL8M7aITnhDY3kgsGWk9j4oCaDsUJQO4FWk8nC
	 yz3HEB0o/ooZg==
Date: Wed, 18 Nov 2026 09:27:39 -0600
From: Rob Herring <robh@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/3] usb: dwc3: select the shared HS data bus with a
 mux controller
Message-ID: <20261118152739.GA1824160-robh@kernel.org>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261117052137.32833-4-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261117052137.32833-4-xiaqinghuan@mail.ustc.edu.cn>

On Tue, Nov 17, 2026 at 01:21:37PM +0800, Qianhui Xu wrote:
> Respond to Rob's review of v8: drop the private "port-select-gpios"
> property and drive the shared High Speed data path through a mux
> controller instead ("Use the gpio mux binding").

What changed in this version isn't really applicable for the commit 
message. We don't need to record something about "port-select-gpios" 
forever in the commit log.

The commit msg should answer "why" we need/want this change.

> 
> The connector to drive is still published per endpoint via "mux-state";
> dwc3_role_mux_init() now requires the "mux-controls" property and gets
> the controller with devm_mux_control_get().  A mux controller cannot be
> read back, so the boot-time connector can no longer be detected: the
> initial mode request claims the mux for state 0 instead, which is the
> first mode request that reaches __dwc3_set_mode() after probe.
> 
> mux_control_select() sleeps while waiting for the controller, and
> mux_control_deselect() may sleep as well.  Both are only ever called
> from __dwc3_set_mode(), which runs as a work item on
> system_freezable_wq; the role-switch set() callback keeps recording the
> request and never touches the mux directly.  The mux is kept selected
> between switches, since the controller always drives exactly one of the
> two connectors.
> 
> This rework does not change the arbitration, the publication ordering
> or the teardown rules introduced in v7/v8.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---

What has changed in each version is useful for review and that goes here 
after the '---'.

Rob
