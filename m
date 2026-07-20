Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B42432938D;
	Mon, 20 Jul 2026 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546336; cv=none; b=WS3vqgX5fGUA6Cc1YXFpx/lIzSSOx+zwFgTIDmjalRjf7BjKE74eZF7sXig5mh+MnS3eGE5ewd2p7ZqpYipOH2ognxzCAIkCKauqbpeheIMUw5QnliFkeRebtedEAFdWZkIsrw6/JULvDk25+VhwQ3Ce799byJ6v3Jk2UiQeMjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546336; c=relaxed/simple;
	bh=omgW2WCvrvNpEtlBb7FPgRtXWMLH0K/ZqZUoNyBOrVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnu+biJNVIS1D7Te2bPRLnva4m2reVor1mfsNaAzrvxH5xhHeTh0EZ+QhH7gvrYckOFOVSJ0B8A8f5KjUslG8q+UJaMw9pZyqvpAglpQ/TjzvTKo/Jp0dtbX4BuNgSTdCwOUobvprvqSx7pFgQrsZCQwtNgdkftNdV3/xUeCukY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MA/rrSUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MA/rrSUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7AB1F00A3A;
	Mon, 20 Jul 2026 11:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784546335;
	bh=90brq7N9vx8ptaQkJpj+PtsxJmmOQz7QVrLbmyRHcuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MA/rrSUAWwAcrQ34lRzEZITPZ3Fj34E37mtOEtKsHcL6tq7m/GWhp4KhVVAaDv/zz
	 xk8+Oj/r8wiUms/3smMZCE+e+Dx462s42IA5q05D6GKGtfLwmhuCJl9bATItSEeIXC
	 git3ErfsEvQXeQFSTol8m8nrNdSQvlfIbOGzxhRldM4cgvMHK5bvRjn9Knrsena38W
	 gRzM70TckBngDn/pMP6MGn5twxnZF3T7KTOe4tktrPce3AejwOEWELNIBZgCzOhHgp
	 WkLYEspzL7duqmZmq0UUhNg1vDn+l71CDxZDNMcXkEcj3bC+fVCzK/orJz/J3q4f0j
	 FZdSRaZZ8bAoQ==
Date: Mon, 20 Jul 2026 16:48:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Ronak Raheja <ronak.raheja@oss.qualcomm.com>, krzk+dt@kernel.org,
	conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Message-ID: <al4EG1FMrI0z1D7z@vaman>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
 <chf57j2dkhhjzigpguldadfld5utepa4sxwbo7fjxk5nq37bhp@yci5agzh46ly>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <chf57j2dkhhjzigpguldadfld5utepa4sxwbo7fjxk5nq37bhp@yci5agzh46ly>

On 13-07-26, 13:12, Manivannan Sadhasivam wrote:
> On Fri, May 08, 2026 at 02:32:30PM -0700, Ronak Raheja wrote:
> > This series adds USB PHY support for the Hawi SoC. It documents the
> > QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
> > compatible to the DWC3 USB binding, and adds the PHY initialization
> > sequences to the qmp-combo driver.
> > 
> 
> Vinod, does this series look good to you?

It doesnt apply for me, can you folks rebase and resend

-- 
~Vinod
