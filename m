Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4147D476;
	Thu,  6 Aug 2026 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030557; cv=none; b=tDaMA0xYDAy7ASRhveTKk2ELxBoAqTyptJvYlYhuaooKD9x32nDp36oAxeG247Z7k2e6lrV7+wi4KjpCbaK4NymDoh+HoOTXMm8b0JZwj5qhvNEYkZlGEvESiblX1javLRlXXhTs4saw6Msk62eJRR+80wmLSCzKH6tGNro4o2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030557; c=relaxed/simple;
	bh=fFxgJcWusbH/m4Oy6vnnF1m2DBfp1xfE9fOkfw5DR9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e89PEgNSxU/x+X+2kxbDwrsL800FzaCQ3UjUBoZh/TmMk0VGhbv6DO9XbtQT5RD5+mQcuTrIUrO9xLqt+RwIIZB3TrhEZ6nwELLamVtEC5KlPXN9VtsKAJ+00Bb9nF/ytXKtOzKo8pUVLq00/tStmJm2x9e0TRx27MuHNUB1s6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTvH/wTS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTvH/wTS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0BE1F000E9;
	Thu,  6 Aug 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786030556;
	bh=rTALtVCTWiqqvu2b5JHcdJ0kQIZASw+ob8p+ahO3JL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fTvH/wTS3GJdsfzZSBY8DNgaOPK8tS0wAVq6u4Ri99+UQNrVgSC0win7XrCqGcdBn
	 LfH+MjLuTxBTL0anHAud5qifSlhxn6C7S//Y9ukufU8AOxMhSO3DwQA8TLx/tndKzn
	 jsta7oksmM2CoBwh0QwB130sKtxn8ILRg7A7fwqDZk9GXHwipYqxhAUVjJwBUwUeeC
	 7wYZdRcp/OE8BRgsSS/bG2rCDntdMTtW2RxpPPqNzxlxLcIvdHIgYOQ7kHa+KFstP1
	 F0Ttg7FtNheDGfudK53BzDbJRkHU3dNbEA3KOiDYbtw8uU8nl6FOhsu29yvNZ9aC+0
	 JiA7p8DV0tVnw==
Date: Thu, 6 Aug 2026 21:05:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi
 compatible
Message-ID: <anSp2EbXtakSWvmq@vaman>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
 <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
 <anReh4gzTjkD4u7c@vaman>
 <xd7gii4lmzv5xm2xylt53lnp7l5clerjxrei5cdu24mbdktzaf@do5ozmvodv3w>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xd7gii4lmzv5xm2xylt53lnp7l5clerjxrei5cdu24mbdktzaf@do5ozmvodv3w>

On 06-08-26, 17:24, Manivannan Sadhasivam wrote:
> On Thu, Aug 06, 2026 at 03:44:31PM +0530, Vinod Koul wrote:
> > On 03-08-26, 14:44, Mukesh Ojha wrote:
> > > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > 
> > > Document the Synopsys DWC3 USB controller found on the Hawi platform.
> > 
> > This one fails on phy/next :-(
> > 
> 
> This one is supposed to go through USB tree. Too bad that cover letter didn't
> talk about it, but it should've been sent separately in the first place...

Yeah my bad as well. I should have checked.

Good news 1,2,4 applies :-)
Should be in pipes after my builder finishes... Later tonight

-- 
~Vinod
