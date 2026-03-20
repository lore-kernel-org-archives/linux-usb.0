Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74135346FBC;
	Fri, 20 Mar 2026 06:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989572; cv=none; b=b7DC4FZAVBXir7NwObkez7muI2c9wbeSagI9ZmLCvxitvprQ/VQG9R5Phr5+7wBtmr76P9xyalZFrR2sqXidyd8UBlUdNup59KlHzXjyQQYnWcSvPbq5NwVwzAh3L8u9U0Gsou19gDDjVkiYZ3e6SNIZpU3ei1GxUzzO1Inm40A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989572; c=relaxed/simple;
	bh=p2htuBs8PAxsr+M8npHG3JZLi5D55VFMsnVeGu+RJq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpnpb4XcZUzgeAcvKsV6mGdsgbd0PJrViagIgR5yiSDdESxFwuJAu0FBg+NNglYrgi84Pm1/jp8RS83UFQRHUHmt403BImAlvXDRbiLhc+D0JjV2RKkjoClYXktMadzTZVOXl22t/SEfWA5PVVhPf056Cb+rfodNp5o2o8wqdEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcJNjocC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcJNjocC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE85AC4CEF7;
	Fri, 20 Mar 2026 06:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773989572;
	bh=p2htuBs8PAxsr+M8npHG3JZLi5D55VFMsnVeGu+RJq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcJNjocCOgudrAifopOv7t62HqLUQ9dLHF/dgHRennPWiPj2K/HofOcKTpvXaYVCq
	 HmqQz972ZkM3n9tE+oaVynqHwgebi0OrPEa9xl1x0zUmW9ttPx5medYBbmaUzbeVs+
	 i47Mf8ygjJqwUs4yEPdO7aUzJ/+RKCzr+8bQucuZuXUxtOL53AjPqIUEa1KgOXacor
	 iqgnp1c3YVON1R5z9F0x3Zxkli8QyfGjgptBZrsbRfeiV6R1RvRlgga7GE0h4Btxmz
	 wZf+GKcXnOzN8kPnNhBsU2N6azLyZMhOLzXYz4G2VrqhgdINexNOsP3QWhQLji/BzN
	 J2jl0N5JAoaPA==
Date: Fri, 20 Mar 2026 14:52:49 +0800
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Message-ID: <20260320065249-GKA523803@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
 <20260317214435-GKA453922@kernel.org>
 <20260318-crock-tinderbox-ae12024627d9@spud>
 <20260319024124-GKB489299@kernel.org>
 <20260319-garbage-scrunch-37dc1b72d56c@spud>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-garbage-scrunch-37dc1b72d56c@spud>

Hi Conor,

On 14:36 Thu 19 Mar     , Conor Dooley wrote:
> On Thu, Mar 19, 2026 at 10:41:24AM +0800, Yixun Lan wrote:
> > Hi Conor,
> > 
> > On 17:21 Wed 18 Mar     , Conor Dooley wrote:
> > > On Wed, Mar 18, 2026 at 05:44:35AM +0800, Yixun Lan wrote:
> > > > Hi Conor,
> > > > 
> > > > On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> > > > > On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > > > > > Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
> > > > > > The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> > > > > > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > > > > > 
> > > > > > Explicitly reduce number of phy property to minimal one.
> > > > > 
> > > > > Is this valid for the existing compatible, will it work with only one
> > > > > clock?
> > > > > 
> > > > I didn't change clock binding, do you mean phy?
> > > > 
> > > > Both k1 and k3 work with one clock (no change here)
> > > > 
> > > > for phy, the existing k1 requires two. for k3, one controller requires
> > > > one phy due to only has USB2.0 support, other controllers requires two
> > > > phys - USB2, USB3 PHY
> > > 
> > > Yep, phy is what I meant. Sorry bout that. Since you're relaxing the
> > > constraints for the k1, can you please add a conditional section to the
> > > binding to enforce 2 phys min for k1?
> > > 
> > 
> > To be explicit, the change should be applied to both K1 and K3, even in K1
> > use case, it's perfectly fine for designer to choose enabling USB2.0
> > only, and leave the comb phy to pcie contoller, so only one phy required
> 
> In that case, can you be more clear in the commit message about why this
> is also being done for the k1 please?

sure, I will do it in v2

-- 
Yixun Lan (dlan)
