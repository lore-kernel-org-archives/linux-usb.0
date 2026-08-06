Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F187248424F;
	Thu,  6 Aug 2026 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033569; cv=none; b=XNA2h/9F8Oc/hMcEYgCunn5WreRBVT7MnUSV4/skMRUBSQv9GFaOxH1+ACp6UpNjW0UsdTI7FomSg9OC1VqNq9LuxB95pEAYDsrJ1mUbbhrnWvZzqk/3Xt2KptGs7+0o07jys7bEOuF3nr/C9T3whcPwzRWHdr5069VjRWGrYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033569; c=relaxed/simple;
	bh=lVkxD3h2L8G6Ew2ANCawZcaGf2X4CBFd14jw8oWESvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UYTLcq244GQ94n8Hgu1km1kfKU1Ct7lLQaglKXJHSEYtVEvjMuOkHQBGv4vsoOUgfYfXfiCPvBx6X++GjwbWvi+NgaImKhLyf9jTN64l3Gq9SIedmMk7IzeZ2PdfhtvR+LxfrufxzlxsJyWO5LJkSwpS/WPmcEWGFiyW7RTSYKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJ7dB3Gt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJ7dB3Gt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC181F00A3D;
	Thu,  6 Aug 2026 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033567;
	bh=l/pqGQLUylj7fu7Xe5MGl6jQ1rwT8sb60LmR8+ITD/g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PJ7dB3GtqowHGBiohYKQOlEo7WTFAenWvnKz8dzGJmgm2Ebo+vi2nn8Y6jJA84Nh8
	 WYHgBwiva7wY7w6MccMqJph9pvrMZoSx6BxgjKfCQCGJ1eFxGTD+nlG/GUq34fUxy8
	 l5Om8YmPqABr0H3z+oTj7YgtAEvXf1p2DY7e73D9tLfx+CsOSHFgvo01SAYlowr4eW
	 yEkjCai8jUgRnpsxwaooyX+cJV4cr7vAWmcTIdPenb5H/oU/DUs4s//SYqhg/6mlLN
	 Cm1NW+/USJUIZZBSXtsEzwXhl7R2W2povEfP5ZskDPo3Wu4JU/moN/pdFDo9wXt2l5
	 b6yRjBvKeXHVg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org
In-Reply-To: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] phy: qcom: Introduce USB support for
 Hawi
Message-Id: <178603356377.674490.863643484295472251.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:03 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 03 Aug 2026 14:44:37 +0530, Mukesh Ojha wrote:
> This series adds USB PHY support for the Hawi SoC. It documents the
> QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
> compatible to the DWC3 USB binding, and adds the PHY initialization
> sequences to the qmp-combo driver.
> 

Applied, thanks!

[1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
      commit: 19d8eca1be11bc5782f9d292d88f96ebf0cdbe7f
[2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
      commit: 7abc2c575d5b5d67349caf73509f069e6bf7445a
[4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
      commit: eca0e717aab1cc90eb0b7d8c3e8aa63ca89962a5

Best regards,
-- 
~Vinod


