Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7154781;
	Thu,  6 Aug 2026 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786029879; cv=none; b=E2jLwMi/HGi5HJOzPq2NbDamu1PHjHjNwjBIcwiQ14ZiQrtDW6VNHvvBtxzeMPW8IITkv12wkZOLMbyg+ODxcZX3R7hmdIW6YhRd1xHAsVo3VAC4XoVjIwfFdFkiTWMIKf6wcTp9odzqPNV3oMc8aif5u0XsFOvrZw+aq7KMGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786029879; c=relaxed/simple;
	bh=9UVqGL7nNz6ulPKbVjxR1/pThYHymmiQqO45IQqf9Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+AKdGfFHd10gFbqed41dh/AXCP3Q02ok1aKELe3bCHkTLXEA9O81upQ7ZcH1kI1b5eBT8s6eFrZp3edxpINYF+zPZjE7sif0WgeEWD/A5au6dy4fCpm+OQ0g8EIjUNwo9HMymqvWOrbfjageGwy4xw/82vXSPejkCBNcpXd5O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axlDqt7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axlDqt7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01711F000E9;
	Thu,  6 Aug 2026 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786029878;
	bh=mwBaib4Ja+fy5g3JLpJpGIIwyEIHsADOo9jN4IP79Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=axlDqt7xbXMiKoQR4LJJ/bVN5dGhhHu3gK98tzuSill3sKQZC9aK1SnzpWF3jrQzy
	 zVO7Q8rsg+t2EB9pU7gUk8Kp3D+5XSiP/Au4PUe5+c/w+fYfVJvHQ8by2rS1K3hlW5
	 YrrsNNcALQLuCu/Dc0DwCEuP8af/ebydrYppvt4xsZ+vtxlv96mpC7slMfu30KeBxN
	 kiCf50/YO36f/D/SEibJM/p06/QiDFcZF7Hr+Z35YLRF/sJh3QooXGHO6tFulYrarR
	 mklUmQfpm2EZBoAzQWOk0NF3fEZslvbWaOk7fu+TfklO0kU6FWcxyYzbfz6VUxxFHD
	 bROSq9+McghAg==
Date: Thu, 6 Aug 2026 17:24:18 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi
 compatible
Message-ID: <xd7gii4lmzv5xm2xylt53lnp7l5clerjxrei5cdu24mbdktzaf@do5ozmvodv3w>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
 <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
 <anReh4gzTjkD4u7c@vaman>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anReh4gzTjkD4u7c@vaman>

On Thu, Aug 06, 2026 at 03:44:31PM +0530, Vinod Koul wrote:
> On 03-08-26, 14:44, Mukesh Ojha wrote:
> > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > 
> > Document the Synopsys DWC3 USB controller found on the Hawi platform.
> 
> This one fails on phy/next :-(
> 

This one is supposed to go through USB tree. Too bad that cover letter didn't
talk about it, but it should've been sent separately in the first place...

- Mani

-- 
மணிவண்ணன் சதாசிவம்
