Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC743BDD2;
	Thu,  6 Aug 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011277; cv=none; b=KoYS5O46ofsqGHxRIuoF/F4I3WSbMYx20zKHb3vSVfv2y6IwmgeC78PefM04GfbGxjKodZLsHzwUob/okXz1fN29p8SWuviwIVpWRcvPkgeZbT+7pSjYAwl97pRvbpLEOIpzIMVfHggqgSWZc9WLmUnackL0Q8a/QQInEVZXcrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011277; c=relaxed/simple;
	bh=K+b2xHhFCeOlIIp4y5IU+Rw53CJtmm1+HMwdgAzFQ0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FT6mqEBecZWHRkc2XCibeaGhNEb8U7MOcUiMF0UAQ2kpKNEGPA4VFFIolmSLfczZxr1S1aeQoHnbwzdEIkIRNzSIezDwgdt4VUS12mVCLjsnBQB+cBzN/qGmjDr1cLd6hY9YqMwm5mWwouR9zD8LZzILRpVTkzFBKbeOdjfYHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khBNYcVY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khBNYcVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7914F1F000E9;
	Thu,  6 Aug 2026 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786011275;
	bh=61XgkMM07gBRPH/k9a3fWkX3L6dqNGB3mydbDQoPPwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=khBNYcVYFFAvHmUi1pMMmsz5k/31nzGhSQUv5gKP0AKWpKPJSa+wBeHLfjcbccA2L
	 ld2p2Qu3GyDKukusEUgt5DA88Zb6EmUreI5Fz09YiNTh/PLdKz2MqbXsQSmkNWrGXh
	 7kh3iPIAvgGb7ap+yTRHqHHW2avnJVNqa7SQgxcIDnQdbApjJfhKKBrED1dmlNXPdA
	 ycaSdqOF6hJjiCp/nkQDDCUCPfnOPqw/Nu6pnly5568YTlqn/5r2k/jEo4/2DE0QSn
	 beV5VRWWmqtYl49AsB/JC7Fhiqm98gxtoaLGDNmOewqLBPjwE9UREHHP3zltB2G0ts
	 W+S4oI2+YD4Bg==
Date: Thu, 6 Aug 2026 15:44:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <anReh4gzTjkD4u7c@vaman>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
 <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>

On 03-08-26, 14:44, Mukesh Ojha wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Document the Synopsys DWC3 USB controller found on the Hawi platform.

This one fails on phy/next :-(

-- 
~Vinod
