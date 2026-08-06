Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE1742AFAA;
	Thu,  6 Aug 2026 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786029717; cv=none; b=MYd5Vq+v8W+7+Wiyj8juVxDNcalJSeUNP7k01OEywOXAXSYcN5t7dH94h73p39bMEq8PTa2jqkybqK+oxkIVnFOa0KuzlHiavmiMNkCpd7Dpm4WkpxvQDuYpcflyqyj1sarF3eAd/QS2lMj9Z2YZkEBRxTt1lLt7/XcrfGtfDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786029717; c=relaxed/simple;
	bh=+AdEDhJAtAdXpImObTC/ae/+OnUvFAIGHSdz+JcRe2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cg5vzb1TRjA36037UVdRf8pTMbkNlXCDuwvZtrpzZHSyEA8HUHnOos3wOCQWXUZk7yl7qn+x1YR4HfErEu52LcpmAltqcO9hNXwdI2rG5l9HWYceTb952UNrvMOth81nFGuFIfgalREzN17UkxhCSB1OPkl4WkoMThE+oCxuqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCIV2ZuV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCIV2ZuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B922A1F00A3A;
	Thu,  6 Aug 2026 15:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786029716;
	bh=xFVcyt2CgfIKKlSapBlFvtJpF1zdYY/HgJY/38MltjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCIV2ZuVx9CUg1nBsZoWmwdE67iCbD+xvpEzLfv7UUdc91JPBxEEv2VG9oUKhZcYJ
	 lbT6SLUFYz3pQ1e6NTA9ZLI4TS7UkWg/VYxs6MaCEzKZrU4jE8mu9aJkvpLxrT7h7f
	 ITZPLaANhuCA0F48aDa20Wdmlrg6P3+bDHUYmeHfKKF4ahhAsQCdXxcyUKXcmV2MY9
	 iQ17rs7CgyKyyudYrJljdEtehupWzhy61QbBJo6nnl/qk5BPRcxGv1YRXaPk7iB7GP
	 9tl536gN3YS+seI3q9bLGpDana0KcwYRcCAfQXHMOa8pQGyhMgIvPzWIqOoZaP+h3L
	 nYVbQsmrv9I1w==
Date: Thu, 6 Aug 2026 17:21:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi
 compatible
Message-ID: <2pjdicfsinfnxutcujk7trghwp732e67a62dsuxi7kzdgjllb5@hq4lwlhxygpv>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
 <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
 <anReh4gzTjkD4u7c@vaman>
 <notmuch-sha1-a1b83c8fdeaa6e5292b72468415a18abf11af9bd>
 <20260806121219.oydkvnfpbfjkktsj@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806121219.oydkvnfpbfjkktsj@hu-mojha-hyd.qualcomm.com>

On Thu, Aug 06, 2026 at 05:42:19PM +0530, Mukesh Ojha wrote:
> On Thu, Aug 06, 2026 at 05:10:01PM +0530, Mukesh Ojha wrote:
> > On Thu, Aug 06, 2026 at 03:44:31PM +0530, Vinod Koul wrote:
> > > On 03-08-26, 14:44, Mukesh Ojha wrote:
> > > > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > > 
> > > > Document the Synopsys DWC3 USB controller found on the Hawi platform.
> > > 
> > > This one fails on phy/next :-(
> > >
> >
> 
> 3/4 is not applying because it is based on linux-next and some patches
> missing on phy/next.
> 

This patch has to go through USB tree, not PHY.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
