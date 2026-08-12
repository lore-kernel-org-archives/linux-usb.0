Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9F725DB0D;
	Wed, 12 Aug 2026 22:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786575067; cv=none; b=DTo/rlWSvcqEeO+0k/K5pQniYHYIGzhO0AIRPS7Dlwm3M1sFuBzmTP9x1e7u+a6S7ikkliN75r5vsN1PnIac2Yovnd95wrCxPTe3faOhdrBr+FapHT6LvG0XrAru9S3Cshb59+qSnNvLgF/ZadgxtLdjE3bE8jraoCcWTM56TiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786575067; c=relaxed/simple;
	bh=XkdV+RuGebEDrCF6DhzBka3ijYujuoX2/b9kM1oW0u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDGfNtQO9ZxpmkjWJW0wkiTuCa4e/jBNvsn4LJQgG70sz9WLgVh60K7Pn/kJ0LdP3Kchnat2Z2xX/VBYV8uFIGORd7oZ+rAtf1k+XneC+cUx0unACpEOlFj4RnzmDH6xvFPw1J5Hj+knb3ePZ6sSkZ7m7/jBCGbIeF7dhsdIKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbmnXaWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbmnXaWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA8B1F000E9;
	Wed, 12 Aug 2026 22:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786575065;
	bh=q94daslctU9u8EUSFugtHPk2cVBdSnc1E2aM20T8veU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GbmnXaWeCQaaqrT8Hp/zNHy8kss73W/neIJN1E9VGPX08O8vxf+frHXmvQsJO11Pj
	 KEDci1oe6firfMN35BT3WQzabTnykjeteGsUCxySrWPYwgqKNjdYQwukD9pSBLnLhw
	 eWM7OMMdS/widY/WecnKrnZ8Ermx8XAFjf6F2TXOy5e0T+cJSvb9WXeZl+lxyTVZtr
	 FWqZWVM6xnchqFpC0bZpcGPKSGAKM9kzKPWLAt8D1+jfiwdepwXXLReZ0pwGOYuP1p
	 DxV9WyH04g/bVqIj4TQE49i+1L1XYiihUebgNV0Ge7ocKfF2qzyWEdYE0KjQOh6n29
	 pFU+uCfjZ4uAw==
Date: Wed, 12 Aug 2026 17:51:05 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
	Pankaj Dev <pankaj.dev@st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
Message-ID: <20260812225105.GB693080-robh@kernel.org>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
 <20260812-silky-omniscient-dalmatian-b268cb@quoll>
 <ff691741-a110-44e8-90e7-ac54a96de1af@nabladev.com>
 <ff957fbb-b8ed-485d-adaa-18258ed693a6@kernel.org>
 <ea21d4fb-04a1-4280-9a73-6f566be2b015@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea21d4fb-04a1-4280-9a73-6f566be2b015@nabladev.com>

On Wed, Aug 12, 2026 at 08:30:33PM +0200, Marek Vasut wrote:
> On 8/12/26 1:22 PM, Krzysztof Kozlowski wrote:
> > On 12/08/2026 12:56, Marek Vasut wrote:
> > > On 8/12/26 12:15 PM, Krzysztof Kozlowski wrote:
> > > > On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
> > > > > From: Pankaj Dev <pankaj.dev@st.com>
> > > > > 
> > > > > Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> > > > > USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> > > > > Two such PHYs in total are present in STM32MP25 SoC, they both are
> > > > > slightly different, therefore they use different compatible string
> > > > 
> > > > What is slightly different? This should be either here, or better, in
> > > > "description" part.
> > > 
> > > They are both Synopsys FEMTO-PHY , but they are each attached to a
> > > different controller (one to USB 2.0 host , the other to DWC3 DRD) , and
> > > their control bits in the system controller register are different for
> > > each variant.
> > > 
> > > I extended the description in V2.
> > 
> > Depending on the actual difference, this rather belongs to the phandle
> > to syscon, instead of separate compatible.
> 
> Modeling that in the phandle to syscon won't scale, the PHY driver is simple
> thus far and does not control all the bits in that syscon, if we were to
> somehow extend the phandle to syscon to describe the various bit mappings
> and differences in it, it would look awful quickly. Hence the separate
> compatible strings, so the driver can match on them, derive match data from
> them and use the match data to figure out differences of each instance.

There's no 'reg' so the syscon is the only control interface, right? So 
this should be child node of the syscon (with a reg property).

Rob
